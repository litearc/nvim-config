local map = require'util'.map
local tog_treesitter = require'config'.pmap.tog_treesitter

local o = {}

o.setup = function()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = 'maintained',   -- one of 'all', 'maintained', or a list of languages
    ignore_install = {},               -- list of parsers to ignore installing
    highlight = {
      enable = true,                   -- false will disable the whole extension
      disable = {},                    -- list of language that will be disabled
    },
  }
end

o.maps = function()
  map('n', tog_treesitter, ':TSBufToggle highlight<cr>')
end

return o