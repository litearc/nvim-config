local map = require'util'.map
local m = require'config'.pmap.floaterm
local o = {}

o.setup = function()
  vim.g.floaterm_opener = 'edit'
  vim.g.floaterm_width = 0.8
  vim.g.floaterm_height = 0.8
end

o.maps = function()
  map('n', m.ranger  , ':FloatermNew ranger<cr>')
  map('n', m.terminal, ':FloatermToggle<cr>')
  map('t', m.terminal, [[<c-\><c-n>:FloatermToggle<cr>]])
end

return o
