#!/bin/bash
# Connect Google Calendar (the data behind Notion Calendar) to the dashboard.
#
# Google gives every calendar a private "Secret address in iCal format".
# vdirsyncer downloads that .ics feed into a local folder; khal reads the
# folder; the dashboard's agenda.sh reads khal.
#
# Get a URL from:
#   Google Calendar -> Settings -> <your calendar> -> "Secret address in iCal format"
#
# Usage: google-calendar-setup.sh
# Re-running it replaces the generated configs (old ones are backed up).

set -euo pipefail

VDIR_CONFIG="$HOME/.config/vdirsyncer/config"
KHAL_CONFIG="$HOME/.config/khal/config"
CALENDAR_ROOT="$HOME/.local/share/vdirsyncer/calendars"
STATUS_DIR="$HOME/.local/share/vdirsyncer/status"

say()  { printf '%s\n' "$*"; }
fail() { printf 'error: %s\n' "$*" >&2; exit 1; }

# ---------------------------------------------------------------- checks
for cmd in vdirsyncer khal; do
    command -v "$cmd" >/dev/null 2>&1 \
        || fail "$cmd is not installed. Run: sudo pacman -S --needed khal vdirsyncer"
done

say "Google Calendar -> dashboard sync setup"
say ""
say "Open Google Calendar -> Settings -> click your calendar ->"
say "copy the 'Secret address in iCal format' URL."
say "You can add several calendars (personal, work, ...)."
say ""

# ---------------------------------------------------------------- prompt
names=()
urls=()

while :; do
    printf 'Calendar name (empty to finish): '
    read -r name
    [ -z "$name" ] && break

    if ! [[ "$name" =~ ^[A-Za-z0-9_-]+$ ]]; then
        say "  Use only letters, numbers, _ and - (no spaces)."
        continue
    fi

    if printf '%s\n' "${names[@]:-}" | grep -qxF "$name"; then
        say "  '$name' is already used. Pick another name."
        continue
    fi

    printf 'ICS URL: '
    read -r url
    [ -z "$url" ] && { say "  No URL given, skipping."; continue; }

    case "$url" in
        https://*) ;;
        webcal://*) url="https://${url#webcal://}" ;;
        *) say "  URL must start with https:// (or webcal://)."; continue ;;
    esac

    case "$url" in
        *.ics*) ;;
        *) say "  Warning: this does not look like an .ics link; continuing anyway." ;;
    esac

    names+=("$name")
    urls+=("$url")
    say "  Added '$name'."
    say ""
done

[ "${#names[@]}" -gt 0 ] || fail "no calendars entered"

# ---------------------------------------------------------------- backup
stamp=$(date +%Y%m%d-%H%M%S)
mkdir -p "$(dirname "$VDIR_CONFIG")" "$(dirname "$KHAL_CONFIG")" "$CALENDAR_ROOT" "$STATUS_DIR"

[ -f "$VDIR_CONFIG" ] && cp "$VDIR_CONFIG" "$VDIR_CONFIG.bak-$stamp"
[ -f "$KHAL_CONFIG" ] && cp "$KHAL_CONFIG" "$KHAL_CONFIG.bak-$stamp"

# ---------------------------------------------------------- vdirsyncer
{
    say "[general]"
    say "status_path = \"$STATUS_DIR\""
    say ""

    for i in "${!names[@]}"; do
        n="${names[$i]}"
        say "[pair $n]"
        say "a = \"${n}_local\""
        say "b = \"${n}_remote\""
        say "collections = null"
        say ""
        say "[storage ${n}_local]"
        say "type = \"filesystem\""
        say "path = \"$CALENDAR_ROOT/$n/\""
        say "fileext = \".ics\""
        say ""
        say "[storage ${n}_remote]"
        say "type = \"http\""
        say "url = \"${urls[$i]}\""
        say ""
    done
} > "$VDIR_CONFIG"
chmod 600 "$VDIR_CONFIG"

# ---------------------------------------------------------------- khal
{
    say "[calendars]"
    say ""

    for n in "${names[@]}"; do
        say "[[$n]]"
        say "path = \"$CALENDAR_ROOT/$n/\""
        say "readonly = true"
        say ""
    done

    say "[locale]"
    say "timeformat = %H:%M"
    say "dateformat = %d.%m."
    say "longdateformat = %d.%m.%Y"
    say "datetimeformat = %d.%m. %H:%M"
    say "longdatetimeformat = %d.%m.%Y %H:%M"
    say "firstweekday = 0"
    say ""
    # NOTE: no [default] default_calendar here. khal refuses to start when the
    # default calendar is read_only, and every synced Google calendar is.
} > "$KHAL_CONFIG"
chmod 600 "$KHAL_CONFIG"

# ---------------------------------------------------------------- sync
say ""
say "Config written. Syncing (this can take a moment)..."
mkdir -p "$CALENDAR_ROOT"
for n in "${names[@]}"; do mkdir -p "$CALENDAR_ROOT/$n"; done

if ! vdirsyncer sync; then
    fail "vdirsyncer sync failed. Check the URL(s) and your connection."
fi

# ---------------------------------------------------------------- verify
say ""
say "Calendars configured: ${names[*]}"
say ""
say "Upcoming events:"
khal list today 7d 2>/dev/null | head -20 || true
say ""
say "Done. The dashboard agenda updates automatically."
if command -v systemctl >/dev/null 2>&1 && systemctl --user show-environment >/dev/null 2>&1; then
    systemctl --user enable --now vdirsyncer.timer >/dev/null 2>&1 \
        && say "Periodic sync enabled (every 15 minutes)." \
        || say "Enable periodic syncing with: systemctl --user enable --now vdirsyncer.timer"
else
    say "Enable periodic syncing with:"
    say "  systemctl --user enable --now vdirsyncer.timer"
fi
