local o = {
  -- ui options
  ui = {
    theme = 'arc',
    hiddenstatusline = { 'fern', 'vista' },
  },

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
    close_pane = '',

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
  },

  -- (plugin options are found in the plugin files)

  -- plugin mappings
  pmap = {
    -- displays buffers/tabs in bar above
    bufferline = {
      cyc_prev = '<c-n>',
      cyc_next = '<c-m>',
      move_prev = '<a-n>',
      move_next = '<a-m>',
    },

    -- cool opening dashboard
    dashboard = {
      open = "<leader>o",
      new_file = "<leader>n",
      bookmarks = "<leader>b",
      sess_load = "<leader>l",
      sess_save = "<leader>s"
    },

    -- floating window with ranger, terminal, ...
    floaterm = {
      ranger = '<leader>af',
      terminal = '<f7>',
    },

    -- fast fuzzy finder (is kinda redundant with telescope, but is faster with
    -- large numbers of files, so still keep here)
    fzf = {
      buffers = '<leader>zb',
      commits = '<leader>zc',
      files = '<leader>zf',
      history = '<leader>zo',
      lines = '<leader>zl',
      grep = '<leader>zg',
      grep_cword = '<leader>zw',
    },

    -- useful git functions
    git = {
      diff = '<leader>vd',
      blame = '<leader>vb',
    },

    -- lsp functions
    lsp = {
      goto_def = '<leader>gd',
      goto_decl = '<leader>gD',
      goto_refs = '<leader>gr',
      goto_impl = '<leader>gi',
      show_line_diagnostics = '<leader>gl',
    },

    nvimtree = {
      toggle = '<leader>al',
      open = '<cr>',
      cd = 'i',
      tog_dotfiles = 's', -- <s>ecret
      tog_ignored = 'g',  -- i<g>nored
      refresh = 'f',
      rename = 'r',
      full_rename = 'R',
      create = 'a',
      remove = 'd',
      cut = 'x',
      copy = 'c',
      paste = 'p',
      dir_up = 'u',
      system_open = 'o',
      close = 'q',
      cd_to_file = '<leader>cd', -- change tree root (when buffer (not tree) has focus)
    },

    -- move across arguments
    sideways = { -- TODO
      jumpleft = 'J',
      jumpright = 'K',
    },

    -- search through stuff
    telescope = {
      buffers = '<leader>sb',
      commits = '<leader>sc',
      history = '<leader>so',
      files = '<leader>sf',
      git_status = '<leader>sv',
      grep = '<leader>sg',
      themes = '<leader>st',
    },

    -- vista
    trouble = {
      toggle = '<leader>at',
      keys = {
        close = 'q',               -- close the list
        cancel = '<esc>',          -- cancel the preview and get back to your last window / buffer / cursor
        refresh = 'r',             -- manually refresh
        jump = {'<cr>'},           -- jump to the diagnostic or open / close folds
        open_split = { '<c-x>' },  -- open buffer in new split
        open_vsplit = { '<c-v>' }, -- open buffer in new vsplit
        open_tab = { '<c-t>' },    -- open buffer in new tab
        jump_close = {'o'},        -- jump to the diagnostic and close the list
        toggle_mode = 'm',         -- toggle between 'workspace' and 'document' diagnostics mode
        toggle_preview = 'P',      -- toggle auto_preview
        hover = 'K',               -- opens a small popup with the full multiline message
        preview = 'p',             -- preview the diagnostic location
        close_folds = {'zm'},      -- close all folds
        open_folds = {'zr'},       -- open all folds
        toggle_fold = {'za'},      -- toggle fold of current file
        previous = 'k',            -- preview item
        next = 'j'                 -- next item
      }
    },

    -- minimal vim interface
    truezen = {
      ataraxis = '<leader>fa',
      minimal = '<leader>fm',
      focus = '<leader>ff',
    },

    -- multiple cursors
    visual_multi = {
      find = '<c-o>',
      skip = '<c-p>',
    },

    -- snippets
    vsnip = {
      expand = '<c-s>',
      expandorjump = '<c-d>',
      jumpfw = '<tab>',
      jumpbw = '<s-tab>',
    },

    -- misc functions that use plugins
    autoformat = '<leader>gf',     -- autoformat code (TODO)
    tog_comment = '<leader>/',     -- toggle comments
    tog_treesitter = '<leader>xt', -- toggle treesitter
    tog_vista = '<leader>av',    -- toggle trouble (lsp diagnostics)
    tog_trouble = '<leader>at',    -- toggle trouble (lsp diagnostics)
  },
}
return o
