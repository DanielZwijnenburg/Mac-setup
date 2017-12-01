set nocompatible                " choose no compatibility with legacy vi
filetype off
let mapleader = ","

call plug#begin('~/.vim/bundle')
  Plug 'junegunn/vim-easy-align'

" Highlights
  Plug 'sheerun/vim-polyglot'
  let g:ruby_indent_access_modifier_style = 'outdent'

" Indentation
  Plug 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_auto_colors = 0
  let g:indent_guides_indent_levels = 8

" colors
  Plug 'altercation/solarized', { 'rtp': 'vim-colors-solarized' }
  Plug 'altercation/vim-colors-solarized'

" Git - command Integration
  Plug 'tpope/vim-fugitive'
  nnoremap <LEADER>gb :Gblame<CR>
  nnoremap <LEADER>gs :Gdiff<CR>
  nnoremap <LEADER>gd :Gdiff master<CR>

  Plug 'int3/vim-extradite'
  nnoremap <LEADER>ge :Extradite<CR>

  Plug 'airblade/vim-gitgutter'

" Ruby / Rails
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
    let g:rails_projections = {
    \ "spec/factories/*.rb": {
    \   "command":   "factory",
    \   "affinity":  "collection",
    \   "alternate": "app/models/%i.rb",
    \   "related":   "db/schema.rb#%s",
    \   "test":      ["unit/models/%i_test.rb", "spec/models/%i_spec.rb"],
    \   "template":  "FactoryGirl.define do\n  factory :%i do\n  end\nend",
    \   "keywords":  "factory sequence"
    \ }}

  Plug 'tpope/vim-bundler', { 'for': 'ruby' }
  Plug 'danchoi/ri.vim', {'for': 'ruby'}  " documentation
    let g:ri_no_mappings=1
    nnoremap  <LEADER>rd :call ri#OpenSearchPrompt(1)<cr> " vertical split
    nnoremap  <LEADER>rc :call ri#LookupNameUnderCursor()<cr> " keyword lookup

  Plug 'janko-m/vim-test'
    nmap <silent> <leader>T :TestNearest<CR>
    nmap <silent> <leader>t :TestFile<CR>
    nmap <silent> <leader>a :TestSuite<CR>
    nmap <silent> <leader>L :TestLast<CR>
    nmap <silent> <leader>g :TestVisit<CR>

    let test#strategy = "dispatch"
    let test#filename_modifier = ":p"

  Plug 'tpope/vim-rbenv', {'for': 'ruby'}
  Plug 'kana/vim-textobj-user'
  Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'AndrewRadev/switch.vim'
  nnoremap - :Switch<cr>
  autocmd FileType gitrebase let b:switch_custom_definitions = [
    \   ['pick', 'reword', 'edit', 'squash', 'fixup'],
    \ ]

" Util - Searching
  Plug '/usr/local/opt/the_silver_searcher/'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug '/usr/local/opt/fzf/'
    set grepprg=ag\ --vimgrep\ --hidden\ --ignore\ .git/
    let $FZF_DEFAULT_COMMAND = 'ag -g ""'

    let g:fzf_buffers_jump = 1
    let g:fzf_commits_log_options = '--color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    let g:fzf_history_dir = '~/.vim/fzf/'

    nnoremap <silent> <C-p> :FZF<CR>

    autocmd VimEnter * command! Colors
      \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})

    nnoremap <C-G>c :Commits<CR>
    nnoremap <C-G>b :BCommits<CR>
    nnoremap <C-G>f :GFiles?<CR>
    nnoremap <C-F>c :Colors<CR>
    nnoremap <C-F>t :Tags<CR>
    nnoremap <silent> <C-p> :FZF<CR>

    nmap <leader><tab> <plug>(fzf-maps-n)
    xmap <leader><tab> <plug>(fzf-maps-x)
    omap <leader><tab> <plug>(fzf-maps-o)

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)
    imap <c-x><c-b> <plug>(fzf-complete-buffer-line)

" Util - Linting
  Plug 'w0rp/ale'
    let g:ale_lint_on_enter = 0
    let g:ale_sign_column_always = 1
    let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
    let g:ale_echo_msg_format = '%linter%: %s'
    let g:ale_linters = {
    \   'javascript': ['eslint', 'flow'],
    \}

" Util - Commenting
  Plug 'tomtom/tcomment_vim'
    map <leader>/ :TComment<CR>

