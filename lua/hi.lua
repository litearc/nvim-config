local cmd = vim.cmd
local g = vim.g
local o = {}
local c

local function hi(group, f, b)
  local s = 'hi ' .. group .. ' cterm = none gui = none' ..
    ' ctermfg = ' .. c.ids[f] .. ' guifg = ' .. c.colors[f] ..
    ' ctermbg = ' .. c.ids[b] .. ' guibg = ' .. c.colors[b]
  cmd(s)
end

local function link(a, b)
  cmd('hi link ' .. a .. ' ' .. b)
end

initial_highlights_done = false

-- adapted from 'norcalli/nvim-base16.lua'

o.set_highlights = function()
  c = require'theme'.get_colors()

  if initial_highlights_done == true then
    require'plug.bufferline'.setup_plug(c)
    require'plug.galaxyline'.setup_plug(c)
    require'plug.icons'.setup_plug(c)
  end

  -- native vim highlights -------------------------------------------------------

  -- general
  hi('Normal'       , 'b5'   , 'b0')
  hi('Bold'         , 'none' , 'none')
  hi('Debug'        , 'b8'   , 'none')
  hi('Directory'    , 'bd'   , 'none')
  hi('Error'        , 'b0'   , 'b8')
  hi('ErrorMsg'     , 'b8'   , 'b0')
  hi('Exception'    , 'b8'   , 'none')
  hi('FoldColumn'   , 'bc'   , 'none')
  hi('Folded'       , 'b3'   , 'b1')
  hi('IncSearch'    , 'b1'   , 'b9')
  hi('Italic'       , 'none' , 'none')
  hi('Macro'        , 'b8'   , 'none')
  hi('MatchParen'   , 'ba'   , 'b2')
  hi('ModeMsg'      , 'bb'   , 'none')
  hi('MoreMsg'      , 'bb'   , 'none')
  hi('Question'     , 'bd'   , 'none')
  hi('Search'       , 'b1'   , 'ba')
  hi('Substitute'   , 'b1'   , 'ba')
  hi('SpecialKey'   , 'b3'   , 'none')
  hi('TooLong'      , 'b8'   , 'none')
  hi('Underlined'   , 'b8'   , 'none')
  hi('Visual'       , 'none' , 'b2')
  hi('VisualNOS'    , 'b8'   , 'none')
  hi('WarningMsg'   , 'b8'   , 'none')
  hi('WildMenu'     , 'b8'   , 'ba')
  hi('Title'        , 'bd'   , 'none')
  hi('Conceal'      , 'bd'   , 'b0')
  hi('Cursor'       , 'b0'   , 'b5')
  hi('NonText'      , 'b0'   , 'none')
  hi('LineNr'       , 'b2'   , 'none')
  hi('SignColumn'   , 'b3'   , 'none')
  hi('StatusLine'   , 'b4'   , 'b1')
  hi('StatusLineNC' , 'b3'   , 'b1')
  hi('VertSplit'    , 'b7'   , 'b7') -- was (b2, none)
  hi('ColorColumn'  , 'none' , 'none')
  hi('CursorColumn' , 'none' , 'none')
  hi('CursorLine'   , 'none' , 'b1')
  hi('CursorLineNr' , 'b4'   , 'none')
  hi('QuickFixLine' , 'none' , 'b1')
  hi('PMenu'        , 'b5'   , 'b1')
  hi('PMenuSel'     , 'b1'   , 'b5')
  hi('TabLine'      , 'b3'   , 'b1')
  hi('TabLineFill'  , 'b3'   , 'b1')
  hi('TabLineSel'   , 'bb'   , 'b1')
  hi('Boolean'      , 'b9'   , 'none')
  hi('Character'    , 'b8'   , 'none')
  hi('Comment'      , 'b3'   , 'none')
  hi('Conditional'  , 'be'   , 'none')
  hi('Constant'     , 'b9'   , 'none')
  hi('Define'       , 'be'   , 'none')
  hi('Delimiter'    , 'b5'   , 'none')
  hi('Float'        , 'b9'   , 'none')
  hi('Function'     , 'bd'   , 'none')
  hi('Identifier'   , 'b8'   , 'none')
  hi('Include'      , 'bd'   , 'none')
  hi('Keyword'      , 'be'   , 'none')
  hi('Label'        , 'ba'   , 'none')
  hi('Number'       , 'b9'   , 'none')
  hi('Operator'     , 'b5'   , 'none')
  hi('PreProc'      , 'ba'   , 'none')
  hi('Repeat'       , 'ba'   , 'none')
  hi('Special'      , 'bc'   , 'none')
  hi('SpecialChar'  , 'b5'   , 'none')
  hi('Statement'    , 'b8'   , 'none')
  hi('StorageClass' , 'ba'   , 'none')
  hi('String'       , 'bb'   , 'none')
  hi('Structure'    , 'be'   , 'none')
  hi('Tag'          , 'ba'   , 'none')
  hi('Todo'         , 'ba'   , 'b1')
  hi('Type'         , 'ba'   , 'none')
  hi('Typedef'      , 'ba'   , 'none')
  hi('DiffAdd'      , 'bb'   , 'b1') -- these are a bit different than vim default (bright bg)
  hi('DiffChange'   , 'bd'   , 'b1') -- which are ('b0', 'bb'), ...
  hi('DiffDelete'   , 'ba'   , 'b1')
  hi('DiffText'     , 'be'   , 'b1')
  hi('NormalFloat'  , 'b5'   , 'b1')

  -- lsp
  hi('DiagnosticError'            , 'b5' , 'none')
  hi('DiagnosticHint'             , 'b5' , 'none')
  hi('DiagnosticInfo'             , 'b5' , 'none')
  hi('DiagnosticWarn'             , 'b5' , 'none')
  hi('DiagnosticFloatingError'    , 'b5' , 'none')
  hi('DiagnosticFloatingHint'     , 'b5' , 'none')
  hi('DiagnosticFloatingInfo'     , 'b5' , 'none')
  hi('DiagnosticFloatingWarn'     , 'b5' , 'none')
  hi('DiagnosticSignError'        , 'b8' , 'none')
  hi('DiagnosticSignHint'         , 'bb' , 'none')
  hi('DiagnosticSignInfo'         , 'bd' , 'none')
  hi('DiagnosticSignWarn'         , 'ba' , 'none')
  hi('DiagnosticUnderlineError'   , 'b8' , 'none')
  hi('DiagnosticUnderlineHint'    , 'b8' , 'none')
  hi('DiagnosticUnderlineInfo'    , 'b8' , 'none')
  hi('DiagnosticUnderlineWarn'    , 'b8' , 'none')
  hi('DiagnosticVirtualTextError' , 'b3' , 'none')
  hi('DiagnosticVirtualTextHint'  , 'b3' , 'none')
  hi('DiagnosticVirtualTextInfo'  , 'b3' , 'none')
  hi('DiagnosticVirtualTextWarn'  , 'b3' , 'none')

  -- treesitter
  hi('TSAnnotation'         , 'b5'   , 'none')
  hi('TSAttribute'          , 'ba'   , 'none')
  hi('TSBoolean'            , 'b9'   , 'none')
  hi('TSCharacter'          , 'b8'   , 'none')
  hi('TSComment'            , 'b3'   , 'none')
  hi('TSConstructor'        , 'bd'   , 'none')
  hi('TSConditional'        , 'be'   , 'none')
  hi('TSConstant'           , 'b9'   , 'none')
  hi('TSConstBuiltin'       , 'b9'   , 'none')
  hi('TSConstMacro'         , 'b8'   , 'none')
  hi('TSError'              , 'b8'   , 'none')
  hi('TSException'          , 'b8'   , 'none')
  hi('TSField'              , 'b5'   , 'none')
  hi('TSFloat'              , 'b9'   , 'none')
  hi('TSFunction'           , 'bd'   , 'none')
  hi('TSFuncBuiltin'        , 'bd'   , 'none')
  hi('TSFuncMacro'          , 'b8'   , 'none')
  hi('TSInclude'            , 'bd'   , 'none')
  hi('TSKeyword'            , 'be'   , 'none')
  hi('TSKeywordFunction'    , 'be'   , 'none')
  hi('TSKeywordOperator'    , 'be'   , 'none')
  hi('TSLabel'              , 'ba'   , 'none')
  hi('TSMethod'             , 'bd'   , 'none')
  hi('TSNamespace'          , 'b8'   , 'none')
  hi('TSNone'               , 'b5'   , 'none')
  hi('TSNumber'             , 'b9'   , 'none')
  hi('TSOperator'           , 'b5'   , 'none')
  hi('TSParameter'          , 'b5'   , 'none')
  hi('TSParameterReference' , 'b5'   , 'none')
  hi('TSProperty'           , 'b5'   , 'none')
  hi('TSPunctDelimiter'     , 'b5'   , 'none')
  hi('TSPunctBracket'       , 'b5'   , 'none')
  hi('TSPunctSpecial'       , 'b5'   , 'none')
  hi('TSRepeat'             , 'ba'   , 'none')
  hi('TSString'             , 'bb'   , 'none')
  hi('TSStringRegex'        , 'bc'   , 'none')
  hi('TSStringEscape'       , 'bc'   , 'none')
  hi('TSSymbol'             , 'bb'   , 'none')
  hi('TSTag'                , 'ba'   , 'none')
  hi('TSTagDelimiter'       , 'b5'   , 'none')
  hi('TSText'               , 'b5'   , 'none')
  hi('TSStrong'             , 'none' , 'none')
  hi('TSEmphasis'           , 'b9'   , 'none')
  hi('TSUnderline'          , 'b0'   , 'none')
  hi('TSStrike'             , 'b0'   , 'none')
  hi('TSTitle'              , 'bd'   , 'none')
  hi('TSLiteral'            , 'b9'   , 'none')
  hi('TSURI'                , 'b9'   , 'none')
  hi('TSType'               , 'ba'   , 'none')
  hi('TSTypeBuiltin'        , 'ba'   , 'none')
  hi('TSVariable'           , 'b5'   , 'none') -- changed from default 'b8'
  hi('TSVariableBuiltin'    , 'b8'   , 'none')
  hi('TSDefinition'         , 'none' , 'none')
  hi('TSDefinitionUsage'    , 'none' , 'none')
  hi('TSCurrentScope'       , 'none' , 'none')

  -- plugin highlights -----------------------------------------------------------

  -- gitsigns
  hi('GitSignsAdd'    , 'bb' , 'none')
  hi('GitSignsChange' , 'bd' , 'none')
  hi('GitSignsDelete' , 'b8' , 'none')

  link('GitSignsAdd'    , 'GitSignsAddNr')
  link('GitSignsChange' , 'GitSignsChangeNr')
  link('GitSignsDelete' , 'GitSignsDeleteNr')
  link('GitSignsAdd'    , 'GitSignsAddLn')
  link('GitSignsChange' , 'GitSignsChangeLn')
  link('GitSignsDelete' , 'GitSignsDeleteLn')

  -- nvim-tree
  hi('NvimTreeNormal', 'b5', 'b7')
  -- hi('NvimTreeVertSplit', 'b7', 'b7') -- doesn't work anymore...
  hi('NvimTreeCursorLine', 'none', 'b6')
  hi('NvimTreeStatusline', 'b7', 'b7')
  hi('NvimTreeStatuslineNC', 'b7', 'b7')
  hi('NvimTreeIndentMarker', 'b2', 'b7')

  -- telescope
  hi('TelescopeBorder', 'b3', 'none')

  -- vista
  hi('VistaPublic'    , 'bb' , 'none')
  hi('VistaProtected' , 'ba' , 'none')
  hi('VistaPrivate'   , 'b8' , 'none')

  initial_highlights_done = true
end

return o
