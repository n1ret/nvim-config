vim.g.mapleader = " "

-- Clear code highlighting
vim.keymap.set({'n'}, "<esc>", "<cmd>:let @/ = \"\"<CR>")

-- Moving cursor by pressing alt and hjkl in insert mode
keys = "hjkl"
for i=1,#keys do
  local c = keys:sub(i, i)
  vim.keymap.set({'i'}, "<A-"..c..">", "<C-O>"..c)
end

