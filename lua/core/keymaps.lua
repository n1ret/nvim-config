vim.g.mapleader = " "

-- Quit
vim.keymap.set('n', "<C-q>", "<cmd>:qa<CR>")

-- Saving a file via Ctrl+S
vim.keymap.set({'i', 'n'}, "<C-s>", "<cmd>:w<CR>")

-- Clear code highlighting
vim.keymap.set({'n'}, "<esc>", "<cmd>:let @/ = \"\"<CR>")

