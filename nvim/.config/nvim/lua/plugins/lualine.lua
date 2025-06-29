return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },

        opts = function()
            local colors = {
                color0 = "#092236",
                color1 = "#ff5874",
                color2 = "#c3ccdc",
                color3 = "#1c1e26",
                color6 = "#a1aab8",
                color7 = "#828697",
                color8 = "#ae81ff",
            }
            return {
                options = {
                    icons_enabled = true,
                    -- transparent theme
                    theme = {
                        normal = { a = { fg = colors.color0, bg = colors.color7, gui = "bold" }, b = { bg = "none" }, c = { bg = "none" } },
                        insert = { a = { fg = colors.color0, bg = colors.color2, gui = "bold" }, b = { bg = "none" }, c = { bg = "none" } },
                        visual = { a = { fg = colors.color0, bg = colors.color8, gui = "bold" }, b = { bg = "none" }, c = { bg = "none" } },
                        replace = { a = { fg = colors.color0, bg = colors.color1, gui = "bold" }, b = { bg = "none" }, c = { bg = "none" } },
                        command = { a = { fg = colors.color0, bg = colors.color7, gui = "bold" }, b = { bg = "none" }, c = { bg = "none" } },
                        inactive = { a = { fg = colors.color0, bg = colors.color3, gui = "bold" }, b = { bg = "none" }, c = { bg = "none" } },
                    },
                    component_separators = "",
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        {
                            "filename",
                            path = 0,
                        },
                    },
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
            }
        end,
    },
}
