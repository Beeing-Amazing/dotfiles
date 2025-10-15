return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = "night",
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
        -- https://www.reddit.com/r/neovim/comments/16gspa9/transparent_lualine_with_lazyvim_configuration/
        on_colors = function(colors)
            colors.bg_statusline = colors.none
        end,
        transparent = true,
    },
}
