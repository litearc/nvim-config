local g = vim.g
local o = {}

o.setup = function()
  g.neoformat_basic_format_align = 1
  g.neoformat_basic_format_trim = 1
end

return o
