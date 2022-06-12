-- https://github.com/neovim/neovim/issues/17867
-- <c-[>, <c-m>, and <c-i> mappings don't work, so use
-- <esc>, <cr>, and <tab> instead (they are the same to the terminal)

local o = {
  -- general vim options
  opt = {
    leader = ',',
    wrap = false,
    tabwidth = 2,
    textwidth = 80,
    updatetime = 200,
    number = true,
    cmdheight = 1,
    clipboard = 'unnamed',
  },

  -- general vim mappings
  map = {
    -- search
    search_hl_tog = 's',
    search_next = 'w',
    search_prev = 'W',
    search_var = '<c-s>',

    -- toggle
    tog_line_nums = '<leader>xl',
    tog_paste = '<leader>xp',
    tog_search_hl = '<c-h>',

    -- navigation
    scroll_u = '<c-k>',
    scroll_d = '<c-j>',
    move_u_some = '<s-up>',
    move_d_some = '<s-down>',
    move_line_u = '<a-k>',
    move_line_d = '<a-j>',
    jump_prev = 'b',
    jump_next = 'B',
    goto_line_beg = 'H',
    goto_line_end = 'L',
    win_next = '<tab>',
    win_prev = '<s-tab>',
    word_next = 'm',
    big_word_next = 'M',
    word_prev = 'n',
    big_word_prev = 'N',
		tab_prev = '<a-h>',
		tab_next = '<a-l>',
    quickfix_prev = '<a-o>',
    quickfix_next = '<a-p>',
      -- https://stackoverflow.com/questions/11198382/
      -- how-to-create-a-key-map-to-open-and-close-the-quickfix-window-in-vim

    -- editing
    undo = 'u',
    redo = 'U',
    join = 'Z',
    del_char = '<c-x>',
    del_no_copy = 'x',
    edit_word = '<c-c>',
    copy_to_line_end = 'Y',
    exit_insert_stay = '<c-]>',
    inc_num = '<leader>i',
    dec_num = '<leader>I',

    -- save/quit
    save = 'S',
    quit = 'Q',
    close_buf = 'q',

    -- commonly opened files
    edit_vimrc = '<leader>ev',
    edit_shellrc = '<leader>es',

    -- displaying stuff
    disp_fpath = '<leader>df',
    disp_cwd = '<leader>dd',
    tog_quickfix = '<leader>aq', -- TODO

    -- misc
    macro = '!',
    set_mark = '[', -- [a to set mark, 'a or `a to jump to mark
    tags = '<leader>gt', -- similar to 'goto' for lsp
    altfile = '<leader>ga', -- e.g. switch bw header and impl
    cd_file = '<leader>cf',
    copy_file_dir = '<leader>yf',

		-- lsp functions
		goto_def = '<leader>gd',
		goto_decl = '<leader>gD',
		goto_refs = '<leader>gr',
		goto_impl = '<leader>gi',
		show_line_diagnostics = '<leader>gl',
  },

	pmap = {
    bufferline = {
      cyc_prev = '<c-n>',
      cyc_next = '<cr>', -- maps to <c-m>
      move_prev = '<a-n>',
      move_next = '<a-m>',
    },

		diffview = {
			open = '<leader>vc',
			prompt = '<leader>vo',
			close = '<leader>vq',
			prev = '<a-o>',
			next = '<a-p>',
		},

		comment = {
			tog_line = '<leader>//',
			tog_block = '<leader>??',
			line = '<leader>/',
			block = '<leader>?',
		},

    floaterm = {
			ranger = '<leader>af',
			terminal = '<f7>',
    },

    neotree = {
      toggle = '<leader>al',
      open = '<cr>',
      cd = 'i',
      tog_dotfiles = 's', -- <s>ecret
      tog_ignored = 'g',  -- i<g>nored
      refresh = 'f',
      rename = 'r',
      full_rename = 'R',
      create = 'a',
      create_dir = 'A',
      remove = 'd',
      cut = 'x',
      copy = 'c',
      paste = 'p',
      dir_up = 'u',
      system_open = 'o',
      close = 'q',
			find = '/',
      cd_to_file = '<leader>cd', -- change tree root (when buffer (not tree) has focus)
    },

		telescope = {
			buffers = '<leader>sb',
			commits = '<leader>sc',
			history = '<leader>so',
			files = '<leader>sf',
			git_status = '<leader>sv',
			grep = '<leader>sg',
		},
	},
}

return o
