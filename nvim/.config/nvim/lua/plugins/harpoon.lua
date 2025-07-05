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
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon toggle quick menu" } )

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon to 1" } )
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "Harpoon to 2" })
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "Harpoon to 3" })
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "Harpoon to 4" })

    end
}
