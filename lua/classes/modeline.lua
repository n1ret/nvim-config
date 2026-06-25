---@class Modeline
---@field callbacks table<string, fun(buf: number)>
local M = {
  callbacks = {},
}

---Register a new keyword
---@param keyword string
---@param callback fun(buf: number)
M.register = function(keyword, callback)
  if M.callbacks[keyword] ~= nil then
    error("The modeline keyword already exists", 2)
  end

  M.callbacks[keyword] = callback
end

---Process the buffer
---@param buf number
M.process = function(buf)
  local modelines = vim.o.modelines
  if modelines == 0 then
    return
  end

  local line_count = vim.api.nvim_buf_line_count(buf)

  local function process_line(line)
    local modeline = line:match("nvim:%s*(.+)")
    if modeline == nil then
      return
    end

    for keyword in modeline:gmatch("[%w_%-]+") do
      local callback = M.callbacks[keyword]
      if callback ~= nil then
        callback(buf)
      end
    end
  end

  local n = math.min(modelines, line_count)

  for lnum = 0, n - 1 do
    process_line(vim.api.nvim_buf_get_lines(buf, lnum, lnum + 1, false)[1] or "")
  end

  local start = math.max(line_count - n, n)
  for lnum = start, line_count - 1 do
    process_line(vim.api.nvim_buf_get_lines(buf, lnum, lnum + 1, false)[1] or "")
  end
end

return M
