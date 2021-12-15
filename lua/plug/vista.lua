local map = require'util'.map
local tog_vista = require'config'.pmap.tog_vista
local is_lsp_active_ft = require'util'.is_lsp_active_ft
local t = require'util'.t
local g = vim.g

local o = {}

o.setup = function()
  g['vista#renderer#enable_icon'] = 1
  g['vista_default_executive'] = 'ctags'
  g['vista_stay_on_open'] = 0
end

local is_vista_open = function()
  local nwins = vim.fn.winnr('$')
  for i = 1,nwins do
    local ibuf = vim.fn.winbufnr(i)
    local wtype = vim.fn.getbufvar(ibuf, '&filetype')
    local prefix = 'vista'
    if wtype:find(prefix, 1, #prefix) then
      return true
    end
  end
  return false
end

_G.toggle_vista = function()
  if is_vista_open() then
    return t':Vista!<cr>'
  end
  if is_lsp_active_ft(vim.api.nvim_buf_get_option(0, 'filetype')) then
    return t':Vista nvim_lsp<cr>'
  else
    return t':Vista<cr>'
  end
end

o.maps = function()
  map('n', tog_vista, 'v:lua.toggle_vista()', {expr = true})
end

return o
