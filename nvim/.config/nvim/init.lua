-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)


require("config.autocmds")
require("config.options")
require("config.keymaps")
require("config.templates")


-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- add your plugins here
        { "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            opts = {
                style = "night",
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
                -- https://www.reddit.com/r/neovim/comments/16gspa9/transparent_lualine_with_lazyvim_configuration/
                on_colors = function(colors)
                    colors.bg_statusline = colors.none
                end,
            },
        },
        { 'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate',
            lazy = false,
        },
        { import = "plugins" },
    },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

-- after v0.12 start vim.treesitter manually instead of nvim-treesitter.setup()
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})


-- Setup lsp
require("lsp")


vim.cmd[[colorscheme tokyonight]]
