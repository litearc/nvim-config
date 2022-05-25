local o = {}

-- 'this text will not be highlighted %#Boolean# this text will be highlighted
-- with highlight group Boolean'

-- set highlight group
-- base : base colors defining colorscheme
-- f : foreground color id
-- b : background color id
local function hi(base, group, f, b)
	local s = 'hi ' .. group .. ' cterm = none gui = none' ..
		' ctermfg = ' .. f .. ' guifg = ' .. base[f] ..
		' ctermbg = ' .. b .. ' guibg = ' .. base[b]
	vim.cmd(s)
end

-- link highlight group `a` (destination) to `b` (source)
local function link(a, b)
	vim.cmd('hi link ' .. a .. ' ' .. b)
end

-- set colorscheme to `name`. `bg` is either 'light' or 'dark'
o.colorscheme = function(name, bg)
	vim.cmd 'hi clear'
	if vim.fn.exists 'syntax_on' then
		vim.cmd 'syntax reset'
	end
	vim.o.background = bg
	vim.o.termguicolors = true
	vim.g.colors_name = name
	local base, colors = require('core.colors').colors(name)

  -- native vim highlights -------------------------------------------------------
  
	-- general
	hi(base, 'Normal', '5', '0')
	hi(base, 'Bold', 'none', 'none')
	hi(base, 'Debug', '8', 'none')
	hi(base, 'Directory', '13', 'none')
	hi(base, 'Error', '0', '8')
	hi(base, 'ErrorMsg', '8', '0')
	hi(base, 'Exception', '8', 'none')
	hi(base, 'FoldColumn', '12', 'none')
	hi(base, 'Folded', '3', '1')
	hi(base, 'IncSearch', '1', '9')
	hi(base, 'Italic', 'none', 'none')
	hi(base, 'Macro', '8', 'none')
	hi(base, 'MatchParen', '10', '2')
	hi(base, 'ModeMsg', '11', 'none')
	hi(base, 'MoreMsg', '11', 'none')
	hi(base, 'Question', '13', 'none')
	hi(base, 'Search', '1', '10')
	hi(base, 'Substitute', '1', '10')
	hi(base, 'SpecialKey', '3', 'none')
	hi(base, 'TooLong', '8', 'none')
	hi(base, 'Underlined', '8', 'none')
	hi(base, 'Visual', 'none', '2')
	hi(base, 'VisualNOS', '8', 'none')
	hi(base, 'WarningMsg', '8', 'none')
	hi(base, 'WildMenu', '8', '10')
	hi(base, 'Title', '13', 'none')
	hi(base, 'Conceal', '13', '0')
	hi(base, 'Cursor', '0', '5')
	hi(base, 'NonText', '0', 'none')
	hi(base, 'LineNr', '2', 'none')
	hi(base, 'SignColumn', '3', 'none')
	hi(base, 'StatusLine', '4', '1')
	hi(base, 'StatusLineNC', '3', '1')
	hi(base, 'VertSplit', '1', 'none')
	hi(base, 'ColorColumn', 'none', 'none')
	hi(base, 'CursorColumn', 'none', 'none')
	hi(base, 'CursorLine', 'none', '1')
	hi(base, 'CursorLineNr', '4', 'none')
	hi(base, 'QuickFixLine', 'none', '1')
	hi(base, 'PMenu', '5', 'none')
	hi(base, 'PMenuSel', '5', '2')
	hi(base, 'PMenuThumb', '3', '3')
	hi(base, 'TabLine', '3', '1')
	hi(base, 'TabLineFill', '3', '1')
	hi(base, 'TabLineSel', '11', '1')
	hi(base, 'Boolean', '9', 'none')
	hi(base, 'Character', '8', 'none')
	hi(base, 'Comment', '3', 'none')
	hi(base, 'Conditional', '14', 'none')
	hi(base, 'Constant', '9', 'none')
	hi(base, 'Define', '14', 'none')
	hi(base, 'Delimiter', '5', 'none')
	hi(base, 'Float', '9', 'none')
	hi(base, 'Function', '13', 'none')
	hi(base, 'Identifier', '8', 'none')
	hi(base, 'Include', '13', 'none')
	hi(base, 'Keyword', '14', 'none')
	hi(base, 'Label', '10', 'none')
	hi(base, 'Number', '9', 'none')
	hi(base, 'Operator', '5', 'none')
	hi(base, 'PreProc', '10', 'none')
	hi(base, 'Repeat', '10', 'none')
	hi(base, 'Special', '12', 'none')
	hi(base, 'SpecialChar', '5', 'none')
	hi(base, 'Statement', '8', 'none')
	hi(base, 'StorageClass', '10', 'none')
	hi(base, 'String', '11', 'none')
	hi(base, 'Structure', '14', 'none')
	hi(base, 'Tag', '10', 'none')
	hi(base, 'Todo', '10', '1')
	hi(base, 'Type', '10', 'none')
	hi(base, 'Typedef', '10', 'none')
	hi(base, 'DiffAdd', '11', '1')
	hi(base, 'DiffChange', '13', '1')
	hi(base, 'DiffDelete', '10', '1')
	hi(base, 'DiffText', '14', '1')
	hi(base, 'NormalFloat', '3', 'none')

	-- lsp
	hi(base, 'DiagnosticError', '5', 'none')
	hi(base, 'DiagnosticHint', '5', 'none')
	hi(base, 'DiagnosticInfo', '5', 'none')
	hi(base, 'DiagnosticWarn', '5', 'none')
	hi(base, 'DiagnosticFloatingError', '5', 'none')
	hi(base, 'DiagnosticFloatingHint', '5', 'none')
	hi(base, 'DiagnosticFloatingInfo', '5', 'none')
	hi(base, 'DiagnosticFloatingWarn', '5', 'none')
	hi(base, 'DiagnosticSignError', '8', 'none')
	hi(base, 'DiagnosticSignHint', '11', 'none')
	hi(base, 'DiagnosticSignInfo', '13', 'none')
	hi(base, 'DiagnosticSignWarn', '10', 'none')
	hi(base, 'DiagnosticUnderlineError', '8', 'none')
	hi(base, 'DiagnosticUnderlineHint', '8', 'none')
	hi(base, 'DiagnosticUnderlineInfo', '8', 'none')
	hi(base, 'DiagnosticUnderlineWarn', '8', 'none')
	hi(base, 'DiagnosticVirtualTextError', '3', 'none')
	hi(base, 'DiagnosticVirtualTextHint', '3', 'none')
	hi(base, 'DiagnosticVirtualTextInfo', '3', 'none')
	hi(base, 'DiagnosticVirtualTextWarn', '3', 'none')

	-- treesitter
	hi(base, 'TSAnnotation', '5', 'none')
	hi(base, 'TSAttribute', '10', 'none')
	hi(base, 'TSBoolean', '9', 'none')
	hi(base, 'TSCharacter', '8', 'none')
	hi(base, 'TSComment', '3', 'none')
	hi(base, 'TSConstructor', '13', 'none')
	hi(base, 'TSConditional', '14', 'none')
	hi(base, 'TSConstant', '9', 'none')
	hi(base, 'TSConstBuiltin', '9', 'none')
	hi(base, 'TSConstMacro', '8', 'none')
	hi(base, 'TSError', '8', 'none')
	hi(base, 'TSException', '8', 'none')
	hi(base, 'TSField', '5', 'none')
	hi(base, 'TSFloat', '9', 'none')
	hi(base, 'TSFunction', '13', 'none')
	hi(base, 'TSFuncBuiltin', '13', 'none')
	hi(base, 'TSFuncMacro', '8', 'none')
	hi(base, 'TSInclude', '13', 'none')
	hi(base, 'TSKeyword', '14', 'none')
	hi(base, 'TSKeywordFunction', '14', 'none')
	hi(base, 'TSKeywordOperator', '14', 'none')
	hi(base, 'TSLabel', '10', 'none')
	hi(base, 'TSMethod', '13', 'none')
	hi(base, 'TSNamespace', '8', 'none')
	hi(base, 'TSNone', '5', 'none')
	hi(base, 'TSNumber', '9', 'none')
	hi(base, 'TSOperator', '5', 'none')
	hi(base, 'TSParameter', '5', 'none')
	hi(base, 'TSParameterReference', '5', 'none')
	hi(base, 'TSProperty', '5', 'none')
	hi(base, 'TSPunctDelimiter', '5', 'none')
	hi(base, 'TSPunctBracket', '5', 'none')
	hi(base, 'TSPunctSpecial', '5', 'none')
	hi(base, 'TSRepeat', '10', 'none')
	hi(base, 'TSString', '11', 'none')
	hi(base, 'TSStringRegex', '12', 'none')
	hi(base, 'TSStringEscape', '12', 'none')
	hi(base, 'TSSymbol', '11', 'none')
	hi(base, 'TSTag', '10', 'none')
	hi(base, 'TSTagDelimiter', '5', 'none')
	hi(base, 'TSText', '5', 'none')
	hi(base, 'TSStrong', 'none', 'none')
	hi(base, 'TSEmphasis', '9', 'none')
	hi(base, 'TSUnderline', '0', 'none')
	hi(base, 'TSStrike', '0', 'none')
	hi(base, 'TSTitle', '13', 'none')
	hi(base, 'TSLiteral', '9', 'none')
	hi(base, 'TSURI', '9', 'none')
	hi(base, 'TSType', '10', 'none')
	hi(base, 'TSTypeBuiltin', '10', 'none')
	hi(base, 'TSVariable', '5', 'none')
	hi(base, 'TSVariableBuiltin', '8', 'none')
	hi(base, 'TSDefinition', 'none', 'none')
	hi(base, 'TSDefinitionUsage', 'none', 'none')
	hi(base, 'TSCurrentScope', 'none', 'none')

	-- native vim highlights -------------------------------------------------------

	-- telescope
	local ok, _ = pcall(require, 'telescope')
	if ok then
		hi(base, 'TelescopeBorder', '3', 'none')
	end

	-- bufferline
	local ok, _ = pcall(require, 'bufferline')
	if ok then
		hi(base, 'BufferLineBufferSelected'			,	'5', '0')
		hi(base, 'BufferLineBufferVisible'			,	'3', '0')
		hi(base, 'BufferLineCloseButton'				,	'3', '1')
		hi(base, 'BufferLineCloseButtonSelected',	'5', '0')
		hi(base, 'BufferLineCloseButtonVisible'	,	'5', '0')
		hi(base, 'BufferLineModified'						,	'13', '1')
		hi(base, 'BufferLineModifiedSelected'		,	'13', '0')
		hi(base, 'BufferLineModifiedVisible'		,	'13', '0')
		hi(base, 'BufferLineSeparator'					,	'1', '1')
		hi(base, 'BufferLineSeparatorSelected'	,	'1', '1')
		hi(base, 'BufferLineSeparatorVisible'		,	'1', '1')
		hi(base, 'BufferLineTabClose'						,	'5', '1')
		hi(base, 'BufferLineTab'								,	'5', '1')
		hi(base, 'BufferLineTabSelected'				,	'5', '0')
		hi(base, 'BufferLineBackground'					,	'3', '1')
		hi(base, 'BufferLineFill'								,	'1', '1')
		hi(base, 'BufferLineIndicatorSelected'	,	'0', '0')
		hi(base, 'BufferLineDuplicate'					,	'3', '1')
		hi(base, 'BufferLineDuplicateSelected'	,	'5', '0')
		hi(base, 'BufferLineDuplicateVisible'		,	'3', '0')
	end

	-- devicons
	local gray    = '3'
	local white   = '5'
	local red     = '8'
	local orange  = '9'
	local yellow  = '10'
	local green   = '11'
	local cyan    = '12'
	local blue    = '13'
	local magenta = '14'
	local pink    = '15'

	local ok, _ = pcall(require, 'nvim-web-devicons')
	if ok then
		hi(base, 'DevIconC', blue, 'none')
		hi(base, 'DevIconD', green, 'none')
		hi(base, 'DevIconH', magenta, 'none')
		hi(base, 'DevIconR', green, 'none')
		hi(base, 'DevIconAi', yellow, 'none')
		hi(base, 'DevIconCp', blue, 'none')
		hi(base, 'DevIconCs', gray, 'none')
		hi(base, 'DevIconDb', white, 'none')
		hi(base, 'DevIconEx', magenta, 'none')
		hi(base, 'DevIconFs', blue, 'none')
		hi(base, 'DevIconGo', blue, 'none')
		hi(base, 'DevIconHh', magenta, 'none')
		hi(base, 'DevIconHs', magenta, 'none')
		hi(base, 'DevIconJl', magenta, 'none')
		hi(base, 'DevIconJs', yellow, 'none')
		hi(base, 'DevIconMd', blue, 'none')
		hi(base, 'DevIconMl', orange, 'none')
		hi(base, 'DevIconPl', blue, 'none')
		hi(base, 'DevIconPm', blue, 'none')
		hi(base, 'DevIconPp', orange, 'none')
		hi(base, 'DevIconPy', orange, 'none')
		hi(base, 'DevIconRb', red, 'none')
		hi(base, 'DevIconRs', orange, 'none')
		hi(base, 'DevIconSh', gray, 'none')
		hi(base, 'DevIconTs', blue, 'none')
		hi(base, 'DevIconAwk', gray, 'none')
		hi(base, 'DevIconBat', green, 'none')
		hi(base, 'DevIconBmp', magenta, 'none')
		hi(base, 'DevIconCpp', blue, 'none')
		hi(base, 'DevIconCsh', gray, 'none')
		hi(base, 'DevIconCss', magenta, 'none')
		hi(base, 'DevIconCsv', green, 'none')
		hi(base, 'DevIconCxx', blue, 'none')
		hi(base, 'DevIconDoc', blue, 'none')
		hi(base, 'DevIconEdn', blue, 'none')
		hi(base, 'DevIconEex', magenta, 'none')
		hi(base, 'DevIconEjs', yellow, 'none')
		hi(base, 'DevIconElm', blue, 'none')
		hi(base, 'DevIconEpp', orange, 'none')
		hi(base, 'DevIconErb', red, 'none')
		hi(base, 'DevIconErl', red, 'none')
		hi(base, 'DevIconExs', magenta, 'none')
		hi(base, 'DevIconFsi', blue, 'none')
		hi(base, 'DevIconFsx', blue, 'none')
		hi(base, 'DevIconGif', magenta, 'none')
		hi(base, 'DevIconHbs', orange, 'none')
		hi(base, 'DevIconHpp', magenta, 'none')
		hi(base, 'DevIconHrl', red, 'none')
		hi(base, 'DevIconHtm', red, 'none')
		hi(base, 'DevIconHxx', magenta, 'none')
		hi(base, 'DevIconIco', white, 'none')
		hi(base, 'DevIconIni', gray, 'none')
		hi(base, 'DevIconJpg', magenta, 'none')
		hi(base, 'DevIconJsx', blue, 'none')
		hi(base, 'DevIconKsh', gray, 'none')
		hi(base, 'DevIconLhs', magenta, 'none')
		hi(base, 'DevIconLua', blue, 'none')
		hi(base, 'DevIconMdx', blue, 'none')
		hi(base, 'DevIconMjs', yellow, 'none')
		hi(base, 'DevIconMli', orange, 'none')
		hi(base, 'DevIconNim', yellow, 'none')
		hi(base, 'DevIconNix', blue, 'none')
		hi(base, 'DevIconPdf', red, 'none')
		hi(base, 'DevIconPhp', magenta, 'none')
		hi(base, 'DevIconPng', magenta, 'none')
		hi(base, 'DevIconPpt', red, 'none')
		hi(base, 'DevIconPsb', blue, 'none')
		hi(base, 'DevIconPsd', blue, 'none')
		hi(base, 'DevIconPyc', yellow, 'none')
		hi(base, 'DevIconPyd', yellow, 'none')
		hi(base, 'DevIconPyo', yellow, 'none')
		hi(base, 'DevIconRmd', blue, 'none')
		hi(base, 'DevIconRss', orange, 'none')
		hi(base, 'DevIconSig', orange, 'none')
		hi(base, 'DevIconSln', magenta, 'none')
		hi(base, 'DevIconSml', orange, 'none')
		hi(base, 'DevIconSql', white, 'none')
		hi(base, 'DevIconSuo', orange, 'none')
		hi(base, 'DevIconSvg', orange, 'none')
		hi(base, 'DevIconTex', gray, 'none')
		hi(base, 'DevIconTor', blue, 'none')
		hi(base, 'DevIconTsx', blue, 'none')
		hi(base, 'DevIconTxt', green, 'none')
		hi(base, 'DevIconVim', green, 'none')
		hi(base, 'DevIconVue', green, 'none')
		hi(base, 'DevIconXls', green, 'none')
		hi(base, 'DevIconXml', orange, 'none')
		hi(base, 'DevIconXul', orange, 'none')
		hi(base, 'DevIconYml', gray, 'none')
		hi(base, 'DevIconZig', orange, 'none')
		hi(base, 'DevIconZsh', green, 'none')
		hi(base, 'DevIconBash', green, 'none')
		hi(base, 'DevIconConf', gray, 'none')
		hi(base, 'DevIconCson', yellow, 'none')
		hi(base, 'DevIconDart', blue, 'none')
		hi(base, 'DevIconDiff', gray, 'none')
		hi(base, 'DevIconDump', white, 'none')
		hi(base, 'DevIconFish', gray, 'none')
		hi(base, 'DevIconHaml', white, 'none')
		hi(base, 'DevIconHeex', magenta, 'none')
		hi(base, 'DevIconHtml', red, 'none')
		hi(base, 'DevIconJava', red, 'none')
		hi(base, 'DevIconJpeg', magenta, 'none')
		hi(base, 'DevIconJson', yellow, 'none')
		hi(base, 'DevIconLeex', magenta, 'none')
		hi(base, 'DevIconLess', gray, 'none')
		hi(base, 'DevIconMint', blue, 'none')
		hi(base, 'DevIconOPUS', orange, 'none')
		hi(base, 'DevIconRake', red, 'none')
		hi(base, 'DevIconRlib', red, 'none')
		hi(base, 'DevIconSass', red, 'none')
		hi(base, 'DevIconScss', red, 'none')
		hi(base, 'DevIconSlim', red, 'none')
		hi(base, 'DevIconStyl', green, 'none')
		hi(base, 'DevIconToml', gray, 'none')
		hi(base, 'DevIconTwig', green, 'none')
		hi(base, 'DevIconVHDL', green, 'none')
		hi(base, 'DevIconWebp', magenta, 'none')
		hi(base, 'DevIconYaml', gray, 'none')
		hi(base, 'DevIconCMake', gray, 'none')
		hi(base, 'DevIconCobol', blue, 'none')
		hi(base, 'DevIconNPMrc', red, 'none')
		hi(base, 'DevIconRproj', green, 'none')
		hi(base, 'DevIconScala', red, 'none')
		hi(base, 'DevIconSwift', orange, 'none')
		hi(base, 'DevIconVimrc', green, 'none')
		hi(base, 'DevIconZshrc', green, 'none')
		hi(base, 'DevIconBashrc', green, 'none')
		hi(base, 'DevIconCoffee', green, 'none')
		hi(base, 'DevIconFennel', white, 'none')
		hi(base, 'DevIconFsharp', blue, 'none')
		hi(base, 'DevIconGvimrc', green, 'none')
		hi(base, 'DevIconKotlin', orange, 'none')
		hi(base, 'DevIconMotoko', magenta, 'none')
		hi(base, 'DevIconProlog', orange, 'none')
		hi(base, 'DevIconSvelte', red, 'none')
		hi(base, 'DevIconZshenv', green, 'none')
		hi(base, 'DevIconBabelrc', green, 'none')
		hi(base, 'DevIconClojure', green, 'none')
		hi(base, 'DevIconCrystal', gray, 'none')
		hi(base, 'DevIconDefault', gray, 'none')
		hi(base, 'DevIconDropbox', blue, 'none')
		hi(base, 'DevIconDsStore', gray, 'none')
		hi(base, 'DevIconFavicon', yellow, 'none')
		hi(base, 'DevIconGemfile', red, 'none')
		hi(base, 'DevIconGemspec', red, 'none')
		hi(base, 'DevIconGitLogo', red, 'none')
		hi(base, 'DevIconLicense', yellow, 'none')
		hi(base, 'DevIconMixLock', magenta, 'none')
		hi(base, 'DevIconVerilog', green, 'none')
		hi(base, 'DevIconWebpack', blue, 'none')
		hi(base, 'DevIconBrewfile', red, 'none')
		hi(base, 'DevIconClojureC', green, 'none')
		hi(base, 'DevIconConfigRu', red, 'none')
		hi(base, 'DevIconFsscript', blue, 'none')
		hi(base, 'DevIconGDScript', gray, 'none')
		hi(base, 'DevIconGitlabCI', red, 'none')
		hi(base, 'DevIconGulpfile', red, 'none')
		hi(base, 'DevIconMakefile', gray, 'none')
		hi(base, 'DevIconMarkdown', blue, 'none')
		hi(base, 'DevIconMaterial', magenta, 'none')
		hi(base, 'DevIconMustache', orange, 'none')
		hi(base, 'DevIconProcfile', magenta, 'none')
		hi(base, 'DevIconRakefile', red, 'none')
		hi(base, 'DevIconSolidity', blue, 'none')
		hi(base, 'DevIconTerminal', green, 'none')
		hi(base, 'DevIconCPlusPlus', pink, 'none')
		hi(base, 'DevIconClojureJS', blue, 'none')
		hi(base, 'DevIconGitCommit', gray, 'none')
		hi(base, 'DevIconGitConfig', gray, 'none')
		hi(base, 'DevIconGitIgnore', gray, 'none')
		hi(base, 'DevIconGruntfile', orange, 'none')
		hi(base, 'DevIconNPMIgnore', red, 'none')
		hi(base, 'DevIconPromptPs1', gray, 'none')
		hi(base, 'DevIconTextScene', magenta, 'none')
		hi(base, 'DevIconBinaryGLTF', orange, 'none')
		hi(base, 'DevIconCMakeLists', gray, 'none')
		hi(base, 'DevIconDockerfile', gray, 'none')
		hi(base, 'DevIconGitModules', gray, 'none')
		hi(base, 'DevIconZshprofile', green, 'none')
		hi(base, 'DevIconBashProfile', green, 'none')
		hi(base, 'DevIconClojureDart', blue, 'none')
		hi(base, 'DevIconNodeModules', red, 'none')
		hi(base, 'DevIconPackageJson', red, 'none')
		hi(base, 'DevIconVagrantfile', blue, 'none')
		hi(base, 'DevIconWebmanifest', yellow, 'none')
		hi(base, 'DevIconDesktopEntry', magenta, 'none')
		hi(base, 'DevIconGodotProject', gray, 'none')
		hi(base, 'DevIconKotlinScript', orange, 'none')
		hi(base, 'DevIconOpenTypeFont', white, 'none')
		hi(base, 'DevIconSettingsJson', magenta, 'none')
		hi(base, 'DevIconTextResource', yellow, 'none')
		hi(base, 'DevIconXcPlayground', orange, 'none')
		hi(base, 'DevIconConfiguration', white, 'none')
		hi(base, 'DevIconGitAttributes', gray, 'none')
		hi(base, 'DevIconSystemVerilog', green, 'none')
		hi(base, 'DevIconPackedResource', gray, 'none')
		hi(base, 'DevIconPackageLockJson', red, 'none')
		hi(base, 'DevIconImportConfiguration', white, 'none')
	end
	
	-- gitsigns
	local ok, _ = pcall(require, 'gitsigns')
	if ok then
		hi(base, 'GitSignsAdd'    , '11' , 'none')
		hi(base, 'GitSignsChange' , '13' , 'none')
		hi(base, 'GitSignsDelete' , '8'  , 'none')

		link('GitSignsAddNr'    , 'GitSignsAdd')
		link('GitSignsChangeNr' , 'GitSignsChange') 
		link('GitSignsDeleteNr' , 'GitSignsDelete')
		link('GitSignsAddLn'    , 'GitSignsAdd')
		link('GitSignsChangeLn' , 'GitSignsChange')
		link('GitSignsDeleteLn' , 'GitSignsDelete')
	end

	-- neotree
	local ok, _ = pcall(require, 'neo-tree')
	if ok then
		hi(base, 'NeoTreeNormal', '5', '7')
		link('NeoTreeNormalNC', 'NeoTreeNormal')
		hi(base, 'NeoTreeDimText', '3', 'none')
		hi(base, 'NeoTreeDotfile', '4', 'none')
		hi(base, 'NeoTreeMessage', '8', 'none')
		hi(base, 'NeoTreeFileIcon', '13', 'none')
		hi(base, 'NeoTreeFileName', '5', 'none')
		hi(base, 'NeoTreeGitAdded', '11', 'none')
		hi(base, 'NeoTreeModified', '10', 'none')
		hi(base, 'NeoTreeRootName', '10', 'none')
		hi(base, 'NeoTreeTitleBar', '5', 'none')
		link('NeoTreeFadeText1', 'NeoTreeDotfile')
		link('NeoTreeFadeText2', 'NeoTreeDimText')
		hi(base, 'NeoTreeGitStaged', '11', 'none')
		hi(base, 'NeoTreeVertSplit', '7', '7')
		hi(base, 'NeoTreeFloatTitle', '5', 'none')
		hi(base, 'NeoTreeGitDeleted', '8', 'none')
		hi(base, 'NeoTreeGitConflict', '14', 'none')
		hi(base, 'NeoTreeGitModified', '13', 'none')
		hi(base, 'NeoTreeBufferNumber', '5', 'none')
		hi(base, 'NeoTreeGitUntracked', '14', 'none')
		hi(base, 'NeoTreeFileNameOpened', '5', 'none')
		hi(base, 'NeoTreeWinSeparator', '7', '7')
		hi(base, 'NeoTreeIndentMarker', '7', '7')
	end

	local ok, _ = pcall(require, 'cmp')
	if ok then
		hi(base, 'CmpBorder', '1', 'none')
	end

	local ok, feline = pcall(require, 'plug.feline')
	if ok then
		local theme = {
			fg = base['3'],
			bg = base['1'],
			black = base['0'],
			blue = colors.blue,
			green = colors.green,
			magenta = colors.magenta,
			orange = colors.orange,
			yellow = colors.yellow,
			red = colors.red,
			cyan = colors.cyan,
		}
		require'feline'.use_theme(theme)
	end
end

return o
