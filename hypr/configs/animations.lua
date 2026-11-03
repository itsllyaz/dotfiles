hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("myBezier",   { type = "bezier", points = { {0.05, 0.9},  {0.1, 1.0}  } })
hl.curve("been",       { type = "bezier", points = { {0.24, 0.9},  {0.25, 0.91} } })
hl.curve("been2",      { type = "bezier", points = { {0.0, 0.94},  {0.5, 0.99} } })
hl.curve("menu_decel", { type = "bezier", points = { {0.1, 1.0},   {0.0, 1.0}  } })
hl.curve("linear",     { type = "bezier", points = { {0.0, 0.0},   {1.0, 1.0}  } })
hl.curve("wind",       { type = "bezier", points = { {0.05, 0.9},  {0.1, 1.0}  } })
hl.curve("slow",       { type = "bezier", points = { {0.0, 0.85},  {0.3, 1.0}  } })
hl.curve("overshot",   { type = "bezier", points = { {0.7, 0.6},   {0.1, 1.0}  } })
hl.curve("bounce",     { type = "bezier", points = { {1.0, 1.0},   {0.1, 0.85} } })
hl.curve("slingshot",  { type = "bezier", points = { {1.0, -1.0},  {0.15, 1.0} } })

hl.animation({ leaf = "windows",     enabled = true, speed = 5, bezier = "bounce", style = "popin" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "wind",   style = "slide" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 5, bezier = "wind",   style = "slide" })
