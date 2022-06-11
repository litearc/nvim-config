local o = {}
local colors = {}

-- '0'	: default bg
-- '1'	: lighter bg (for status bar, line num, folding marks)
-- '2'	: selection bg
-- '3'	: comments, invisibles, line highlighting
-- '4'	: dark fg (for status bar), cursor line num
-- '5'	: default foreground, caret, delimiters, operators
-- '6'	: light fg (not often used) (here, used for sidebar cursorline)
-- '7'	: dark bg (not often used) (here, used for sidebar background)
-- '8'	: variables, xml tags, markup link text, markup lists, diff deleted
-- '9'	: integers, boolean, constants, xml attributes, markup link url
-- '10'	: classes, markup bold, search text background
-- '11'	: strings, inherited class, markup code, diff inserted
-- '12'	: support, regular expressions, escape characters, markup quotes
-- '13'	: functions, methods, attribute ids, headings
-- '14'	: keywords, storage, selector, markup italic, diff changed
-- '15'	: deprecated, opening/closing embedded language tags, e.g. <?php ?>

colors['arc'] = function()
	local base = {
		['0']  = '#1e1e1e',
		['1']  = '#292929',
		['2']  = '#3e3e3e',
		['3']  = '#777777',
		['4']  = '#8a8a8a',
		['5']  = '#c6c6c6',
		['6']  = '#272727',
		['7']  = '#1b1b1b',
		['8']  = '#cc6666',
		['9']  = '#de935f',
		['10'] = '#f0c674',
		['11'] = '#b5bd68',
		['12'] = '#8abeb7',
		['13'] = '#81a2be',
		['14'] = '#b294bb',
		['15'] = '#ee99aa',
	}
	local colors = {
		gray    = base['3'],
		white   = base['5'],
		red     = base['8'],
		orange  = base['9'],
		yellow  = base['10'],
		green   = base['11'],
		cyan    = base['12'],
		blue    = base['13'],
		magenta = base['14'],
		pink    = base['15'],
	}
	return base, colors
end

colors['gruvbox'] = function()
	local base = {
		['0']  = '#282828',
		['1']  = '#3c3836',
		['2']  = '#504945',
		['3']  = '#8b7d73',
		['4']  = '#bdae93',
		['5']  = '#ded1b5',
		['6']  = '#3a3634',
		['7']  = '#242424',
		['8']  = '#fb4934',
		['9']  = '#fe8019',
		['10'] = '#fabd2f',
		['11'] = '#b8bb26',
		['12'] = '#8ec07c',
		['13'] = '#83a598',
		['14'] = '#d3869b',
		['15'] = '#d65d0e',
	}
	local colors = {
		gray    = base['3'],
		white   = base['5'],
		red     = base['8'],
		orange  = base['9'],
		yellow  = base['10'],
		green   = base['11'],
		cyan    = base['12'],
		blue    = base['13'],
		magenta = base['14'],
		pink    = base['15'],
	}
	return base, colors
end

colors['onedark'] = function()
	local base = {
		['0']	  = '#282c34',
		['1']	  = '#2e323b',
		['2']	  = '#424855',
		['3']	  = '#7a8499',
		['4']	  = '#8e97a8',
		['5']	  = '#d5d8de',
		['6']	  = '#2e323b',
		['7']	  = '#252930',
		['8']   = '#e06c75',
		['9']   = '#d19a66',
		['10']  = '#e5c07b',
		['11']  = '#98c379',
		['12']  = '#56b6c2',
		['13']  = '#61afef',
		['14']  = '#c678dd',
		['15']  = '#be5046',
	}
	local colors = {
		gray    = base['3'],
		white   = base['5'],
		red     = base['8'],
		orange  = base['9'],
		yellow  = base['10'],
		green   = base['11'],
		cyan    = base['12'],
		blue    = base['13'],
		magenta = base['14'],
		pink    = base['15'],
	}
	return base, colors
end

-- returns two variables:
-- * a dict with keys '0' to '15' containing the base colorscheme
-- * a dict with keys for different colors, e.g. red, blue, etc.
o.colors = function(name)
	local base, colors = colors[name]()
	base['none'] = 'none'
	return base, colors
end

return o
