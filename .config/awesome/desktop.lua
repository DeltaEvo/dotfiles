local redflat = require("redflat")
local beautiful = require("beautiful")

local wgeometry = redflat.util.desktop.wgeometry
local workarea = screen[mouse.screen].workarea
--local system = redflat.sytem

local grid = {
	width  = { 520, 520, 520 },
	height = { 180, 160, 160, 138, 18 },
	edge   = { width = { 60, 60 }, height = { 40, 40 } }
}

redflat.desktop.speedgraph(
    {
        interface = "wlp5s0",
        maxspeed = {up = 5 * 1024 ^ 2, down = 5 * 1024 ^ 2},
        crit = {up = 5 * 1024 ^ 2, down = 5 * 1024 ^ 2},
        timeout = 2,
        autoscale = false
    },
    wgeometry(grid, { 1, 1 }, workarea),
    {
		color = {
			main = "#b1222b",
			wibox = "#ffffff00",
			gray = "#404040"
		}
	}
)
