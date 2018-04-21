" do not try to be compatible with vi
set nocompatible

" use mouse in terminal if available
if has('mouse')
    set mouse=a
endif

" remap <Leader> key
let mapleader=","

"===============================================================================
" Pathogen
"===============================================================================

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"===============================================================================
" Syntax
"===============================================================================

" turn on syntax highlighting
syntax on

"===============================================================================
" Appearance
"===============================================================================

" base16-vim
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

" show matching braces when cursor is over them
set showmatch

" don't wrap lines
set nowrap

" always show relative line numbers
set relativenumber

" always show the current editing mode
set showmode

"===============================================================================
" Formatting
"===============================================================================

" always set autoindenting on
filetype plugin indent on
set autoindent
" copy the previous indentation on autoindenting
set copyindent

" on pressing tab, insert 4 spaces
set expandtab

" when indenting with tab, use 4-space width
set shiftwidth=4
set smarttab

" when hitting backspace, pretend like a tab is removed, even if spaces
set softtabstop=4

" a tab is four spaces
set tabstop=4

" pressing F5 = remove all trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:noh<Bar><CR>

"===============================================================================
" Editing
"===============================================================================

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" incremental search (as string is being typed)
set incsearch

" high light search
set hls

" show current command
set showcmd

"more history
set history=8193

" ignore case but not all-caps
set ignorecase
set smartcase

" Ctrl-C = copy selected visual to clipboard
vnoremap <C-c> "+y

" Ctrl-V = paste and indent
nnoremap <C-v> "+p=`]

" Ctrl-S = save
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-c>:update<CR>
inoremap <silent> <C-s> <C-o>:update<CR>

"===============================================================================
" Windows
"===============================================================================

" natural split openning
set splitbelow
set splitright

" quicker splitted windows navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"===============================================================================
" Plugin configurations
"===============================================================================

"=======================================
" NERDTree
"=======================================
nnoremap <Leader>n :NERDTreeToggle<Enter>
nnoremap <Leader>f :NERDTreeFind<Enter>
" close nerd three if it's the only thing still open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" automatically open nerdtreee when vim starts up with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"=======================================
" vim-airline
"=======================================
let g:airline_theme='powerlineish'

"=======================================
" syntastic
"=======================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': []
\}
nnoremap <Leader>s :SyntasticCheck<CR>
nnoremap <Leader>r :SyntasticReset<CR>
nnoremap <Leader>i :SyntasticInfo<CR>
nnoremap <Leader>m :SyntasticToggleMode<CR>

"=======================================
" ctrlp
"=======================================
set runtimepath^=~/.vim/bundle/ctrlp.vim

"=======================================
" NERDCommenter
"=======================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"===============================================================================
" Local customizations
"===============================================================================
" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
