set runtimepath^=~/.dotfiles/vim
set runtimepath+=~/.dotfiles/vim/after
set nocompatible
set encoding=utf-8
set mouse=a
set nowrap
set autoindent
set guioptions-=tT
set guioptions+=lr
let mapleader = ","

" vim-plug initialisation
call plug#begin('~/.vim/plugged')
if v:version < 801
  Plug 'iamcco/markdown-preview.vim'
else
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
endif
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'xolox/vim-misc' "Regd by vim-session
Plug 'xolox/vim-session'
call plug#end()

" To ensure Markdown files are correctly identified in older versions of Vim
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Set vim-sessions plugin options
let g:session_autoload='no'
let g:session_autosave='no'

" Use Unix line endings in preference.
set fileformats=unix,dos,mac
set fileformat=unix

set history=1000
"set spell

" Set a nice theme.
syntax enable
colorscheme PaperColor
"colorscheme medic_chalk
"colorscheme molokai
"colorscheme gruvbox
"colorscheme Tomorrow-Night
set background=dark
"set cursorline
set colorcolumn=80
set listchars=tab:»\ ,eol:┘,trail:·
set listchars+=extends:›,precedes:‹
set listchars+=conceal:¤,nbsp:┴
if v:version >= 705
    set listchars+=space:·
endif
set list
set showbreak=…\ 

" Toggle highlight trailing whitespace and any tabs.
let g:toggleHighlightWhitespace = 1

function! ToggleHighlightWhitespace()
  let g:toggleHighlightWhitespace=0-g:toggleHighlightWhitespace
  call RefreshHighlightWhitespace()
endfunction

function! RefreshHighlightWhitespace()
    if g:toggleHighlightWhitespace == 1 "normal action, do the hi
        highlight extrawhitespace ctermbg=red guibg=red
        match extrawhitespace '\s\+$\|\t'
        augroup HighlightWhitespace
        autocmd bufwinenter * match extrawhitespace '\s\+$\|\t'
        autocmd insertenter * match extrawhitespace '\s\+\%#\@<!$\|\t'
        autocmd insertleave * match extrawhitespace '\s\+$\|\t'
        " fix for match memory leak.
        if v:version >= 702
            autocmd bufwinleave * call clearmatches()
        endif
        augroup END
    else
        call clearmatches()
        autocmd! HighlightWhitespace BufWinEnter
        autocmd! HighlightWhitespace InsertEnter
        autocmd! HighlightWhitespace InsertLeave
        autocmd! HighlightWhitespace BufWinLeave
    endif
endfunction

autocmd BufWinEnter * call RefreshHighlightWhitespace()
autocmd BufWinLeave * call RefreshHighlightWhitespace()
nnoremap <leader>w :call ToggleHighlightWhitespace()<cr>

" set fonts
if (has("gui_gtk3")||has("gui_gtk2"))
  set guifont=fantasque\ sans\ mono\ 14,mono\ 12
else
  set guifont=mono:h12,lucida\ console:h11,fixedsys:h11
endif

" shows partial commands to the right on the command line as you type.
set showcmd

" display the line numbers.
set number
if v:version > 702
    set relativenumber
    :augroup numbertoggle
        :  autocmd!
        :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    :augroup END
    let c_comment_strings=1
endif

" Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

"Searching __________________________________________________________
set incsearch       " Show the next match while entering search
set hlsearch        " Highligh search results

" Spaces and tabs ___________________________________________________
set expandtab       " tabs are spaces
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces used for indenting
set autoindent
filetype plugin indent on

" Mappings _________________________________________________________
nnoremap <Leader>r <C-r>
" Use 'jj' in insert mode instead of <Esc>.
inoremap jj <ESC>
" Move between window splits using <ctrl>+J|K|L|H
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Easy buffer switching
nnoremap <F5> :buffers<CR>:buffer<Space>

" Toggle scrolloff to keep cursor centred vertically
set scrolloff=10
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

" Markdown-preview config
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:mkdp_browser = 'firefox'

" Navigating with guides
    inoremap <leader><leader> <Esc>/<++><Cr>"_c4l
    vnoremap <leader><leader> <Esc>/<++><Cr>"_c4l
    map <leader><leader> <Esc>/<++><Cr>"_c4l

"MARKDOWN
    autocmd Filetype markdown,rmd map <leader>w yiWi[<Esc>Ea](<Esc>pa)
    autocmd Filetype markdown,rmd inoremap <leader>e **<++><Esc>F*i
    autocmd Filetype markdown,rmd inoremap <leader>b ****<++><Esc>F*hi
    autocmd Filetype markdown,rmd inoremap <leader>eb ******<++><Esc>F*2hi
    autocmd Filetype markdown,rmd inoremap <leader>s ~~~~<++><Esc>F~hi
    autocmd Filetype markdown,rmd inoremap <leader>i ![](<++>)<++><Esc>F[a
    autocmd Filetype markdown,rmd inoremap <leader>l [](<++>)<++><Esc>F[a
    autocmd Filetype markdown,rmd inoremap <leader>1 #<Space><Cr><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap <leader>2 ##<Space><Cr><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap <leader>3 ###<Space><Cr><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap <leader>4 ####<Space><Cr><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap <leader>5 #####<Space><Cr><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap <leader>6 ######<Space><Cr><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap <leader>q ><Space>
    autocmd Filetype markdown,rmd inoremap <leader>c ```<Cr>```<Cr><++><Esc>kO
    autocmd Filetype markdown,rmd inoremap <leader>r ```{r}<Cr>```<Cr><++><Esc>kO
    autocmd Filetype markdown,rmd inoremap <leader>p ```{python}<Cr>```<Cr><++><Esc>kO
    autocmd Filetype markdown,rmd inoremap <leader>h ________________________________________<Cr>
