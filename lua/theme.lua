local out = {}

out.get_colors = function()
  local o = {}
  local color_idx

  if vim.g.colors_name == 'arc' then
    o.colors = {
      b0 = '#1e1e1e'; -- default bg
      b1 = '#292929'; -- lighter bg (for status bar, line num, folding marks)
      b2 = '#3e3e3e'; -- selection bg
      b3 = '#777777'; -- comments, invisibles, line highlighting
      b4 = '#8a8a8a'; -- dark fg (for status bar), cursor line num
      b5 = '#c6c6c6'; -- default foreground, caret, delimiters, operators
      b6 = '#272727'; -- light fg (not often used) (here, used for sidebar cursorline)
      b7 = '#1b1b1b'; -- light bg (not often used) (here, used for sidebar background)
      b8 = '#cc6666'; -- variables, xml tags, markup link text, markup lists, diff deleted
      b9 = '#de935f'; -- integers, boolean, constants, xml attributes, markup link url
      ba = '#f0c674'; -- classes, markup bold, search text background
      bb = '#b5bd68'; -- strings, inherited class, markup code, diff inserted
      bc = '#8abeb7'; -- support, regular expressions, escape characters, markup quotes
      bd = '#81a2be'; -- functions, methods, attribute ids, headings
      be = '#b294bb'; -- keywords, storage, selector, markup italic, diff changed
      bf = '#ee99aa'; -- deprecated, opening/closing embedded language tags, e.g. <?php ?>
    }
    color_idx = {
      gray    = 'b3',
      white   = 'b5',
      red     = 'b8',
      orange  = 'b9',
      yellow  = 'ba',
      green   = 'bb',
      cyan    = 'bc',
      blue    = 'bd',
      magenta = 'be',
      pink    = 'bf',
    }
  elseif vim.g.colors_name == 'gruvbox' then
    o.colors = {
      b0 = '#282828',
      b1 = '#3c3836',
      b2 = '#504945',
      b3 = '#665c54',
      b4 = '#bdae93',
      b5 = '#d5c4a1',
      b6 = '#3a3634',
      b7 = '#242424',
      b8 = '#fb4934',
      b9 = '#fe8019',
      ba = '#fabd2f',
      bb = '#b8bb26',
      bc = '#8ec07c',
      bd = '#83a598',
      be = '#d3869b',
      bf = '#d65d0e',
    }
    color_idx = {
      gray    = 'b3',
      white   = 'b5',
      red     = 'b8',
      orange  = 'b9',
      yellow  = 'ba',
      green   = 'bb',
      cyan    = 'bc',
      blue    = 'bd',
      magenta = 'be',
      pink    = 'bf',
    }
  elseif vim.g.colors_name == 'onedark' then
    o.colors = {
      b0 = '#282c34',
      b1 = '#353b45',
      b2 = '#3e4451',
      b3 = '#545862',
      b4 = '#565c64',
      b5 = '#abb2bf',
      b6 = '#313741',
      b7 = '#242830',
      b8 = '#e06c75',
      b9 = '#d19a66',
      ba = '#e5c07b',
      bb = '#98c379',
      bc = '#56b6c2',
      bd = '#61afef',
      be = '#c678dd',
      bf = '#be5046',
    }
    color_idx = {
      gray    = 'b3',
      white   = 'b5',
      red     = 'b8',
      orange  = 'b9',
      yellow  = 'ba',
      green   = 'bb',
      cyan    = 'bc',
      blue    = 'bd',
      magenta = 'be',
      pink    = 'bf',
    }
  end

  o.colors.none = 'none'
  o.ids = {
    b0   = '0';
    b1   = '1';
    b2   = '2';
    b3   = '3';
    b4   = '4';
    b5   = '5';
    b6   = '6';
    b7   = '7';
    b8   = '8';
    b9   = '9';
    ba   = '10';
    bb   = '11';
    bc   = '12';
    bd   = '13';
    be   = '14';
    bf   = '15';
    none = 'none';
  }

  for k, v in pairs(color_idx) do
    o.colors[k] = o.colors[v]
    o.ids[k] = o.ids[v]
  end

  return o
end

return out
