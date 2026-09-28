return {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { "nvim-telescope/telescope-file-browser.nvim", },
    },

    config = function()
        -- https://github.com/nvim-telescope/telescope.nvim/issues/3487
        local fb_actions = require "telescope._extensions.file_browser.actions"

        require("telescope").setup({
            defaults = {
                preview = { treesitter = false, },
            },
            extensions = {
                file_browser = {
                    theme = "dropdown",
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    hidden = { file_browser = true, folder_browser = true },
                    mappings = {
                        ["i"] = {
                            -- your custom insert mode mappings
                            ["jk"] = function()
                                vim.cmd("stopinsert")
                            end,
                            ["kj"] = function()
                                vim.cmd("stopinsert")
                            end,

                            ["<C-x>"] = function(prompt_bufnr)
                                require("telescope.actions.set").edit(prompt_bufnr, "split")
                            end,
                            ["<C-v>"] = function(prompt_bufnr)
                                require("telescope.actions.set").edit(prompt_bufnr, "vsplit")
                            end,

                            ["<C-h>"] = fb_actions.goto_cwd,
                            ["<C-w>"] = function(prompt_bufnr)
                                local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                                local fb_utils = require("telescope._extensions.file_browser.utils")
                                local finder = current_picker.finder
                                local alt = vim.fn.expand("#:p:h")   -- dir of last buffer (alternate file)  
                                if alt == "" then alt = vim.loop.cwd() end
                                finder.path = alt
                                fb_utils.redraw_border_title(current_picker)
                                current_picker:refresh(
                                    finder,
                                    { new_prefix = fb_utils.relative_path_prefix(finder), reset_prompt = true, multi = current_picker._multi }
                                )
                            end,
                        },
                        ["n"] = {
                            -- your custom normal mode mappings
                            ["%"] = fb_actions.create,
                            ["h"] = fb_actions.goto_cwd,
                            ["w"] = function(prompt_bufnr)
                                local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                                local fb_utils = require("telescope._extensions.file_browser.utils")
                                local finder = current_picker.finder
                                local alt = vim.fn.expand("#:p:h")   -- dir of last buffer (alternate file)  
                                if alt == "" then alt = vim.loop.cwd() end
                                finder.path = alt
                                fb_utils.redraw_border_title(current_picker)
                                current_picker:refresh(
                                    finder,
                                    { new_prefix = fb_utils.relative_path_prefix(finder), reset_prompt = true, multi = current_picker._multi }
                                )
                            end,
                        },
                    }
                }
            }
        })

        require("telescope").load_extension "fzf"
        require("telescope").load_extension "file_browser"
        local builtin = require("telescope.builtin")

        local fb = require("telescope").extensions.file_browser
        vim.keymap.set("n", "<leader>pv", function()
            fb.file_browser( { path = vim.fn.expand("%:p:h"), select_buffer = true } )
        end, { desc = "Telescope view files" } )


        vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" } )
        vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Telescope find git files" } )

        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string( { search = vim.fn.input("Grep > ") } )
        end, { desc = "Telescope grep string" } )

    end,
}
