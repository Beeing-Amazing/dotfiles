return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },

        opts = function()
            local colors = {
                color0 = "#092236",
                color1 = "#c6a0f6",
                color2 = "#eed49f",
                color3 = "#a6da95",
                color4 = "#7dc4e4",
                color5 = "#ed8796",
                color6 = "#181926",
            }
            return {
                options = {
                    icons_enabled = true,
                    -- transparent theme
                    theme = {
                        normal = { a = { fg = colors.color0, bg = colors.color1, gui = "bold" }, b = { fg = colors.color1, bg = "none" }, c = { bg = "none" } },
                        insert = { a = { fg = colors.color0, bg = colors.color2, gui = "bold" }, b = { fg = colors.color2, bg = "none" }, c = { bg = "none" } },
                        visual = { a = { fg = colors.color0, bg = colors.color3, gui = "bold" }, b = { fg = colors.color3, bg = "none" }, c = { bg = "none" } },
                        replace = { a = { fg = colors.color0, bg = colors.color4, gui = "bold" }, b = { fg = colors.color4, bg = "none" }, c = { bg = "none" } },
                        command = { a = { fg = colors.color0, bg = colors.color5, gui = "bold" }, b = { fg = colors.color5, bg = "none" }, c = { bg = "none" } },
                        inactive = { a = { fg = colors.color5, bg = colors.color6, gui = "bold" }, b = { fg = colors.color5, bg = "none" }, c = { bg = "none" } },
                    },
                    section_separators = "",
                    component_separators = "",
                },
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            separator = { right = "" },
                        }
                    },
                    lualine_b = {
                        {
                            "filename",
                            file_status = false,
                            path = 0,
                        },
                    },
                    lualine_c = {
                        {
                            "diff",
                            diff_color = {
                                added = { fg = "#a6da95" },
                                modified = { fg = "#eed49f" },
                                removed = { fg = "#ed8796" }
                            },
                        },
                        {
                            "diagnostics",
                            sources = { "nvim_diagnostic", "nvim_lsp" },
                            sections = { "error", "warn" },
                        }
                    },
                    lualine_x = { "lsp_status" },
                    lualine_y = { "progress" },
                    lualine_z = {
                        {
                            "location",
                            separator = { left = "" },
                        }
                    },
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
