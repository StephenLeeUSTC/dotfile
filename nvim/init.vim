lua << EOF

local status_ok, _ = pcall(require, "lua-init")
if not status_ok then
  return
end

EOF

" TODO: move all following old vim config to lua config files

" " My own tiny config, inspired by awesome vimrc project
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Vim-Plug core
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
" if has('win32')&&!has('win64')
"   let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
" else
"   let curl_exists=expand('curl')
" endif
"
" if !filereadable(vimplug_exists)
"   if !executable(curl_exists)
"     echoerr "You have to install curl or first install vim-plug yourself!"
"     execute "q!"
"   endif
"   echo "Installing Vim-Plug..."
"   echo ""
"   silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
"   let g:not_finish_vimplug = "yes"
"
"   autocmd VimEnter * PlugInstall
" endif
"
" call plug#begin(expand('~/.config/nvim/plugged'))
"
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'nvim-lualine/lualine.nvim'
" Plug 'moll/vim-bbye' "used for close buffer
" Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
"
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'terryma/vim-multiple-cursors' " use ctrl + n
" Plug 'numToStr/Comment.nvim'
"
" " reminder for complex keybindings
" Plug 'folke/which-key.nvim'
"
" " telescope related plugin
" Plug 'ahmedkhalf/project.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'nvim-telescope/telescope.nvim'
"
" Plug 'windwp/nvim-autopairs'
" Plug 'Mofiqul/vscode.nvim' " colorscheme
" Plug 'phaazon/hop.nvim'
"
" " Semantic language support
" Plug 'williamboman/nvim-lsp-installer'
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/lsp_extensions.nvim'
" Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
" Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
" Plug 'hrsh7th/cmp-path', {'branch': 'main'}
" Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
" Plug 'ray-x/lsp_signature.nvim'
"
" " Only because nvim-cmp _requires_ snippets
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/cmp-vsnip'
"
" " Syntactic language support
" Plug 'cespare/vim-toml', {'branch': 'main'}
" Plug 'stephpy/vim-yaml'
" Plug 'rust-lang/rust.vim'
" Plug 'rhysd/vim-clang-format'
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
"
" call plug#end()
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => General
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Sets how many lines of history VIM has to remember
" set history=500
"
" " Enable filetype plugins
" filetype plugin on
" filetype indent on
"
" " Set to auto read when a file is changed from the outside
" set autoread
" au FocusGained,BufEnter * checktime
"
" " With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
" " leader changed to space
" let mapleader = " "
"
" " Fast saving
" " nmap <leader>w :w!<cr>
"
" " :W sudo saves the file
" " (useful for handling the permission-denied error)
" command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
"
" set number
" set autoindent
" set tabstop=2
" set shiftwidth=2
" set smarttab
" set softtabstop=2
" set mouse=a
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => VIM user interface
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Set 7 lines to the cursor - when moving vertically using j/k
" set so=7
"
" " Avoid garbled characters in Chinese language windows OS
" let $LANG='en'
" set langmenu=en
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim
"
" " Turn on the Wild menu
" set wildmenu
"
" " Ignore compiled files
" set wildignore=*.o,*~,*.pyc
" if has("win16") || has("win32")
"     set wildignore+=.git\*,.hg\*,.svn\*
" else
"     set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
" endif
"
" " Always show current position
" set ruler
"
" " Height of the command bar
" set cmdheight=2
"
" " A buffer becomes hidden when it is abandoned
" set hidden
"
" " Configure backspace so it acts as it should act
" set backspace=eol,start,indent
" set whichwrap+=<,>,h,l
"
" " Ignore case when searching
" set ignorecase
"
" " When searching try to be smart about cases
" set smartcase
"
" " Highlight search results
" set hlsearch
"
" " Makes search act like search in modern browsers
" set incsearch
"
" " Don't redraw while executing macros (good performance config)
" set lazyredraw
"
" " For regular expressions turn magic on
" set magic
"
" " Show matching brackets when text indicator is over them
" set showmatch
"
" " How many tenths of a second to blink when matching brackets
" set mat=2
"
" " No annoying sound on errors
" set noerrorbells
" set novisualbell
" set t_vb=
" set timeoutlen=500
"
" " Properly disable sound on errors on MacVim
" if has("gui_macvim")
"     autocmd GUIEnter * set vb t_vb=
" endif
"
" " Add a bit extra margin to the left
" set foldcolumn=1
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Files, backups and undo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Turn backup off, since most stuff is in SVN, git etc. anyway...
" set nobackup
" set nowb
" set noswapfile
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Parenthesis/bracket
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lua << EOF
" require("nvim-autopairs").setup {}
" EOF
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Moving around, tabs, windows and buffers
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Disable highlight when <leader><cr> is pressed
" " map <silent> <leader><cr> :noh<cr>
"
" " Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l
"
" " Must have config
" inoremap jk <Esc>
"
" " buffer next or previous
" " lua << EOF
" " vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", opt)
" " vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", opt)
" " EOF
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Colors and Themes
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax enable
"
" " Enable 256 colors palette in Gnome Terminal
" if $COLORTERM == 'gnome-terminal'
"     set t_Co=256
" endif
"
" set background=dark
" colorscheme vscode
"
" lua << EOF
" require("lualine").setup({
"     options = {
"         theme = "vscode",
" 				component_separators = { left = "|", right = "|" },
" 				-- https://github.com/ryanoasis/powerline-extra-symbols
" 				section_separators = { left = " ", right = "" },
"     },
" })
"
" -- https://github.com/akinsho/bufferline.nvim#configuration
" require("bufferline").setup({
"   options = {
"     -- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
"     close_command = "Bdelete! %d",
"     right_mouse_command = "Bdelete! %d",
"     -- 侧边栏配置
"     -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
"     offsets = {
"       {
"         filetype = "NvimTree",
"         text = "File Explorer",
"         highlight = "Directory",
"         text_align = "left",
"       },
"     },
"     diagnostics = "nvim_lsp",
"     -- 可选，显示 LSP 报错图标
"     ---@diagnostic disable-next-line: unused-local
"     diagnostics_indicator = function(count, level, diagnostics_dict, context)
"       local s = " "
"       for e, n in pairs(diagnostics_dict) do
"         local sym = e == "error" and " " or (e == "warning" and " " or "")
"         s = s .. n .. sym
"       end
"       return s
"     end,
"   },
" })
" EOF
"
" " Set utf8 as standard encoding and en_US as the standard language
" set encoding=utf8
" set fileencoding=utf-8
" set fileencodings=utf-8
"
" " Use Unix as the standard file type
" set ffs=unix,dos,mac
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Vim Tree
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lua << EOF
" local nvim_tree = require("nvim-tree")
"
" nvim_tree.setup({
"   disable_netrw = true,
"   view = {
"     width = 30,
"     side = "left",
"     hide_root_folder = false,
"     number = false,
"     relativenumber = false,
"     signcolumn = "yes",
"     mappings = {
"       custom_only = false,
"       list = {
"         -- user mappings go here
"       },
"     },
"   },
"   renderer = {
"     indent_markers = {
"       enable = false,
"       icons = {
"         corner = "└ ",
"         edge = "│ ",
"         none = "  ",
"       },
"     },
"     icons = {
"       webdev_colors = true,
"     },
"   },
"   update_cwd = true,
"   update_focused_file = {
"     enable = true,
"     update_cwd = true,
"   },
"   system_open = {
"     cmd = "open",
"   },
"   diagnostics = {
"     enable = false,
"     show_on_dirs = false,
"     icons = {
"       hint = "",
"       info = "",
"       warning = "",
"       error = "",
"     },
"   },
"   filters = {
"     dotfiles = false,
"     custom = {},
"     exclude = {},
"   },
"   git = {
"     enable = false,
"   },
"   actions = {
"     open_file = {
"       resize_window = true,
"       quit_on_open = true,
"     },
"   },
" })
"
" -- vim.keymap.set('n', '<leader>nn', function()
" --   return require('nvim-tree').toggle(false, true)
" -- end,
" -- { noremap = true, silent = true, desc = "toggle nvim-tree"})
" EOF
"
"
" "*****************************************************************************
" "" Commands
" "*****************************************************************************
" " remove trailing whitespaces
" command! FixWhitespace :%s/\s\+$//e
" " nmap <leader>m :FixWhitespace<CR>
"
" "=================================================================================
" "
" "   Following file contains the commands on how to run the currently open code.
" "   The default mapping is set to F5 like most code editors.
" "   Change it as you feel comfortable with, keeping in mind that it does not
" "   clash with any other keymapping.
" "
" "   NOTE: Compilers for different systems may differ. For example, in the case
" "   of C and C++, we have assumed it to be gcc and g++ respectively, but it may
" "   not be the same. It is suggested to check first if the compilers are installed
" "   before running the code, or maybe even switch to a different compiler.
" "
" "   NOTE: Adding support for more programming languages
" "
" "   Just add another elseif block before the 'endif' statement in the same
" "   way it is done in each case. Take care to add tabbed spaces after each
" "   elseif block (similar to python). For example:
" "
" "   elseif &filetype == '<your_file_extension>'
" "       exec '!<your_compiler> %'
" "
" "   NOTE: The '%' sign indicates the name of the currently open file with extension.
" "         The time command displays the time taken for execution. Remove the
" "         time command if you dont want the system to display the time
" "
" "=================================================================================
"
" map <F5> :call CompileRun()<CR>
" imap <F5> <Esc>:call CompileRun()<CR>
" vmap <F5> <Esc>:call CompileRun()<CR>
"
" func! CompileRun()
" exec "w"
" if &filetype == 'c'
"     exec "!gcc % -o %<"
"     exec "!time ./%<"
" elseif &filetype == 'cpp'
"     exec "!g++ -std=c++11 % -o %<"
"     exec "!time ./%<"
" elseif &filetype == 'sh'
"     exec "!time bash %"
" elseif &filetype == 'python'
"     exec "!time python3 %"
" elseif &filetype == 'html'
"     exec "!google-chrome % &"
" elseif &filetype == 'go'
"     exec "!go build %<"
"     exec "!time go run %"
" endif
" endfunc
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => vim-comment
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Somewhere after plug#end()
" lua << EOF
" require('Comment').setup()
" EOF
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Telescope settings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lua << EOF
" require("project_nvim").setup {
" 	-- your configuration comes here
" 	-- or leave it empty to use the default settings
" 	-- refer to the configuration section below
" 	}
" require('telescope').load_extension('projects')
" EOF
"
" " Find files using Telescope command-line sugar.
" " nnoremap <leader>ff <cmd>Telescope find_files<cr>
" " nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" " nnoremap <leader>fr <cmd>Telescope oldfiles<cr>
" " nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"
" " nnoremap <leader>pp <cmd>Telescope projects<cr>
"
"
" " nnoremap <leader>bb <cmd>Telescope buffers<cr>
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => LSP settings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:vsnip_snippet_dir = expand('~/.config/nvim/vscode-snippets/')
"
" lua << EOF
" require("nvim-lsp-installer").setup(
" 	{
"     automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
"     ui = {
"         icons = {
"             server_installed = "✓",
"             server_pending = "➜",
"             server_uninstalled = "✗"
"         }
"     }
" })
"
" -- Mappings.
" local opts = { noremap=true, silent=true }
"
" -- Use an on_attach function to only map the following keys
" -- after the language server attaches to the current buffer
" local on_attach = function(client, bufnr)
"   -- Enable completion triggered by <c-x><c-o>
"   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
"
"   -- Mappings.
"   -- See `:help vim.lsp.*` for documentation on any of the below functions
"   local bufopts = { noremap=true, silent=true, buffer=bufnr }
" 	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
" 	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
"   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
"   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
"   vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
"   vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
"   vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
"   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
" --   vim.keymap.set('n', '<Leader>wl', function()
" --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
" --   end, bufopts)
" --   vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
" --   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
" --   vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
" --   vim.keymap.set('n', '<leader>fc', vim.lsp.buf.formatting, bufopts)
" end
"
" local lsp_flags = {
"   -- This is the default in Nvim 0.7+
"   debounce_text_changes = 150,
" }
"
" -- Add additional capabilities supported by nvim-cmp
" local capabilities = vim.lsp.protocol.make_client_capabilities()
" capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
"
" local lspconfig = require('lspconfig')
"
" -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
" local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
" for _, lsp in ipairs(servers) do
"   lspconfig[lsp].setup {
"     on_attach = on_attach,
" 		flags = lsp_flags,
"     capabilities = capabilities,
"   }
" end
"
" -- config diagnostics
" local diagnostic_config = {
" 	-- disable virtual text
" 	virtual_text = false,
" 	-- show signs
" 	signs = {
" 		active = signs,
" 		},
" 	update_in_insert = true,
" 	underline = true,
" 	severity_sort = true,
" 	float = {
" 		focusable = false,
" 		style = "minimal",
" 		border = "rounded",
" 		source = "always",
" 		header = "",
" 		prefix = "",
" 		},
" 	}
"
" vim.diagnostic.config(diagnostic_config)
"
"
" -- nvim-cmp setup
" local has_words_before = function()
"   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
"   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
" end
"
" local feedkey = function(key, mode)
"   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
" end
"
" local cmp = require 'cmp'
" cmp.setup {
"   snippet = {
"     expand = function(args)
" 			-- For `vsnip` users.
"       vim.fn["vsnip#anonymous"](args.body)
"     end,
"   },
"   mapping = {
"     ["<Tab>"] = cmp.mapping(function(fallback)
"       if cmp.visible() then
"         cmp.select_next_item()
"       elseif vim.fn["vsnip#available"](1) == 1 then
"         feedkey("<Plug>(vsnip-expand-or-jump)", "")
"       elseif has_words_before() then
"         cmp.complete()
"       else
"         fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
"       end
"     end, { "i", "s" }),
"
"     ["<S-Tab>"] = cmp.mapping(function()
"       if cmp.visible() then
"         cmp.select_prev_item()
"       elseif vim.fn["vsnip#jumpable"](-1) == 1 then
"         feedkey("<Plug>(vsnip-jump-prev)", "")
"       end
"     end, { "i", "s" }),
" 		["<CR>"] = cmp.mapping.confirm({
" 			select = true,
" 			behavior = cmp.ConfirmBehavior.Replace
" 		})
"   },
"   sources = cmp.config.sources({
"     { name = 'nvim_lsp' },
"     { name = 'vsnip' },
"   },{ { name = "buffer" }, { name = "path" } })
" }
" EOF
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => hop settings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lua << EOF
" vim.cmd[[ hi HopNextKey cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
" vim.cmd[[ hi HopNextKey1 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
" vim.cmd[[ hi HopNextKey2 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
"
" require('hop').setup({
"   case_insensitive = true,
"   char2_fallback_key = '<CR>',
"   quit_key='<Esc>',
" })
"
" vim.keymap.set('n', 'f', function()
"   return require('hop').hint_char2()
" end,
" { silent = true, noremap = true, desc = "nvim-hop char2" })
" EOF
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => which-key settings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lua << EOF
" local wk = require("which-key")
"
" wk.setup {
" 	plugins = {
" 		marks = true, -- shows a list of your marks on ' and `
" 		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
" 		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
" 		-- No actual key bindings are created
" 		presets = {
" 			operators = false, -- adds help for operators like d, y, ...
" 			motions = false, -- adds help for motions
" 			text_objects = false, -- help for text objects triggered after entering an operator
" 			windows = false, -- default bindings on <c-w>
" 			nav = true, -- misc bindings to work with windows
" 			z = true, -- bindings for folds, spelling and others prefixed with z
" 			g = true, -- bindings for prefixed with g
" 			},
" 		spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
" 		},
" 	icons = {
" 		breadcrumb = "?", -- symbol used in the command line area that shows your active key combo
" 		separator = "?", -- symbol used between a key and it's label
" 		group = "+", -- symbol prepended to a group
" 		},
" 	popup_mappings = {
" 		scroll_down = "<c-d>", -- binding to scroll down inside the popup
" 		scroll_up = "<c-u>", -- binding to scroll up inside the popup
" 		},
" 	window = {
" 		border = "single", -- none, single, double, shadow
" 		position = "bottom", -- bottom, top
" 		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
" 		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
" 		winblend = 0,
" 		},
" 	layout = {
" 		height = { min = 4, max = 25 }, -- min and max height of the columns
" 		width = { min = 20, max = 50 }, -- min and max width of the columns
" 		spacing = 3, -- spacing between columns
" 		align = "left", -- align columns left, center or right
" 		},
" 	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
" 	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
" 	show_help = true, -- show help message on the command line when the popup is visible
" 	triggers = "auto", -- automatically setup triggers
" 	-- triggers = {"<leader>"} -- or specify a list manually
" 	triggers_blacklist = {
" 		-- list of mode / prefixes that should never be hooked by WhichKey
" 		-- this is mostly relevant for key maps that start with a native binding
" 		-- most people should not need to change this
" 		i = { "j", "k" },
" 		v = { "j", "k" },
" 		},
" 	}
"
" opts = {
" 	mode = "n", -- NORMAL mode
" 	prefix = "<leader>",
" 	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
" 	silent = true, -- use `silent` when creating keymaps
" 	noremap = true, -- use `noremap` when creating keymaps
" 	nowait = true, -- use `nowait` when creating keymaps
" 	}
"
" vopts = {
" 	mode = "v", -- VISUAL mode
" 	prefix = "<leader>",
" 	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
" 	silent = true, -- use `silent` when creating keymaps
" 	noremap = true, -- use `noremap` when creating keymaps
" 	nowait = true, -- use `nowait` when creating keymaps
" 	}
"
" -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
" -- see https://neovim.io/doc/user/map.html#:map-cmd
" vmappings = {
" 	["/"] = { "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment" },
" 	}
"
" mappings = {
" 	["W"] = { "<cmd>w!<CR>", "Save" },
" 	["/"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment" },
" 	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
" 	["m"] = { "<cmd>FixWhitespace<cr>", "Remove trailing space"},
" 	c = {
" 		name = "Code",
" 		c = { "<cmd>call CompileRun()<cr>", "CompileRun" },
" 		f = { vim.lsp.buf.formatting, "Formatting code"},
" 		},
" 	w = {
" 		name = "Windows",
" 		j = {"<cmd>wincmd j<CR>", "window down"},
" 		k = {"<cmd>wincmd k<CR>", "window up"},
" 		h = {"<cmd>wincmd h<CR>", "window left"},
" 		l = {"<cmd>wincmd l<CR>", "window right"},
" 		},
" 	b = {
" 		name = "Buffers",
" 		j = { "<cmd>BufferLinePick<cr>", "Jump" },
" 		f = { "<cmd>Telescope buffers<cr>", "Find" },
" 		b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
" 		d = { "<cmd>Bdelete!<cr>", "Close Buffer" },
" 		e = {
" 			"<cmd>BufferLinePickClose<cr>",
" 			"Pick which buffer to close",
" 			},
" 		D = {
" 			"<cmd>BufferLineSortByDirectory<cr>",
" 			"Sort by directory",
" 			},
" 		L = {
" 			"<cmd>BufferLineSortByExtension<cr>",
" 			"Sort by language",
" 			},
" 		},
" 	l = {
" 		name = "LSP",
" 		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
" 		d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
" 		D = { vim.lsp.buf.type_definition, "Type Definition"},
" 		w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
" 		i = { "<cmd>LspInfo<cr>", "Info" },
" 		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
" 		j = { vim.diagnostic.goto_next, "Next Diagnostic", },
" 		k = { vim.diagnostic.goto_prev, "Prev Diagnostic", },
" 		l = { vim.lsp.codelens.run, "CodeLens Action" },
" 		q = { vim.diagnostic.setloclist, "Quickfix" },
" 		r = { vim.lsp.buf.rename, "Rename" },
" 		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
" 		S = {
" 			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
" 			"Workspace Symbols",
" 			},
" 		e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
" 		},
" 	f = {
" 		name = "File",
" 		f = { "<cmd>Telescope find_files<cr>", "Find File" },
" 		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
" 		t = { "<cmd>NvimTreeToggle<CR>", "File tree"},
" 		},
" 	s = {
" 		name = "Search",
" 		t = { "<cmd>Telescope live_grep<cr>", "Text" },
" 		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
" 		R = { "<cmd>Telescope registers<cr>", "Registers" },
" 		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
" 		C = { "<cmd>Telescope commands<cr>", "Commands" },
" 		},
" 	p = {
" 		name = "Project",
" 		p = { "<cmd>Telescope projects<cr>", "Find Project"},
" 		},
" 	T = {
" 		name = "Treesitter",
" 		i = { ":TSConfigInfo<cr>", "Info" },
" 		},
" 	}
"
" wk.register(mappings, opts)
" wk.register(vmappings, vopts)
" EOF
