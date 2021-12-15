local tog_trouble = require'config'.pmap.tog_trouble
local map = require'util'.map
local m = require'config'.pmap.trouble

local o = {}

o.setup = function()
  require('trouble').setup {
    action_keys = m.keys
  }
end

o.maps = function()
  map('n', m.toggle, '<cmd>TroubleToggle<cr>')
end

return o
