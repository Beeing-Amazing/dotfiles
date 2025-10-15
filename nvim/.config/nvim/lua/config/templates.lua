local template_folder = "$HOME/.config/nvim/templates/"

vim.keymap.set("n", ",cpp", ":-1read " .. template_folder .. "skeleton.cpp<CR>3j$\"%p13jA")
vim.keymap.set("n", ",sh", ":-1read " .. template_folder .. "skeleton.sh<CR>5ji")
vim.keymap.set("n", ",zk", ":-1read " .. template_folder .. "zk.md<CR>$\"%p2ji")
vim.keymap.set("n", ",ppl", ":-1read " .. template_folder .. "persona.md<CR>$\"%p4jA")
