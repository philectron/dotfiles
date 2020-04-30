" do not try to be compatible with vi
set nocompatible

" use mouse in terminal if available
if has('mouse')
  set mouse=a
endif

" enable filetype detection:
filetype plugin indent on

" remap <leader> key
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

" show aboslute line numbers
set number

" always show the current editing mode
set showmode

" show ruler indicating column limits
set colorcolumn=80,100,120,255
highlight ColorColumn ctermbg=7 guibg=lightgrey

"===============================================================================
" Editor
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

" turn off auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" incremental search (as string is being typed)
set incsearch

" highlight search
set hls

" show current command
set showcmd

" show more history
set history=8192

" ignore case but not all-caps
set ignorecase
set smartcase

" toggle the 'paste' option so indentation doesn't get messed up on pasting from
" terminal; use this by <F2>, then paste the code, then <F2> again
set pastetoggle=<F2>

" Ctrl + S will save
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-c>:update<CR>
inoremap <silent> <C-s> <C-o>:update<CR>

" Move across wrapped line when softwrap is on, otherwise move normally
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

"===============================================================================
" Windows
"===============================================================================

" natural split opening
set splitbelow
set splitright

" quicker split windows navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

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
elseif !exists('g:colors_name') || g:colors_name != 'base16-tomorrow-night'
  colorscheme base16-tomorrow-night
endif

"=======================================
" NERDCommenter
"=======================================
" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" align line-wise comment delimiters flush left instead of following code
" indentation
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
nnoremap <leader>n :NERDTreeToggle<Enter>
nnoremap <leader>f :NERDTreeFind<Enter>

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
nnoremap <leader>s :SyntasticCheck<CR>
nnoremap <leader>r :SyntasticReset<CR>
nnoremap <leader>i :SyntasticInfo<CR>
nnoremap <leader>m :SyntasticToggleMode<CR>

"=======================================
" Vim-Airline
"=======================================
let g:airline_theme = 'base16'

"=======================================
" Vim-Closetag
"=======================================
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.cshtml,*.html,*.js,*.jsx,*.xhtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified
" files.
let g:closetag_xhtml_filenames = '*.cshtml,*.html,*.js,*.jsx,*.xhtml'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>`
" will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

"===============================================================================
" Local customization
"===============================================================================

" local customization in ~/.vimrc_local
let $LOCALFILE = expand('~/.vimrc_local')
if filereadable($LOCALFILE)
  source $LOCALFILE
endif
