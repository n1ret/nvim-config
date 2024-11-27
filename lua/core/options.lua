local opt = vim.opt

---@param spaces int
local set_tab_size = function(spaces)
  opt.tabstop = spaces
  opt.shiftwidth = spaces
  opt.softtabstop = spaces
end

-- tabs & indentation
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
set_tab_size(4)

-- set 2 spaces tabs in files with this extensions
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"lua", "yaml", "toml", "xml", "html", "css"},
  callback = function() set_tab_size(2) end
})

-- line wrapping
opt.wrap = false
opt.linebreak = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- current line highlight
opt.cursorline = true

-- split windows
opt.splitright = true
opt.splitbelow = true

-- number lines
opt.number = true
opt.relativenumber = true

-- consider string-string as whole word
opt.iskeyword:append("-")
opt.iskeyword:remove("/.")

-- turn on undo file
opt.undofile = true

-- turn off hidden buffers
-- opt.hidden = false

-- remember last cursor position
vim.api.nvim_create_autocmd({'BufWinEnter'}, {
  desc = 'return cursor to where it was last time closing the file',
  pattern = '*',
  command = 'silent! normal! g`"zv',
})

