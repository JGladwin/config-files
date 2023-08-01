local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-f>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-p>", ui.nav_prev)
vim.keymap.set("n", "<C-n>", ui.nav_next)
-- I don't know how to do for C-l for last file .nav_file(-1) ?
