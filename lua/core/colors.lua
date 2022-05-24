local o = {}
local colors = {}

colors['arc'] = function()
	local base = {
		['0'] = '#1e1e1e',
		['1'] = '#292929',
		['2'] = '#3e3e3e',
		['3'] = '#777777',
		['4'] = '#8a8a8a',
		['5'] = '#c6c6c6',
		['6'] = '#272727',
		['7'] = '#1b1b1b',
		['8'] = '#cc6666',
		['9'] = '#de935f',
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

-- returns two variables:
-- * a dict with keys '0' to '15' containing the base colorscheme
-- * a dict with keys for different colors, e.g. red, blue, etc.
o.colors = function(name)
	local base, colors = colors[name]()
	base['none'] = 'none'
	return base, colors
end

return o
