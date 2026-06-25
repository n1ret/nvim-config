-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false

---@class N1ret
---@field modeline Modeline
N1ret = {
  modeline = require("classes.modeline")
}

N1ret.modeline.register("nodiagnostics", function (buf)
  vim.diagnostic.enable(false, { bufnr = buf })
end)

