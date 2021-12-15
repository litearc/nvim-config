local map = require'util'.map
local m = require'config'.pmap.bufferline
local o = {}

o.setup_plug = function(c)
  require'bufferline'.setup{
    options = {
      offsets = {
        {
          filetype = 'NvimTree',
          padding = 1
        }
      },
    },
    highlights = {
      buffer_selected       = {guifg = c.colors.b5, guibg = c.colors.b0, gui = 'none'},
      buffer_visible        = {guifg = c.colors.b3, guibg = c.colors.b0, gui = 'none'},
      close_button          = {guifg = c.colors.b3, guibg = c.colors.b1, gui = 'none'},
      close_button_selected = {guifg = c.colors.b5, guibg = c.colors.b0, gui = 'none'},
      close_button_visible  = {guifg = c.colors.b5, guibg = c.colors.b0, gui = 'none'},
      modified              = {guifg = c.colors.bd, guibg = c.colors.b1, gui = 'none'},
      modified_selected     = {guifg = c.colors.bd, guibg = c.colors.b0, gui = 'none'},
      modified_visible      = {guifg = c.colors.bd, guibg = c.colors.b0, gui = 'none'},
      separator             = {guifg = c.colors.b1, guibg = c.colors.b1, gui = 'none'},
      separator_selected    = {guifg = c.colors.b1, guibg = c.colors.b1, gui = 'none'},
      separator_visible     = {guifg = c.colors.b1, guibg = c.colors.b1, gui = 'none'},
      tab_close             = {guifg = c.colors.b5, guibg = c.colors.b1, gui = 'none'},
      tab                   = {guifg = c.colors.b5, guibg = c.colors.b1, gui = 'none'},
      tab_selected          = {guifg = c.colors.b5, guibg = c.colors.b0, gui = 'none'},
      background            = {guifg = c.colors.b3, guibg = c.colors.b1, gui = 'none'},
      fill                  = {guifg = c.colors.b1, guibg = c.colors.b1, gui = 'none'},
      indicator_selected    = {guifg = c.colors.b0, guibg = c.colors.b0, gui = 'none'},
      duplicate             = {guifg = c.colors.b3, guibg = c.colors.b1, gui = 'none'},
      duplicate_selected    = {guifg = c.colors.b5, guibg = c.colors.b0, gui = 'none'},
      duplicate_visible     = {guifg = c.colors.b5, guibg = c.colors.b0, gui = 'none'},
    }
  }
end

o.setup = function()
  local c = require'theme'.get_colors()
  o.setup_plug(c)
end

o.maps = function()
  map('n', m.cyc_prev , ':BufferLineCyclePrev<cr>')
  map('n', m.cyc_next , ':BufferLineCycleNext<cr>')
  map('n', m.move_prev, ':BufferLineMovePrev<cr>')
  map('n', m.move_next, ':BufferLineMoveNext<cr>')
end

return o
