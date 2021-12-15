local map = require'util'.map
local m = require'config'.pmap.nvimtree
local g = vim.g
local o = {}

o.setup = function()
  local cb = require'nvim-tree.config'.nvim_tree_callback
  require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    auto_close = true,
    open_on_tab = false,
    update_to_buf_dir = {
      enable = false,
      auto_open = false
    },
    hijack_cursor = true,
    update_cwd = true,
    hide_dotfiles = true,
    ['git.ignore'] = true,
    tree_ignore = {'.git', 'node_modules', '.cache'},
    diagnostics = {
      enable = false
    },
    update_focused_file = {
      enable = false,
      update_cwd = false
    },
    system_open = {
      cmd = nil
    },
    view = {
      width = 40,
      side = 'left',
      auto_resize = false,
      mappings = {
        custom_only = true,
        list = {
          { key = {m.open, '<2-leftmouse>'}, cb = cb('edit') }           ,
          { key = m.cd                     , cb = cb('cd') }             ,
          { key = m.tog_dotfiles           , cb = cb('toggle_dotfiles') },
          { key = m.tog_ignored            , cb = cb('toggle_ignored') } ,
          { key = m.refresh                , cb = cb('refresh') }        ,
          { key = m.create                 , cb = cb('create') }         ,
          { key = m.remove                 , cb = cb('remove') }         ,
          { key = m.rename                 , cb = cb('rename') }         ,
          { key = m.full_rename            , cb = cb('full_rename') }    ,
          { key = m.cut                    , cb = cb('cut') }            ,
          { key = m.copy                   , cb = cb('copy') }           ,
          { key = m.paste                  , cb = cb('paste') }          ,
          { key = m.dir_up                 , cb = cb('dir_up') }         ,
          { key = m.system_open            , cb = cb('system_open') }    ,
          { key = m.close                  , cb = cb('close') }          ,
          { key = m.cd_to_reg              , cb = ':cd <c-r>*<cr>' }
        }
      }
    }
  }
end

o.maps = function()
  g.nvim_tree_indent_markers = 1
  g.nvim_tree_git_hl = 1
  g.nvim_tree_highlight_opened_files = 0
  g.nvim_tree_root_folder_modifier = ':t'
  g.nvim_tree_add_trailing = 0

  g.nvim_tree_special_files = {}
  g.nvim_tree_window_picker_exclude = {
    filetype = {'packer', 'qf', 'vista', 'Trouble'}
  }

  g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
  }

  map('n', m.toggle, ':NvimTreeToggle<cr>')
end

return o
