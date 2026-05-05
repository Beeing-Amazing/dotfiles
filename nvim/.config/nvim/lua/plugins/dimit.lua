return {
    "rosstang/dimit.nvim",
    config = function()
        require("dimit").setup({
            bgcolor = "#1a1b26",
            highlight_group = "Dimit",
            auto_dim = true,
            dim_elements = {
                "ColorColumn",
                "CursorColumn",
                "CursorLine",
                "CursorLineFold",
                "CursorLineNr",
                "CursorLineSign",
                "EndOfBuffer",
                "FoldColumn",
                "LineNr",
                "NonText",
                "Normal",
                "SignColumn",
                "VertSplit",
                "Whitespace",
                "WinBarNC",
                "WinSeparator",
            },
        })
    end,
}
