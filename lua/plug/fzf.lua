local map = require'util'.map
local c = require'config'.pmap.fzf

local o = {}

o.setup = function()
end

o.maps = function()
  -- grep but uses ignore-file
  vim.cmd [[command! -bang -nargs=* Mg call fzf#vim#grep('rg --ignore-file=.gitignore --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)]]
  map('n', c.buffers   , ':Buffers<cr>')
  map('n', c.commits   , ':BCommits<cr>')
  map('n', c.files     , ':Files<cr>')
  map('n', c.history   , ':History<cr>')
  map('n', c.lines     , ':Lines<cr>')
  map('n', c.grep      , ':Mg ', {silent = false})
  map('n', c.grep_cword, ':Mg <c-r><c-w><cr>') -- <c-r><c-w> gets word under cursor
end

return o
