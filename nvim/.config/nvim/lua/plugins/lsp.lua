return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lsps = {
            { "lua_ls" }, -- lua
            { "marksman" }, -- markdown
            { "jedi_language_server" }, --python
            {
                "clangd", -- c, c++
                {
                    on_new = function(new_config)
                        local buf = vim.api.nvim_get_current_buf()
                        local ft = vim.bo[buf].filetype

                        if ft == "cpp" or ft == "cxx" then
                            new_config.init_options = {
                                fallbackFlags = { "--std=c++17" }
                            }
                        else
                            new_config.init_options = {}
                        end
                    end,
                }
            },
            {
                "tinymist", -- typst
                {
                    settings = {
                        formatterMode = "typstyle",
                        exportPdf = "onType",
                        semanticTokens = "disable"
                    }
                }
            },
        }

        for _, lsp in pairs(lsps) do
            local name, config = lsp[1], lsp[2]
            vim.lsp.enable(name)
            if config then
                vim.lsp.config(name, config)
            end
        end

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
