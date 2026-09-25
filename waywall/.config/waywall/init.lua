-- Bootstrap plug.waywall
local plug_repo = "https://github.com/its-saanvi/plug.waywall"
local waywall_share = os.getenv("XDG_DATA_HOME") or (os.getenv("HOME") .. "/.local/share") .. "/waywall"
local plug_path = waywall_share .. "/plug"
local file, err = io.open(plug_path .. "/.check_temp", "w")
if not file and err then
	if string.find(err, "No such file or directory") then
		if not os.execute("mkdir -p " .. waywall_share) then
			print("Failed to create waywall share directory")
		end
		if not os.execute("git clone " .. plug_repo .. " " .. plug_path) then
			print("Failed to clone plug.waywall")
		end
	end
else
	file:close()
	os.remove(plug_path .. "/.check_temp")
end
package.path = package.path .. ";" .. waywall_share .. "/plug/?/init.lua" .. ";" .. plug_path .. "/?.lua"
local plug = require("plug")

-- ==== WAYWALL GENERIC CONFIG ====
local main = require("main")
local remaps = require("remaps")

local cfg = {
    debug_text = true,

    -- ==== LOOKS ====
    resolution = { 1366, 768 },

    bg_col = "#000000",
    toggle_bg_picture = true,
    text_col = "#FFFFFF",
    pie_chart_1 = "#EC6E4E",
    pie_chart_2 = "#46CE66",
    pie_chart_3 = "#E446C4",

    ninbot_anchor = {
        position = "topright", -- topleft, top, topright, left, right, bottomleft, bottomright
        x = 0,
        y = 130,               -- offset
    },
    ninbot_opacity = 0.7,        -- 0 to 1


    -- ==== ALTERNATIVE RESOLUTIONS ====
    thin_res = { 340, 768 },
    wide_res = { 1366, 300 },
    tall_res = { 384, 16384 },


    -- ==== MIRRORS ====
    e_count = { enabled = true, x = 900, y = 300, size = 3, colorkey = true, show_c = true },

    thin_pie = { enabled = true, x = 900, y = 400, size = 3, colorkey = false }, -- Turning off colorkeying also maintains the original pie chart's dimensions and shows the percentages
    tall_pie = { enabled = true, x = 900, y = 400, size = 3, colorkey = false }, -- Leave same as thin for seamlessness

    thin_percent = { enabled = false, x = 900, y = 400, size = 3 },
    tall_percent = { enabled = false, x = 900, y = 400, size = 3 }, -- Leave same as thin for seamlessness
    percentages_match_text = true,                                  -- Enabling this makes the percentages match the text color rather than the pie colors


    measuring_window = { x = 30, y = 768 / 2, size = 6.6 },
    stretched_measure = true,


    -- ==== MACROS ====
    -- resolution changes
    thin = { key = "*-H", f3_safe = false, ingame_only = true },
    wide = { key = "*-5", f3_safe = true, ingame_only = true },
    tall = { key = "*-N", f3_safe = false, ingame_only = true },

    -- startup actions
    toggle_fullscreen_key = "Shift-O",
    launch_paceman_key = "Shift-P",

    -- during game actions
    toggle_ninbot_key = "*-apostrophe",
    toggle_remaps_key = "*-Return",


    -- ==== KEYBOARD ====
    xkb_config = {     -- set any setting to nil if unwanted
        enabled = false,
        layout = "mc", -- ~/.config/xkb/symbols/mc
        rules = nil,   -- ~/.config/xkb/rules/...
        variant = "basic",
        options = "caps:none",
    },
    remaps_text_config = { text = "filthy casual", x = 100, y = 100, size = 2, color = "#000000" },


    -- ==== MISC ====
    sens_change = { enabled = false, normal = 1.0, tall = 0.1, raw_input = false }, -- setting raw_input to true will enable sens changing via maccel
    enable_resize_animations = false,

}

return main(cfg, remaps)