" Util - Asynchronous tasks
  Plug 'tpope/vim-dispatch'

" Util - Block completion
  Plug 'tpope/vim-endwise'

" Util - quoting/parenthesizing Enhancements
  Plug 'tpope/vim-surround'

  Plug 'tpope/vim-unimpaired'
  "
" Util - make things repeatable with '.'
  Plug 'tpope/vim-repeat'

" Util - vertically aligning things
  Plug 'godlygeek/tabular'

" Util - Toggle inline/multiline
  Plug 'AndrewRadev/splitjoin.vim'
    let g:splitjoin_split_mapping = '<LEADER>sm'
    let g:splitjoin_join_mapping = '<LEADER>jm'
  Plug 'jgdavey/vim-blockle'
    let g:blockle_mapping = '<LEADER>bl'

" Util - Sensible defaults
  Plug 'tpope/vim-sensible'

  Plug 'vim-scripts/Improved-AnsiEsc'

" Util - Tmux
  Plug 'christoomey/vim-tmux-navigator'
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l

" Util - Whitespaste
  Plug 'AndrewRadev/whitespaste.vim'
  Plug 'sickill/vim-pasta'
    let g:pasta_enabled_filetypes = []
    let g:whitespaste_paste_before_command = "normal \<Plug>BeforePasta"
    let g:whitespaste_paste_after_command  = "normal \<Plug>AfterPasta"
    let g:whitespaste_paste_visual_command = "normal gv\<Plug>VisualPasta"


" Util - NerdTree
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " enable vi to close when NERDTree is the only open tab
    map <C-n> :NERDTreeToggle<CR>

call plug#end()
filetype plugin indent on " Turn on _after_ loading all Plugins

set shell=/bin/sh
syntax enable
set encoding=utf-8
set number                      " show line numbers
set showcmd                     " display incomplete commands
set showmatch                   " show matching braces
set mouse=a                     " use mouse in all modes
set ts=2
set sw=2
set clipboard=unnamed          " Yanks go on clipboard instead.
set splitbelow
set splitright
set tabstop=2
set shiftwidth=2                " a tab is two spaces (or set this to 4)
set softtabstop=2
set expandtab                   " use spaces, not tabs (optional)
set smarttab                    " deindent with <BS>, start at indent level
set backspace=indent,eol,start  " backspace through everything in insert mode
set ruler                       " show the cursor position all the time
set nofoldenable                " Say no to code folding...
set antialias
set linespace=0
set ignorecase                  " searches are case insensitive...
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set history=500                 " keep 500 lines of command line history
set autoread                    " reload files only changed outside vim from disk
set autowrite                   " write before :next/:cnext
set ttyfast                     " you got a fast terminal
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set lazyredraw                  " prevent redraws while executing
set smartcase                   " ... unless they contain at least one capital letter
set scrolloff=5                 " don't show search results as the first line
set smartindent
set autoindent                  " always set autoindenting on
set shiftround                  " When at 3 spaces and I hit >>, go to 4, not 5.
set wildmenu                    " Better? completion on command line
set wildmode=list:longest,full  " Completion settings
set tags+=.git/tags-includes    " Search for ctag file in .git/
set wildignore+=tags            " Don't complete from project code ctag file
set wildignore+=tags-includes   " Don't complete from includes code ctag file
set list                        " Create a list & make invisible chars visible

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

" colors
colorscheme solarized
set background=light
let g:solarized_termcolors=256

" improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Disable Ex mode
noremap Q <NOP>
command! Q q "Bind :Q to :q"
command! Qall qall "Bind :Qall to :qall"

"" keymaps
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
nnoremap <leader><leader> <c-^>
noremap <Leader>h :noh<CR>
noremap <Leader>o :silent execute "!open . &>/dev/null &" <bar> redraw!<CR>
noremap <space><space> :w<CR>
nnoremap <Leader>pry orequire 'pry'; binding.pry # DEBUG<ESC>

if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  " nnoremap <LEADER>f :silent! grep! "\b<C-r><C-w>\b"<CR>:cwindow<CR>:redraw!<CR>
  nnoremap <LEADER>f :grep!<SPACE>
  nnoremap <LEADER>F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
  command! -nargs=+ -complete=file_in_path -bar Ag silent grep! <args>|cwindow|redraw!
endif

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
