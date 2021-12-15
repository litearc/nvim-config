local map = require'util'.map
local tog_comment = require'config'.pmap.tog_comment

local o = {}

o.setup = function()
  require'nvim_comment'.setup {
    marker_padding = true,
    comment_empty = true,
    create_mappings = false,
    hook = nil,
  }
end

o.maps = function()
  map('n', tog_comment, ':CommentToggle<cr>')
  map('v', tog_comment, ':CommentToggle<cr>')
end

return o
