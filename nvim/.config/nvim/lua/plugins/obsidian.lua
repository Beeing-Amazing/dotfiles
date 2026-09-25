local obsidian_path = vim.fn.expand("~/Vaults")

return {
    -- NOTE: community fork of epwalsh/obsidian.nvim
    "obsidian-nvim/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit

    event = {
        "BufReadPre *.md",
        "BufNewFile *.md",
    },
    init = function()
        local group = vim.api.nvim_create_augroup("ObsidianLazyLoad", {})

        vim.api.nvim_create_autocmd("VimEnter", {
            group = group,
            callback = function()
                local cwd = vim.fn.getcwd()
                local buf = vim.api.nvim_buf_get_name(0)

                local function inside(path, root)
                    return path == root
                    or path:sub(1, #root + 1) == root .. "/"
                end

                if inside(cwd, obsidian_path) or inside(buf, obsidian_path) then
                    require("lazy").load({
                        plugins = { "obsidian.nvim" },
                    })
                end
            end,
        })
    end,

    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
        -- Recommended
        "saghen/blink.cmp",
        -- "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        legacy_commands = false,
        workspaces = {
            {
                name = "personal",
                path = vim.fs.joinpath(obsidian_path, "personal"),
                overrides = {
                    templates = {
                        folder = "templates",
                        date_format = "%Y-%m-%d",
                        alias_format = "%B %-d, %Y",
                    },
                    daily_notes = {
                        folder = "journal",
                        date_format = "YYYY/MM/DD",
                        alias_format = "%B %-d, %Y",
                        default_tags = { "journal", "daily" },
                        template = "daily.md"
                    },
                }
            },
            {
                name = "no-vault",
                path = function()
                    -- alternatively use the CWD:
                    -- return assert(vim.fn.getcwd())
                    return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
                end,
                overrides = {
                    notes_subdir = vim.NIL,  -- have to use 'vim.NIL' instead of 'nil'
                    new_notes_location = "current_dir",
                    templates = {
                        folder = vim.NIL,
                    },
                    frontmatter = { enabled = false },
                },
            },
        },
        templates = {
            folder = "templates"
        },
        -- completion = {
        --     nvim_cmp = true,
        --     min_chars = 2
        -- },
        frontmatter = { enabled = true },
        link = { style = "wiki", format = "shortest" },
    },

    vim.keymap.set("n", "<leader>nn", function()
        vim.cmd("Obsidian today")
    end, { desc = "Today's note", }),
    vim.keymap.set("n", "<leader>nd", function()
        vim.cmd("Obsidian dailies")
    end, { desc = "List dailies", }),
    vim.keymap.set("n", "<leader>ny", function()
        vim.cmd("Obsidian yesterday")
    end, { desc = "Yesterday's note", }),
}
