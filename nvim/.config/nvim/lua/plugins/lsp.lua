return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lsp = require("lspconfig");
        lsp.lua_ls.setup({}) -- lua
        lsp.marksman.setup({}) -- markdown
        lsp.clangd.setup({}) -- c++
        lsp.jedi_language_server.setup({}) -- python
        lsp.tinymist.setup({ -- typst
            settings = {
                formatterMode = "typstyle",
                exportPdf = "onType",
                semanticTokens = "disable"
            }
        })


        vim.diagnostic.config({
            -- signs = {
            --     text = signs -- Enable signs in the gutter
            -- },
            virtual_text = true,  -- Specify Enable virtual text for diagnostics
            underline = true,     -- Specify Underline diagnostics
            update_in_insert = false,  -- Keep diagnostics active in insert mode
        })
    end,
    dependencies = {
        {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    }
}
