return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        keywords = {
            -- TODO: lorem ipsum
            TODO = { icon = " ", color = "info" },
            -- NOTE: lorem ipsum
            NOTE = { icon = " ", color = "hint", alt = { "INFO", "BTW" } },
            -- FIX: lorem ipsum
            FIX = { icon = " ", color = "error", alt = { "ERR", "ERROR", "BUG", "ISSUE" } },
            -- WARN: lorem ipsum
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            -- HACK: lorem ipsum
            HACK = { icon = " ", color = "warning" },
            -- TEST: lorem ipsum
            TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        highlight = { keyword = "wide", multiline_context = 20 }
    }
}
