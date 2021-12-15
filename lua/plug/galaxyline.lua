local o = {}

o.setup_plug = function(colors)
  local gl = require 'galaxyline'
  local is_lsp_active_ft = require'util'.is_lsp_active_ft
  local s = gl.section

  gl.short_line_list = {'NvimTree', 'vista'}

  -- the separator for a section comes to the right in the left section
  -- and to the left in the right section (i think, not 100% sure)

  -- cool icons on the left
  s.left[1] = {
    statusIcon = {
      provider = function()
        return '     '
      end,
      highlight = {colors.b1, colors.bd},
      separator = ' ',
      separator_highlight = {colors.b2, colors.b2},
    }
  }

  -- icon for file type
  s.left[2] = {
    FileIcon = {
      provider = 'FileIcon',
      condition = buffer_not_empty,
      highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.b2},
    }
  }

  -- file name
  s.left[3] = {
    FileName = {
      provider = 'FileName',
      condition = buffer_not_empty,
      highlight = {colors.b5, colors.b2},
      separator = ' ',
      separator_highlight = {colors.b1, colors.b1},
    }
  }

  -- current working directory
  s.left[4] = {
    current_dir = {
      provider = function()
        local dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
        return ' ' .. dir .. ' '
      end,
      highlight = {colors.b4, colors.b1},
      separator = right_separator,
      separator_highlight = {colors.b1, colors.b1},
    }
  }

  -- display certain sections only when window is wider than threshold
  local checkwidth = function()
    return vim.fn.winwidth(0) > 80
  end

  -- # lines added
  s.left[5] = {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = checkwidth,
      icon = ' ',
      highlight = {colors.bb, colors.b1},
    }
  }

  -- # lines modified
  s.left[6] = {
    DiffModified = {
      provider = 'DiffModified',
      condition = checkwidth,
      icon = '柳',
      highlight = {colors.bd, colors.b1},
    }
  }

  -- # lines removed
  s.left[7] = {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = checkwidth,
      icon = ' ',
      highlight = {colors.b8, colors.b1},
    }
  }

  -- # errors in current file
  s.left[8] = {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = ' ',
      highlight = {colors.b8, colors.b1},
    }
  }

  -- # warnings in current file
  s.left[9] = {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = ' ',
      highlight = {colors.ba, colors.b1},
    }
  }

  -- display if there is an lsp active for current file
  s.right[1] = {
    lsp_status = {
      provider = function()
        if is_lsp_active_ft(vim.api.nvim_buf_get_option(0, 'filetype')) then
          return ' ' .. '  ' .. 'LSP'
        else
          return ''
        end
      end,
      highlight = {colors.b4, colors.b1},
      separator = ' ',
      separator_highlight = {colors.b1, colors.b1},
    }
  }

  -- if in a git repo, display git branch icon ...
  s.right[2] = {
    GitIcon = {
      provider = function()
        return ''
      end,
      condition = require('galaxyline.condition').check_git_workspace,
      highlight = {colors.b4, colors.b1},
      separator = '  ',
      separator_highlight = {colors.b1, colors.b1},
    }
  }

  -- ... and current branch name
  s.right[3] = {
    GitBranch = {
      provider = 'GitBranch',
      condition = require('galaxyline.condition').check_git_workspace,
      highlight = {colors.b4, colors.b1},
      separator = ' ',
      separator_highlight = {colors.b1, colors.b1},
    }
  }

  -- display if paste mode is enabled
  s.right[4] = {
    Paste = {
      provider = function()
        if vim.api.nvim_eval[[&paste]] == 1 then return '   Ƥ ' end -- U+01A4
        return ''
      end,
      highlight = {colors.blue, colors.b1},
    }
  }

  -- line percent, row, and column
  s.right[5] = {
    PerCent = {
      provider = {'LinePercent', 'LineColumn'},
      highlight = {colors.b5, colors.b2},
      separator = ' ',
      separator_highlight = {colors.b1, colors.b1},
    }
  }

  -- define text and color for different editing modes
  local modes = {
    n = {'Normal', colors.blue},
    i = {'Insert', colors.yellow},
    c = {'Command', colors.red},
    V = {'Visual', colors.cyan},
    [''] = {'Visual', colors.cyan},
    v = {'Visual', colors.cyan},
    R = {'Replace', colors.orange},
    t = {'Terminal', colors.green},
  }

  local function mode(m)
    -- return '#ffffff'
    local cmode = modes[vim.fn.mode()][m]
    if cmode == nil then
      return modes[vim.fn.mode()]['t']
    else
      return cmode
    end
  end

  -- show current mode
  s.right[6] = {
    ViMode = {
      provider = function()
        vim.cmd('hi GalaxyViMode guibg=' .. mode(2))
        return '  ' .. mode(1) .. ' '
      end,
      -- {fg, bg}, bg color gets overwritten
      highlight = {colors.b1, 'GalaxyViMode'},
    }
  }
end

o.setup = function()
  local colors = require'theme'.get_colors().colors
  o.setup_plug(colors)
end

return o
