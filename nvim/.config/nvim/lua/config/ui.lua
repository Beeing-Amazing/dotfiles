-- transparent window and float bg
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- transparent status line
vim.cmd("hi! StatusLine guibg=NONE")
