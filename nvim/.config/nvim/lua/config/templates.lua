local template_folder = "$HOME/.config/nvim/templates/"

vim.keymap.set("n", ",cpp", ":-1read " .. template_folder .. "skeleton.cpp<CR>3j$\"%p13jA")
vim.keymap.set("n", ",sh", ":-1read " .. template_folder .. "skeleton.sh<CR>5ji")
