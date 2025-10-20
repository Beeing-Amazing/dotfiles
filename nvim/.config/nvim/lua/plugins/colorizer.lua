return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup({
            "*", -- enable for all filetypes
            markdown = { names = false }, -- override specific behavior
            python = { names = false }, -- override specific behavior
        })
    end
}
