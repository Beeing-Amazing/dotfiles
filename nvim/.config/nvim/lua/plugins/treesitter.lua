return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup {
            ensure_installed = {
                "vimdoc",
                "c",
                "lua",
                "markdown",
                "cpp",
                "python",
                "json",
                "html",
                "css",
                "typst",
                "rust"
            },
      ignore_install = {},
      auto_install = false,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
