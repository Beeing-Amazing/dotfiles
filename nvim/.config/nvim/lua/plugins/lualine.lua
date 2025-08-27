local function inactive()
    return "OFF"
end

return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },

        opts = function()
            local colors = {
                fg = "#181926",
                fg_alt = "#cad3f5",
                mauve = "#c6a0f6",
                yellow = "#eed49f",
                green = "#a6da95",
                sapphire = "#7dc4e4",
                red = "#ed8796",
                mantle = "#1e2030",
                bg = "none"
            }
            return {
                options = {
                    icons_enabled = true,
                    -- transparent theme
                    theme = {
                        inactive = {
                            a = { fg = colors.fg_alt, bg = colors.mantle, gui = "bold" },
                            b = { fg = colors.fg_alt, bg = colors.bg },
                            c = { bg = colors.bg }
                        },
                        normal = {
                            a = { fg = colors.fg, bg = colors.mauve, gui = "bold" },
                            b = { fg = colors.mauve, bg = colors.bg },
                            c = { bg = colors.bg }
                        },
                        insert = {
                            a = { fg = colors.fg, bg = colors.yellow, gui = "bold" },
                            b = { fg = colors.yellow, bg = colors.bg },
                            c = { bg = colors.bg }
                        },
                        visual = {
                            a = { fg = colors.fg, bg = colors.green, gui = "bold" },
                            b = { fg = colors.green, bg = colors.bg },
                            c = { bg = colors.bg }
                        },
                        replace = {
                            a = { fg = colors.fg, bg = colors.sapphire, gui = "bold" },
                            b = { fg = colors.sapphire, bg = colors.bg },
                            c = { bg = colors.bg }
                        },
                        command = {
                            a = { fg = colors.fg, bg = colors.red, gui = "bold" },
                            b = { fg = colors.red, bg = colors.bg },
                            c = { bg = colors.bg }
                        },
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
                    lualine_a = {
                        {
                            inactive,
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
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
            }
        end,
    },
}
