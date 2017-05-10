set nocompatible                " choose no compatibility with legacy vi
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
let mapleader = ","

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'AndrewRadev/switch.vim'
Plugin 'AndrewRadev/whitespaste.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'altercation/solarized', {'rtp': 'vim-colors-solarized'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'benmills/vimux'
Plugin 'chase/vim-ansible-yaml'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'esneider/YUNOcommit.vim'
let g:YUNOcommit_after = 10
Plugin 'godlygeek/tabular'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'leshill/vim-json'
Plugin 'mortice/exuberant-ctags'
Plugin 'mtscout6/vim-cjsx'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'othree/xml.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'sickill/vim-pasta'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
let g:ruby_indent_access_modifier_style = 'outdent'
Plugin 'vimwiki/vimwiki'
let g:rspec_command='Dispatch ./bin/rspec {spec}'

call vundle#end()            " required
filetype plugin indent on    " required

set shell=/bin/sh
syntax enable
set encoding=utf-8
set relativenumber              " relative line numbers
set number                      " show line numbers
set showcmd                     " display incomplete commands
set showmatch                   " show matching braces
set mouse=a                     " use mouse in all modes

"filetype plugin indent on       " load file type plugins + indentation
let g:indent_guides_enable_on_vim_startup = 1
set ts=2
set sw=2
let g:indent_guides_start_level = 2

set background=light
colorscheme solarized
let g:solarized_termcolors=256
set clipboard=unnamed          " Yanks go on clipboard instead.
" Splits
set splitbelow
set splitright
set lazyredraw

"" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set softtabstop=2
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set ruler                       " show the cursor position all the time
set autoindent
set nofoldenable                " Say no to code folding...
set antialias
set shiftround
" set cursorline
set linespace=0

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Aliased commands

"" tmp and backup folders
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

let g:pasta_enabled_filetypes = []
let g:whitespaste_paste_before_command = "normal \<Plug>BeforePasta"
let g:whitespaste_paste_after_command  = "normal \<Plug>AfterPasta"
let g:whitespaste_paste_visual_command = "normal gv\<Plug>VisualPasta"

""rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>tj :Dispatch bundle exec teaspoon %<CR>
" map <Leader>T :call RunNearestSpec()<CR>
map <Leader>T :Dispatch bundle exec m %<CR>
map <Leader>L :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

" mini test
function! RunMiniTest()
  let test = expand('%') . ':' . line(".")

  exec ':Dispatch bundle exec m ' . test
endfunction
map <Leader>T :call RunMiniTest()<cr>

""Phteven compatible mode
map <Leader>sf :call RunCurrentSpecFile()<CR>
map <Leader>sn :call RunNearestSpec()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

"" ctags
set tags=./tags;
map <Leader>rt :!/usr/local/bin/ctags --language-force=ruby --exclude=.git --exclude=.md --exclude=log -R * `bundle show --paths`

"" nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " enable vi to close when NERDTree is the only open tab

" Tab completion
let g:SuperTabDefaultCompletionType = "<c-n>"

" ====================
" CtrlP options
" :help ctrlp-commands
" ====================
set wildignore+=*.so,*.swp,*.zip

nmap <LEADER>rf :CtrlPClearCache<CR>

let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_switch_buffer = 2
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$|^vendor$|log|^coverage$|^tmp$|^rdoc$|',
  \ 'file': '\.(png|jpg|gif|DS_Store|exe|so|dll)$'
  \ }
" let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_depth = 40      " Directory depth to recurse into when scanning
let g:ctrlp_open_new_file = 't' " open files in new tab
let g:ctrlp_max_files=0

" Use ag in CtrlP for listing files. fast enough not to use caching
" brew install silver_searcher
" if executable('ag')
"   set grepprg=ag\ --nocolor\ --nogroup\ --hidden\ --ignore\ .git/
"   let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden --ignore .git/ -g ""'
"   let g:ctrlp_use_caching = 0
" endif

if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  " nnoremap <LEADER>f :silent! grep! "\b<C-r><C-w>\b"<CR>:cwindow<CR>:redraw!<CR>
  nnoremap <LEADER>f :grep!<SPACE>
  nnoremap <LEADER>F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
  command! -nargs=+ -complete=file_in_path -bar Ag silent grep! <args>|cwindow|redraw!

  let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden --ignore .git/ -g ""'
  let g:ctrlp_use_caching = 0
endif


"" keymaps
nnoremap <LEADER>f :grep!<SPACE>
nnoremap <LEADER>F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
map <C-n> :NERDTreeToggle<CR>
map <leader>/ :TComment<CR>
nnoremap <leader><leader> <c-^>
noremap <Leader>h :noh<CR>
noremap <Leader>o :silent execute "!open . &>/dev/null &" <bar> redraw!<CR>
noremap <space><space> :w<CR>

" Switch config
nnoremap - :Switch<cr>
autocmd FileType ruby,sass,css let b:switch_custom_definitions = [
  \   {
  \     'have_no_\(\w\+\)': 'have_\1',
  \     'have_\(\w\+\)': 'have_no_\1',
  \   },
  \   ['dark', 'light'],
  \   ['high', 'low'],
  \   ['foo', 'bar', 'baz'],
  \   ['left', 'right'],
  \   ['rock', 'paper', 'scissors', 'lizard', 'Spock'],
  \ ]
autocmd FileType gitrebase let b:switch_custom_definitions = [
  \   ['pick', 'reword', 'edit', 'squash', 'fixup'],
  \ ]

" easier navigation between split windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Disable Ex mode
noremap Q <NOP>

" pryaiai <o/
nnoremap <Leader>pry orequire 'pry'; binding.pry # DEBUG<ESC>

""improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Json formatting
map <leader>fj  <Esc>:%!python -m json.tool<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>rr :call RenameFile()<cr>

function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

command! Q q "Bind :Q to :q"
command! Qall qall "Bind :Qall to :qall"
