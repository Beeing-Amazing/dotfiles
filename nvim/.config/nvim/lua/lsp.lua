-- thanks to https://kristun.dev/posts/migrating-to-neovim-0-10-lsp-core/
-- require("lspconfig") -- DEPRECATED

-- Global defaults (applies to all LSPs)
vim.lsp.config("*", {
    flags = {
        debounce_text_changes = 150,
    },
})

-- Lua
vim.lsp.config['lua_ls'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.git' },
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
}

-- Markdown (marksman)
vim.lsp.config['marksman'] = {
    cmd = { 'marksman', 'server' },
    filetypes = { 'markdown' },
    root_markers = { '.git' },
}

-- Python (jedi)
vim.lsp.config['jedi_language_server'] = {
    cmd = { 'jedi-language-server' },
    filetypes = { 'python' },
    root_markers = { '.git', 'pyproject.toml', 'requirements.txt' },
}

-- C/C++
vim.lsp.config['clangd'] = {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    root_markers = { '.git', 'compile_commands.json' },
}

-- Typst (tinymist)
vim.lsp.config['tinymist'] = {
    cmd = { 'tinymist' },
    filetypes = { 'typst' },
    root_markers = { '.git' },
}

-- Enable the listed servers.
-- This triggers Neovim to look for configurations in the runtime path
-- (both from lspconfig and your custom ~/.config/nvim/lsp/)
vim.lsp.enable({
    "lua_ls",
    "marksman",
    "jedi_language_server",
    "clangd",
    "tinymist",
})
