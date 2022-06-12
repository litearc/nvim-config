-- (non-plugin) mappings

local c = require'core.config'.map
local map = require'core.util'.map

-- don't copy the replaced text after pasting in visual mode
map('v', 'p', '"_dP', opt)

-- allow moving the cursor through wrapped lines with j, k, <up> and <down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk
map('' , 'j'      , 'v:count ? "j" : "gj"' , {expr = true})
map('' , 'k'      , 'v:count ? "k" : "gk"' , {expr = true})
map('' , '<down>' , 'v:count ? "j" : "gj"' , {expr = true})
map('' , '<up>'   , 'v:count ? "k" : "gk"' , {expr = true})

-- be able to escape out of terminal pane with standard controls
map('t' , '<c-w>' , '<c-\\><c-n><c-w>')

-- when shifting text with tab in visual mode, don't deselect text
map('v', '<', '<gv')
map('v', '>', '>gv')

-- scroll up/down
map('n', c.scroll_u, '<c-b>zz')
map('n', c.scroll_d, '<c-f>zz')
map('v', c.scroll_u, '<c-b>zz')
map('v', c.scroll_d, '<c-f>zz')

-- move up/down (widow_height/4) lines
map('n', c.move_u_some, ":exe 'normal!' . winheight('%')/4 . 'k'<cr>")
map('n', c.move_d_some, ":exe 'normal!' . winheight('%')/4 . 'j'<cr>")

-- same but for visual mode
map('v', c.move_u_some, ":<c-u>exe 'normal! gv' . winheight('%')/4 . 'k'<cr>")
map('v', c.move_d_some, ":<c-u>exe 'normal! gv' . winheight('%')/4 . 'j'<cr>")

-- https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
--
-- To execute an Ex command from a visual mode map, you have to first enter
-- the command-line mode using the ':' character. After visually selecting a
-- sequence of characters, when you press ':' to execute a Vim Ex command, Vim
-- automatically inserts the visual block begin ('<') and end ('>') marks. If
-- you invoke an Ex command with this range, then the command is executed for
-- every line in this range. This may be undesirable. For example, if you invoke
-- a Vim function, then the function will be executed separately for each line
-- in the range (unless the function is defined with the '-range' attribute).
-- To remove the visual block start and end marks, use the <C-U> command, which
-- removes all the characters between the start of the line and the current
-- cursor position, at the beginning of your map.
-- 
-- When you enter the command mode using ':' in visual mode, the visual mode
-- is stopped. If you want to re-enter the visual mode from a function invoked
-- from a map, you can use the gv command.
--
-- The ! above makes the command work in both normal and command-line modes.

-- move lines up/down: https://vim.fandom.com/wiki/moving_lines_up_or_down
-- The command :m .+1 (which can be abbreviated to :m+) moves the current
-- line to after line number .+1 (current line number + 1). That is, the
-- current line is moved down one line.
-- The command :m .-2 (which can be abbreviated to :m-2) moves the current
-- line to after line number .-2 (current line number − 2). That is, the
-- current line is moved up one line.
-- After visually selecting some lines, entering :m '>+1 moves the selected
-- lines to after line number '>+1 (one line after the last selected line;
-- '> is a mark assigned by Vim to identify the selection end). That is, the
-- block of selected lines is moved down one line.
-- The == re-indents the line to suit its new position. For the visual-mode
-- mappings, gv reselects the last visual block and = re-indents that block.

map('n', c.move_line_u, ':m .-2<cr>==')
map('n', c.move_line_d, ':m .+1<cr>==')
map('i', c.move_line_u, '<esc>:m .-2<cr>==gi')
map('i', c.move_line_d, '<esc>:m .+1<cr>==gi')
map('v', c.move_line_u, ":m '<-2<cr>gv=gv")
map('v', c.move_line_d, ":m '>+1<cr>gv=gv")

-- goto previous/next jump point
map('n', c.jump_prev, '<c-o>zz')
map('n', c.jump_next, '<c-i>zz')

-- toggle search hl
map('n', c.tog_search_hl, ':set hlsearch!<cr>')
map('n', c.tog_line_nums, ':set number!<cr>')
map('n', c.tog_paste, ':set paste!<cr>')
--]]

