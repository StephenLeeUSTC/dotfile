" My own tiny config, inspired by awesome vimrc project

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Plug core
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'preservim/nerdtree'
Plug 'terryma/vim-multiple-cursors' " use ctrl + n
Plug 'numToStr/Comment.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ahmedkhalf/project.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'Mofiqul/vscode.nvim' " colorscheme
Plug 'phaazon/hop.nvim'

" Semantic language support
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'ray-x/lsp_signature.nvim'

" Only because nvim-cmp _requires_ snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'

" Syntactic language support
Plug 'cespare/vim-toml', {'branch': 'main'}
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

set number
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set mouse=a

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("nvim-autopairs").setup {}
EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Must have config
inoremap jk <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set background=dark
colorscheme vscode

lua << EOF
require("lualine").setup({
    options = {
        -- ...
        theme = "vscode",
        -- ...
    },
})
EOF

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencoding=utf-8
set fileencodings=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='~'
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"=================================================================================
"
"   Following file contains the commands on how to run the currently open code.
"   The default mapping is set to F5 like most code editors.
"   Change it as you feel comfortable with, keeping in mind that it does not
"   clash with any other keymapping.
"
"   NOTE: Compilers for different systems may differ. For example, in the case
"   of C and C++, we have assumed it to be gcc and g++ respectively, but it may
"   not be the same. It is suggested to check first if the compilers are installed
"   before running the code, or maybe even switch to a different compiler.
"
"   NOTE: Adding support for more programming languages
"
"   Just add another elseif block before the 'endif' statement in the same
"   way it is done in each case. Take care to add tabbed spaces after each
"   elseif block (similar to python). For example:
"
"   elseif &filetype == '<your_file_extension>'
"       exec '!<your_compiler> %'
"
"   NOTE: The '%' sign indicates the name of the currently open file with extension.
"         The time command displays the time taken for execution. Remove the
"         time command if you dont want the system to display the time
"
"=================================================================================

map <F5> :call CompileRun()<CR>
imap <F5> <Esc>:call CompileRun()<CR>
vmap <F5> <Esc>:call CompileRun()<CR>

func! CompileRun()
exec "w"
if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
elseif &filetype == 'cpp'
    exec "!g++ -std=c++11 % -o %<"
    exec "!time ./%<"
elseif &filetype == 'sh'
    exec "!time bash %"
elseif &filetype == 'python'
    exec "!time python3 %"
elseif &filetype == 'html'
    exec "!google-chrome % &"
elseif &filetype == 'go'
    exec "!go build %<"
    exec "!time go run %"
endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-comment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Somewhere after plug#end()
lua << EOF
require('Comment').setup()
EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Telescope settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("project_nvim").setup {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	}
require('telescope').load_extension('projects')
EOF
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fp <cmd>Telescope projects<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LSP settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
		flags = lsp_flags,
    capabilities = capabilities,
  }
end


-- nvim-cmp setup
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
			-- For `vsnip` users.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace
		})
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  },{ { name = "buffer" }, { name = "path" } })
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => hop settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
vim.cmd[[ hi HopNextKey cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
vim.cmd[[ hi HopNextKey1 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
vim.cmd[[ hi HopNextKey2 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]

require('hop').setup({
  case_insensitive = true,
  char2_fallback_key = '<CR>',
  quit_key='<Esc>',
})

vim.keymap.set('n', 'f', function()
  return require('hop').hint_char2()
end,
{ silent = true, noremap = true, desc = "nvim-hop char2" })
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif
