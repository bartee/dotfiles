" ----------------------------------------------------------------------------
"  moving around, searching and patterns
" ----------------------------------------------------------------------------
set nostartofline    " keep cursor in same column for long-range motion cmds
set incsearch        " Highlight pattern matches as you type
set ignorecase       " ignore case when using a search pattern
set smartcase        " override 'ignorecase' when pattern
                     " has upper case character

" ----------------------------------------------------------------------------
"  Displaying text {{{1
" ----------------------------------------------------------------------------
set scrolloff=3       " number of screen lines to show around the cursor

set linebreak			    " For lines longer than the window, wrap intelligently.
                      " This doesn't insert hard line breaks.

set sidescrolloff=2		" min # of columns to keep left/right of cursor
set display+=lastline " show last line, even if it doesn't fit in the window

set cmdheight=2 		  " # of lines for the command window
                      " cmdheight=2 helps avoid 'Press ENTER...' prompts

" ----------------------------------------------------------------------------
"  Terminal {{{1
" ----------------------------------------------------------------------------
set ttyfast			      " this is the 21st century, people

" ----------------------------------------------------------------------------
"  Messages and info {{{1
" ----------------------------------------------------------------------------
set showcmd			    " In the status bar, show incomplete commands
                    " as they are typed

set showmode        " display the current mode (Insert, Visual, Replace)
                    " in the status line.

set ruler			      " Always display the current cursor position in
                    " the Status Bar

set confirm         " Ask to save buffer instead of failing when executing
                    " commands which close buffers

" ----------------------------------------------------------------------------
"  Selecting text {{{1
" ----------------------------------------------------------------------------

set clipboard=unnamed	" Yank to the system clipboard by default

" ----------------------------------------------------------------------------
"  Tabs and indenting {{{1
" ----------------------------------------------------------------------------
set tabstop=2             " tab = 2 spaces
set shiftwidth=2          " autoindent indents 2 spaces
set smarttab              " <TAB> in front of line inserts 'shiftwidth' blanks
set softtabstop=2
set shiftround            " round to 'shiftwidth' for "<<" and ">>"
set expandtab

" ----------------------------------------------------------------------------
"  Diff mode {{{1
" ----------------------------------------------------------------------------
" set diffopt+=vertical       " start diff mode with vertical splits by default

" ----------------------------------------------------------------------------
"  Folding {{{1
" ----------------------------------------------------------------------------
if has('folding')
  set nofoldenable 		         " When opening files, all folds open by default
  set foldtext=NeatFoldText()  " Use a custom foldtext function
endif

" ----------------------------------------------------------------------------
"  Reading and writing files {{{1
" ----------------------------------------------------------------------------
set autoread			          " Automatically re-read files changed outside
                            " of Vim

" ----------------------------------------------------------------------------
"  Toggle TagBar
"  ---------------------------------------------------------------------------

nmap <F8> :TagbarToggle<CR>


" ----------------------------------------------------------------------------
"  Multiple windows {{{1
" ----------------------------------------------------------------------------
set laststatus=2  	  " Show a status line, even if there's only one
                      " Vim window

set hidden		      " allow switching away from current buffer w/o writing

set switchbuf=usetab  " Jump to the 1st open window which contains
                      " specified buffer, even if the buffer is in
                      " another tab.
                      " TODO: Add 'split' if you want to split the
                      " current window for a quickfix error window.

" When nonempty, this option determines the content of the status line
set statusline=\ %{HasPaste()}%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

set helpheight=30         " Set window height when opening Vim help windows

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

call pathogen#infect()
call pathogen#helptags()


let g:syntastic_puppet_lint_args = '--no-80chars-check --no-documentation-check'
" let g:syntastic_check_on_wq
" let g:syntastic_puppet_checkers=['puppet']


"filetype indent on

set bg=dark
set relativenumber
set number
set modeline
syntax on
set encoding=UTF-8

set cursorline

set backspace=2

autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set foldmethod=indent|set foldlevel=99
autocmd FileType puppet set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType yaml syntax on

au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>i <Plug>(go-install)
au FileType go nmap <leader>t <Plug>(go-test)



function! NumberToggle()
  if(&relativenumber == 1)
    set nonumber
    set norelativenumber
  else
    set number
    set relativenumber
  endif
endfunc

nnoremap <F2> :call NumberToggle()<cr>
nnoremap <silent> <F5> :!clear;python %<CR>

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber



if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

syntax enable
set background=dark
silent! colorscheme railscasts
"silent! colorscheme calmar256-dark


noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>

" nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber



" autocmd FileType python let &makeprg='pylint %\|sed "s/^\(\w*\):\s*\([0-9]\+\)/%:\2:\ \1:\ /g"'
" autocmd BufWritePost *.py make



" what to show when I hit :set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$



" map control-movement to window movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" map some more clever tricks
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
map <leader>n :NERDTreeToggle<CR>

set history=1000            "Store a ton of history (default is 20)
"set spell                   "Spellcheck on

" Backups & swap
set backup

" Undo
set undofile
set undolevels=1000
set undoreload=10000

" Mouse usage
silent! set mouse=a
set mousehide

" Set line at column 80
if exists('+colorcolumn')
  set colorcolumn=80    " display a line in column 80 to show you
                        " where to line break.
endif

" Search
set showmatch                   " show matching brackets/parenthesis
set mat=2
set hlsearch                    " highlight search terms

" For regular expressions turn magic on
set magic


set viminfo='10,\"100,:20,%,n~/.viminfo


" shameless copy from spf13
function! InitializeDirectories()
    let separator = "."
    let parent = $HOME
    let prefix = '.vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . prefix . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

" powerline
set rtp+=/usr/local/lib/python3.9/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256