-- search word under cursor. if already being searched, toggle highlight.
_G.search_highlight_toggle = function()
	if eval'@/' == eval[['\<'.expand('<cword>').'\>']] then
		cmd 'set hlsearch!'
	else
		cmd [[let @/ = '\<'.expand('<cword>').'\>']]
		cmd 'set hlsearch'
	end
	return ''
end
map('n', c.search_hl_tog, 'v:lua.search_highlight_toggle()', {expr = true})

-- save file
map('n', c.save, ':w<cr>')

-- goto beg/end of line (normal, visual, operator-pending modes)
map('', c.goto_line_beg, '^')
map('', c.goto_line_end, '$')

-- undo/redo
map('n', c.undo, 'u')
map('n', c.redo, '<c-r>')

-- copy to line end
map('n', c.copy_to_line_end, 'y$')

-- join
map('n', c.join, 'J')

-- center screen when moving to bottom
map('', 'G', 'Gzz')

-- delete without copying to register
local del_no_copy_upper = string.upper(c.del_no_copy)
map('n', c.del_no_copy, '"_d')
map('n', c.del_no_copy .. c.del_no_copy, '"_dd')
map('v', c.del_no_copy, '"_d')
map('o', c.del_no_copy, '"_d')
map('n', del_no_copy_upper, '"_D')
map('v', del_no_copy_upper, '"_D')
map('o', del_no_copy_upper, '"_D')

-- edit current word
map('n', c.edit_word, '*Ncgn')

-- move around in insert mode
map('i', '<c-h>', '<left>')
map('i', '<c-l>', '<right>')
map('i', '<c-j>', '<down>')
map('i', '<c-k>', '<up>')

-- setup command to search for variable
map('n', c.search_var, [[/\<\><left><left>]], {silent = false})

-- exit insert without moving cursor left (useful if entered insert mode with 'i')
map('i', c.exit_insert_stay, '<esc><right>')

-- delete character in insert mode
map('n', c.del_char, 'x')
map('i', c.del_char, '<esc><right>xi')

map('n', c.inc_num, '<c-a>')
map('n', c.dec_num, '<c-x>')

-- quit vim (need to press enter!)
map('n', c.quit, ':qa!', {silent = false})

-- close buffer
map('n', c.close_buf, ':bp|bd! #<cr>')

-- easily move to next/prev pane
map('n', '<tab>', '<c-w>w')
map('n', '<s-tab>', '<c-w><s-w>')

-- start/end macro
map('n', c.macro, 'q')

-- edit vimrc/shell config
map('n', c.edit_vimrc, ':e $MYVIMRC<cr>')
map('n', c.edit_shellrc, ':e ~/.zshrc<cr>')

-- disp stuff quickly
map('n', c.disp_fpath, ":echo expand('%')<cr>")
map('n', c.disp_cwd, ':pwd<cr>')

-- cd to current directory
map('n', c.cd_file, ":cd %:p:h<cr>")

-- copy file directory to register
map('n', c.copy_file_dir, ":let @*=expand('%:p:h')<cr>")

-- quickfix
map('n', c.quickfix_prev, ':cp<cr>')
map('n', c.quickfix_next, ':cn<cr>')

-- set mark
map('n', c.set_mark, 'm')

-- when searching, keep centered
map('', c.search_prev, 'Nzz')
map('', c.search_next, 'nzz')

-- move forward/backward a word
map('', c.word_prev, 'b')
map('', c.word_next, 'w')
map('', c.big_word_prev, 'B')
map('', c.big_word_next, 'W')

-- prev/next tab
map('n', c.tab_prev, ':tabp<cr>')
map('n', c.tab_next, ':tabn<cr>')

-- system clipboard (use * instead of + below for vim clipboard)
map('', '<leader>y', '"+y')
map('', '<leader>' .. c.copy_to_line_end, '"+y$')
map('', '<leader>p', '"+p')

-- lsp
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
	vim.lsp.handlers.hover,
	{ border = 'single' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
	vim.lsp.handlers.signature_help,
	{ border = 'single' }
)

map('n', c.goto_def, '<cmd>lua vim.lsp.buf.definition()<cr>')
map('n', c.goto_decl, '<cmd>lua vim.lsp.buf.declaration()<cr>')
map('n', c.goto_refs, '<cmd>lua vim.lsp.buf.references()<cr>')
map('n', c.goto_impl, '<cmd>lua vim.lsp.buf.implementation()<cr>')
map('n', c.show_line_diagnostics, '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<cr>')
