local t = require'util'.t
local g = vim.g

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

-- this allows you to navigate the completion menu with <tab> and <s-tab>
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<c-n>'
  elseif vim.fn.call('vsnip#available', {1}) == 1 then
    return t '<Plug>(vsnip-expand-or-jump)'
  elseif check_back_space() then
    return t '<tab>'
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<c-p>'
  elseif vim.fn.call('vsnip#jumpable', {-1}) == 1 then
    return t '<Plug>(vsnip-jump-prev)'
  else
    -- if <s-tab> is not working in your terminal, change it to <c-h>
    return t '<s-tab>'
  end
end

local o = {}

o.maps = function()
  g.compe = {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    source = {
      path = true,
      buffer = true,
      calc = false,
      nvim_lsp = true,
      nvim_lua = true,
      vsnip = true,
    }
  }
  vim.api.nvim_set_keymap('i', '<tab>'  , 'v:lua.tab_complete()'  , {expr = true})
  vim.api.nvim_set_keymap('s', '<tab>'  , 'v:lua.tab_complete()'  , {expr = true})
  vim.api.nvim_set_keymap('i', '<s-tab>', 'v:lua.s_tab_complete()', {expr = true})
  vim.api.nvim_set_keymap('s', '<s-tab>', 'v:lua.s_tab_complete()', {expr = true})
end

return o
