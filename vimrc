" do not try to be compatible with vi
set nocompatible

" use mouse in terminal if available
if has('mouse')
  set mouse=a
endif

" enable filetype detection:
filetype plugin indent on

" remap <Leader> key
let mapleader = ','

"===============================================================================
" Vim-Pathogen
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

" always set auto-indenting on
set autoindent

" copy the previous indentation on auto-indenting
set copyindent

" on pressing tab, insert spaces
set expandtab

" when indenting with tab, use 4-space width
set shiftwidth=4
set smarttab

" when hitting backspace, pretend like a tab is removed, even if spaces
set softtabstop=4

" a tab is 4 spaces
set tabstop=4

" pressing F5 will remove all trailing whitespace
nnoremap <F5> :let _s = @/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:noh<Bar><CR>

"===============================================================================
" Editing
"===============================================================================

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" incremental search (as string is being typed)
set incsearch

" highlight search
set hls

" show current command
set showcmd

" show more history
set history=8193

" ignore case but not all-caps
set ignorecase
set smartcase

" Ctrl + C will copy selected visual to clipboard
vnoremap <C-c> "+y

" Ctrl + V will paste and indent
nnoremap <C-v> "+p=`]

" Ctrl + S will save
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-c>:update<CR>
inoremap <silent> <C-s> <C-o>:update<CR>

"===============================================================================
" Windows
"===============================================================================

" natural split opening
set splitbelow
set splitright

" quicker split windows navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Ctrl + W + _ will max out the height of the current split
" Ctrl + W + | will max out the width of the current split
" Ctrl + W + = will normalize all split sizes
" Ctrl + W + R will swap top/bottom or left/right split
" Ctrl + W + T will break out current window into a new tabview
" Ctrl + W + o will close all windows in the current tabview but the current one

"===============================================================================
" Plugin configurations
"===============================================================================

"=======================================
" base16-vim
"=======================================
if filereadable(expand('~/.vimrc_background'))
  let base16colorspace = 256
  source ~/.vimrc_background
endif

"=======================================
" NERDCommenter
"=======================================
" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"=======================================
" NERDTree
"=======================================
nnoremap <Leader>n :NERDTreeToggle<Enter>
nnoremap <Leader>f :NERDTreeFind<Enter>

" open NERDTree when vim starts up with no file specified
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close Vim if NERDTree is the only thing still open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"=======================================
" Syntastic
"=======================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
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
" Vim-Airline
"=======================================
let g:airline_theme = 'base16'

"=======================================
" Vim-Closetag
"=======================================
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.handlebars'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<Leader>>'

"===============================================================================
" Local customization
"===============================================================================

" local customization in ~/.vimrc_local
let $LOCALFILE = expand('~/.vimrc_local')
if filereadable($LOCALFILE)
  source $LOCALFILE
endif
