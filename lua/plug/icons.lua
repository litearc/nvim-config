local o = {}

o.setup_plug = function(c) -- c contains colors
  -- print(vim.inspect(require'nvim-web-devicons'.get_icons()))
  -- the `override` section is taken from nvim-web-devicons source code
  local icons = require'nvim-web-devicons'
  local override = {
    ['gruntfile'] = {
      icon = '',
      color = c.colors.orange,
      name = 'Gruntfile'
    };
    ['gulpfile'] = {
      icon = '',
      color = c.colors.red,
      name = 'Gulpfile'
    };
    ['dropbox'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Dropbox',
    };
    ['xls'] = {
      icon = '',
      color = c.colors.green,
      name = 'Xls',
    };
    ['doc'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Doc',
    };
    ['ppt'] = {
      icon = '',
      color = c.colors.red,
      name = 'Ppt',
    };
    ['xml'] = {
      icon = '謹',
      color = c.colors.orange,
      name = 'Xml',
    };
    ['webpack'] = {
      icon = 'ﰩ',
      color = c.colors.cyan,
      name = 'Webpack',
    };
    ['.settings.json'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'SettingsJson',
    };
    ['cs'] = {
      icon = '',
      color = c.colors.green,
      name = 'Cs',
    };
    ['procfile'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Procfile'
    };
    ['svg'] = {
      icon = 'ﰟ',
      color = c.colors.orange,
      name = 'Svg',
    };
    ['.bashprofile'] = {
      icon = '',
      color = c.colors.green,
      name = 'BashProfile'
    };
    ['.bashrc'] = {
      icon = '',
      color = c.colors.green,
      name = 'Bashrc'
    };
    ['.babelrc'] = {
      icon = 'ﬥ',
      color = c.colors.yellow,
      name = 'Babelrc'
    };
    ['.ds_store'] = {
      icon = '',
      color = c.colors.gray,
      name = 'DsStore'
    };
    ['git'] = {
      icon = '',
      color = c.colors.red,
      name = 'GitLogo'
    };
    ['.gitattributes'] = {
      icon = '',
      color = c.colors.gray,
      name = 'GitAttributes'
    };
    ['.gitconfig'] = {
      icon = '',
      color = c.colors.gray,
      name = 'GitConfig'
    };
    ['.gitignore'] = {
      icon = '',
      color = c.colors.gray,
      name = 'GitIgnore'
    };
    ['.gitmodules'] = {
      icon = '',
      color = c.colors.gray,
      name = 'GitModules'
    };
    ['COMMIT_EDITMSG'] = {
      icon = '',
      color = c.colors.gray,
      name = 'GitCommit'
    };
    ['COPYING'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'License',
    };
    ['COPYING.LESSER'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'License',
    };
    ['.gitlab-ci.yml'] = {
      icon = '',
      color = c.colors.red,
      name = 'GitlabCI'
    };
    ['.gvimrc'] = {
      icon = '',
      color = c.colors.green,
      name = 'Gvimrc'
    };
    ['.npmignore'] = {
      icon = '',
      color = c.colors.red,
      name = 'NPMIgnore'
    };
    ['.vimrc'] = {
      icon = '',
      color = c.colors.green,
      name = 'Vimrc'
    };
    ['.zshrc'] = {
      icon = '',
      color = c.colors.green,
      name = 'Zshrc'
    };
    ['.zshenv'] = {
      icon = '',
      color = c.colors.green,
      name = 'Zshenv'
    };
    ['.zprofile'] = {
      icon = '',
      color = c.colors.green,
      name = 'Zshprofile'
    };
    ['Dockerfile'] = {
      icon = '',
      color = c.colors.gray,
      name = 'Dockerfile'
    };
    ['Gemfile$'] = {
      icon = '',
      color = c.colors.red,
      name = 'Gemfile'
    };
    ['LICENSE'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'License'
    };
    ['Vagrantfile$'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Vagrantfile'
    };
    ['_gvimrc'] = {
      icon = '',
      color = c.colors.green,
      name = 'Gvimrc'
    };
    ['_vimrc'] = {
      icon = '',
      color = c.colors.green,
      name = 'Vimrc',
    };
    ['ai'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'Ai',
    };
    ['awk'] = {
      icon = '',
      color = c.colors.gray,
      name = 'Awk',
    };
    ['bash'] = {
      icon = '',
      color = c.colors.green,
      name = 'Bash',
    };
    ['bat'] = {
      icon = '',
      color = c.colors.green,
      name = 'Bat'
    };
    ['bmp'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Bmp'
    };
    ['c'] = {
      icon = '',
      color = c.colors.blue,
      name = 'C'
    };
    ['c++'] = {
      icon = '',
      color = c.colors.red,
      name = 'CPlusPlus'
    };
    ['cc'] = {
      icon = '',
      color = c.colors.red,
      name = 'CPlusPlus'
    };
    ['clj'] = {
      icon = '',
      color = c.colors.green,
      name = 'Clojure',
    };
    ['cljc'] = {
      icon = '',
      color = c.colors.green,
      name = 'ClojureC'
    };
    ['cljs'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'ClojureJS',
    };
    ['CMakeLists.txt'] = {
      icon = '',
      color = c.colors.gray,
      name = 'CMakeLists'
    };
    ['cmake'] = {
      icon = '',
      color = c.colors.gray,
      name = 'CMake'
    };
    ['coffee'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'Coffee',
    };
    ['conf'] = {
      icon = '',
      color = c.colors.gray,
      name = 'Conf',
    };
    ['config.ru'] = {
      icon = '',
      color = c.colors.red,
      name = 'ConfigRu'
    };
    ['cp'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Cp',
    };
    ['cpp'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Cpp',
    };
    ['csh'] = {
      icon = '',
      color = c.colors.gray,
      name = 'Csh',
    };
    ['cson'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'Cson',
    };
    ['css'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Css',
    };
    ['cxx'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Cxx',
    };
    ['d'] = {
      icon = '',
      color = c.colors.green,
      name = 'D',
    };
    ['dart'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Dart',
    };
    ['db'] = {
      icon = '',
      color = c.colors.white,
      name = 'Db',
    };
    ['diff'] = {
      icon = '',
      name = 'Diff',
    };
    ['dockerfile'] = {
      icon = '',
      color = c.colors.gray,
      name = 'Dockerfile',
    };
    ['dump'] = {
      icon = '',
      color = c.colors.white,
      name = 'Dump',
    };
    ['edn'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Edn',
    };
    ['eex'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Eex',
    };
    ['ejs'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'Ejs',
    };
    ['elm'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Elm',
    };
    ['erl'] = {
      icon = '',
      color = c.colors.pink,
      name = 'Erl',
    };
    ['ex'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Ex',
    };
    ['exs'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Exs',
    };
    ['f#'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Fsharp'
    };
    ['favicon.ico'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'Favicon'
    };
    ['fish'] = {
      icon = '',
      color = c.colors.gray,
      name = 'Fish',
    };
    ['fs'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Fs',
    };
    ['fsi'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Fsi',
    };
    ['fsscript'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Fsscript',
    };
    ['fsx'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Fsx',
    };
    ['gemspec'] = {
      icon = '',
      color = c.colors.red,
      name = 'Gemspec',
    };
    ['gif'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Gif',
    };
    ['go'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Go',
    };
    ['h'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'H',
    };
    ['haml'] = {
      icon = '',
      color = c.colors.white,
      name = 'Haml',
    };
    ['hbs'] = {
      icon = '',
      color = c.colors.orange,
      name = 'Hbs',
    };
    ['hh'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Hh',
    };
    ['hpp'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Hpp',
    };
    ['hrl'] = {
      icon = '',
      color = c.colors.pink,
      name = 'Hrl',
    };
    ['hs'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Hs',
    };
    ['htm'] = {
      icon = '',
      color = c.colors.orange,
      name = 'Htm',
    };
    ['html'] = {
      icon = '',
      color = c.colors.orange,
      name = 'Html',
    };
    ['erb'] = {
      icon = '',
      color = c.colors.red,
      name = 'Erb',
    };
    ['hxx'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Hxx',
    };
    ['ico'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'Ico',
    };
    ['ini'] = {
      icon = '',
      color = c.colors.gray,
      name = 'Ini',
    };
    ['java'] = {
      icon = '',
      color = c.colors.red,
      name = 'Java',
    };
    ['jl'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Jl',
    };
    ['jpeg'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Jpeg',
    };
    ['jpg'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Jpg',
    };
    ['js'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'Js',
    };
    ['json'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'Json',
    };
    ['jsx'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Jsx',
    };
    ['ksh'] = {
      icon = '',
      color = c.colors.gray,
      name = 'Ksh',
    };
    ['leex'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Leex',
    };
    ['less'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Less',
    };
    ['lhs'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Lhs',
    };
    ['license'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'License',
    };
    ['lua'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Lua',
    };
    ['makefile'] = {
      icon = '',
      color = c.colors.gray,
      name = 'Makefile',
    };
    ['markdown'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Markdown',
    };
    ['md'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Md',
    };
    ['mdx'] = {
      icon = '',
      color = c.colors.cyan,
      name = 'Mdx',
    };
    ['mix.lock'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'MixLock'
    };
    ['mjs'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'Mjs',
    };
    ['ml'] = {
      icon = 'λ',
      color = c.colors.orange,
      name = 'Ml'
    };
    ['mli'] = {
      icon = 'λ',
      color = c.colors.orange,
      name = 'Mli',
    };
    ['mustache'] = {
      icon = '',
      color = c.colors.orange,
      name = 'Mustache',
    };
    ['nix'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Nix',
    };
    ['node_modules'] = {
      icon = '',
      color = c.colors.red,
      name = 'NodeModules',
    };
    ['php'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Php'
    };
    ['pl'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Pl'
    };
    ['pm'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Pm'
    };
    ['png'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Png'
    };
    ['pp'] = {
      icon = '',
      color = c.colors.gray,
      name = 'Pp'
    };
    ['ps1'] = {
      icon = '',
      color = c.colors.gray,
      name = 'PromptPs1'
    };
    ['psb'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Psb'
    };
    ['psd'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Psd'
    };
    ['py'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Py'
    };
    ['pyc'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Pyc'
    };
    ['pyd'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Pyd',
    };
    ['pyo'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Pyo'
    };
    ['r'] = {
      icon = 'ﳒ',
      color = c.colors.green,
      name = 'R'
    };
    ['R'] = {
      icon = 'ﳒ',
      color = c.colors.green,
      name = 'R'
    };
    ['rake'] = {
      icon = '',
      color = c.colors.red,
      name = 'Rake'
    };
    ['rakefile'] = {
      icon = '',
      color = c.colors.red,
      name = 'Rakefile'
    };
    ['rb'] = {
      icon = '',
      color = c.colors.red,
      name = 'Rb'
    };
    ['rlib'] = {
      icon = '',
      color = c.colors.orange,
      name = 'Rlib',
    };
    ['rmd'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Rmd'
    };
    ['Rmd'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Rmd'
    };
    ['rproj'] = {
      icon = '鉶',
      color = c.colors.green,
      name = 'Rproj'
    };
    ['rs'] = {
      icon = '',
      color = c.colors.orange,
      name = 'Rs'
    };
    ['rss'] = {
      icon = '',
      color = c.colors.orange,
      name = 'Rss'
    };
    ['sass'] = {
      icon = '',
      color = c.colors.pink,
      name = 'Sass'
    };
    ['scala'] = {
      icon = '',
      color = c.colors.red,
      name = 'Scala'
    };
    ['scss'] = {
      icon = '',
      color = c.colors.pink,
      name = 'Scss'
    };
    ['sh'] = {
      icon = '',
      color = c.colors.gray,
      name = 'Sh'
    };
    ['slim'] = {
      icon = '',
      color = c.colors.orange,
      name = 'Slim'
    };
    ['sln'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Sln'
    };
    ['sql'] = {
      icon = '',
      color = c.colors.white,
      name = 'Sql'
    };
    ['styl'] = {
      icon = '',
      color = c.colors.green,
      name = 'Styl'
    };
    ['suo'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Suo'
    };
    ['swift'] = {
      icon = '',
      color = c.colors.orange,
      name = 'Swift'
    };
    ['t'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Tor'
    };
    ['tex'] = {
      icon = 'ﭨ',
      color = c.colors.green,
      name = 'Tex'
    };
    ['toml'] = {
      icon = '',
      color = c.colors.gray,
      name = 'Toml'
    };
    ['ts'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Ts'
    };
    ['tsx'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Tsx'
    };
    ['twig'] = {
      icon = '',
      color = c.colors.green,
      name = 'Twig'
    };
    ['vim'] = {
      icon = '',
      color = c.colors.green,
      name = 'Vim'
    };
    ['vue'] = {
      icon = '﵂',
      color = c.colors.green,
      name = 'Vue'
    };
    ['webmanifest'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'Webmanifest'
    };
    ['webp'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'Webp'
    };
    ['xcplayground'] = {
      icon = '',
      color = c.colors.orange,
      name = 'XcPlayground',
    };
    ['xul'] = {
      icon = '',
      color = c.colors.orange,
      name = 'Xul'
    };
    ['yaml'] = {
      icon = '',
      color = c.colors.gray,
      name = 'Yaml'
    };
    ['yml'] = {
      icon = '',
      color = c.colors.gray,
      name = 'Yml'
    };
    ['zsh'] = {
      icon = '',
      color = c.colors.green,
      name = 'Zsh'
    };
    ['terminal'] = {
      icon = '',
      color = c.colors.green,
      name = 'Terminal'
    };
    ['pdf'] = {
      icon = '',
      color = c.colors.red,
      name = 'Pdf'
    };
    ['kt'] = {
      icon = '𝙆',
      color = c.colors.orange,
      name = 'Kotlin'
    };
    ['gd'] = {
      icon = '',
      color = c.colors.gray,
      name = 'GDScript'
    };
    ['tscn'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'TextScene'
    };
    ['godot'] = {
      icon = '',
      color = c.colors.gray,
      name = 'GodotProject'
    };
    ['tres'] = {
      icon = '',
      color = c.colors.yellow,
      name = 'TextResource'
    };
    ['glb'] = {
      icon = '',
      color = c.colors.orange,
      name = 'BinaryGLTF'
    };
    ['import'] = {
      icon = '',
      color = c.colors.white,
      name = 'ImportConfiguration'
    };
    ['material'] = {
      icon = '',
      color = c.colors.pink,
      name = 'Material'
    };
    ['otf'] = {
      icon = '',
      color = c.colors.white,
      name = 'OpenTypeFont'
    };
    ['cfg'] = {
      icon = '',
      color = c.colors.white,
      name = 'Configuration'
    };
    ['pck'] = {
      icon = '',
      color = c.colors.gray,
      name = 'PackedResource'
    };
    ['desktop'] = {
      icon = '',
      color = c.colors.magenta,
      name = 'DesktopEntry'
    };
    ['opus'] = {
      icon = '',
      color = c.colors.orange,
      name = 'OPUS'
    };
    ['svelte'] = {
      icon = '',
      color = c.colors.orange,
      name = 'Svelte'
    };
    ['text'] = {
      icon = '',
      color = c.colors.blue,
      name = 'Text'
    };
  }

  -- make all other icons some color in the palette
  local all_icons = icons.get_icons()
  for key, val in pairs(all_icons) do
    if override[key] == nil then
      override[key] = {
        icon = val.icon,
        color = c.colors.blue,
        name = val.name
      }
    end
  end

  icons.setup {
    override = override;
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = false;
  }
  icons.set_default_icon('', c.colors.blue)
end

o.setup = function()
  local c = require'theme'.get_colors()
  o.setup_plug(c)
end

return o
