-- ==== MUSIC OVERLAY ====
local cfg = {
    overlay = true,
    look = {
        X = 1038,
        Y = 648,
        color = '#000000',
        size = 1,
        max_len = 30,
    },
    previous = "F10",
    play_pause = "F11",
    next = "F12",
}

return {
    url = "https://github.com/arjuncgore/ww_music_overlay",
    config = function(config)
        require("music_overlay.init").setup(config, cfg)
    end,
    name = "music_overlay",
    update_on_load = true,
}
