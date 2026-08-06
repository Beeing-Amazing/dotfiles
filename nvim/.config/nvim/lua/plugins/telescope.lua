return {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    config = function()
        -- https://github.com/nvim-telescope/telescope.nvim/issues/3487
        require("telescope").setup({
            defaults = {
                preview = { treesitter = false, },
            },
        })

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" } )
        vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Telescope find git files" } )
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string( { search = vim.fn.input("Grep > ") } )
        end, { desc = "Telescope grep string" } )

    end,
}
