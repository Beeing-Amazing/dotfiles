return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status" } )
        vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git Blame" } )
        vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git Log" } )
    end
}
