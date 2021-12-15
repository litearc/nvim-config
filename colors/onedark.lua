if vim.g.colors_name ~= 'onedark' then
  vim.cmd 'hi clear'
  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end
  vim.o.background = 'dark'
  vim.o.termguicolors = true
  vim.g.colors_name = 'onedark'
  require'hi'.set_highlights()
end
