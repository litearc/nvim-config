local map = require'core.util'.map
local m = require'core.config'.pmap.floaterm
local o = {}

o.config = function()
  vim.g.floaterm_opener = 'edit'
  vim.g.floaterm_width = 0.8
  vim.g.floaterm_height = 0.8

  map('n', m.ranger  , ':FloatermNew ranger<cr>')
  map('n', m.terminal, ':FloatermToggle<cr>')
  map('t', m.terminal, [[<c-\><c-n>:FloatermToggle<cr>]])
end

return o
