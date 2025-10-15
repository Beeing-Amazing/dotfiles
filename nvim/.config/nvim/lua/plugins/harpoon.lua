return {
    "thePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({
            global_settings = {
                save_on_toggle = true,
                save_on_change = true,
            }
        })

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" } )
        vim.keymap.set("n", "<leader>hh", function() harpoon:list():select(1) end, { desc = "Harpoon to 1" } )
        vim.keymap.set("n", "<leader>hj", function() harpoon:list():select(2) end, { desc = "Harpoon to 2" })
        vim.keymap.set("n", "<leader>hk", function() harpoon:list():select(3) end, { desc = "Harpoon to 3" })
        vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(4) end, { desc = "Harpoon to 4" })

    end
}
