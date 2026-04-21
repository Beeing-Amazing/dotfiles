local function inactive()
    return "OFF"
end

return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },

        opts = {
            options = {
                icons_enabled = true,
                theme = "tokyonight",
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
                        separator = { right = "" },
                        path = 1,
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
                lualine_y = {
                    {
                        "progress",
                        separator = { left = "" },
                    }
                },
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
    },
}
