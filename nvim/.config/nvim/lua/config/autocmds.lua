-- create missing dirs
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local dir = vim.fn.expand("<afile>:p:h")
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p")
        end
    end,
})

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ timeout = 300 })
    end,
})

-- filetype specific keymaps
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function()
        -- autopairs
        vim.keymap.set("i", "$", "$$<Esc>i", {buffer = true})
    end
})
