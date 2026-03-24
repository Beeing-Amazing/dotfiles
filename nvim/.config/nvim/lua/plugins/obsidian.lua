return {
    -- NOTE: community fork of epwalsh/obsidian.nvim
    "obsidian-nvim/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
        -- Recommended
        "saghen/blink.cmp",
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        legacy_commands = false,
        workspaces = {
            {
                name = "personal",
                path = "~/Vaults/personal",
                overrides = {
                    notes_subdir = "journal",
                    templates = {
                        folder = "templates",
                        date_format = "%Y-%m-%d",
                        alias_format = "%B %-d, %Y",
                    },
                    daily_notes = {
                        date_format = "%Y-%m-%d",
                        alias_format = "%B %-d, %Y",
                        default_tags = { "daily" },
                        template = "daily.md"
                    },
                }
            },
        },
        templates = {
            folder = "templates"
        },
        -- completion = {
        --     nvim_cmp = true,
        --     min_chars = 2
        -- },
        frontmatter = { enabled = false },
        link = { style = "wiki" },
    }
}
