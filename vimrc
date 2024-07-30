" Do not try to be compatible with vi.
set nocompatible

" Enable filetype detection.
filetype plugin indent on

" Remap <leader> key.
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

" Turn on syntax highlighting.
syntax on

"===============================================================================
" Appearance
"===============================================================================

" Show matching braces when cursor is over them.
set showmatch

" Don't wrap lines.
set nowrap

" Show aboslute line numbers.
set number

" Always show the current editing mode.
set showmode

" Show ruler indicating column limits.
set colorcolumn=80,120,150
highlight ColorColumn ctermbg=7 guibg=lightgrey

" Highlight current line.
set cursorline

"===============================================================================
" Editor
"===============================================================================

"=======================================
" General
"=======================================

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Incremental search (as string is being typed).
set incsearch

" Highlight search.
set hls

" Show current command.
set showcmd

" Show more history.
set history=8192

" Ignore case but not all-caps.
set ignorecase
set smartcase

" Move across wrapped line when softwrap is on, otherwise move normally.
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Ctrl + S will save.
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-c>:update<CR>
inoremap <silent> <C-s> <C-o>:update<CR>

" Pressing F5 will remove all trailing whitespace.
nnoremap <F5> :let _s = @/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:noh<Bar><CR>

"=======================================
" Indentation
"=======================================

" Always set auto-indenting on.
set autoindent

" Copy the previous indentation on auto-indenting.
set copyindent

" On pressing tab, insert spaces.
set expandtab

" When indenting with tab, use 4-space width.
set shiftwidth=4
set smarttab

" When hitting backspace, pretend like a tab is removed, even if spaces.
set softtabstop=4

" A tab is 4 spaces.
set tabstop=4

"=======================================
" File-specific settings
"=======================================

" Turn off auto-commenting.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Use // instead of /* */ for c-like language commenting.
autocmd FileType c,cpp,cs setlocal commentstring=//\ %s

"=======================================
" Automatically toggle the `paste` option on pasting
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
"=======================================

" Fallback toggle in case this trick doesn't work.
" Usage: Toggle -> Paste -> Toggle
set pastetoggle=<F2>

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"===============================================================================
" Windows
"===============================================================================

" Natural split opening.
set splitbelow
set splitright

" Quicker split windows navigation.
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
" indentLine
"=======================================
" Enable this plugin on startup.
let g:indentLine_enabled = 1

" Character to show as indent guide.
let g:indentLine_char = '│'

"=======================================
" NERDTree
"=======================================
nnoremap <leader>n :NERDTreeToggle<Enter>
nnoremap <leader>f :NERDTreeFind<Enter>

" Open NERDTree when vim starts up with no file specified.
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close Vim if NERDTree is the only thing still open.
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
" Filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.cshtml,*.html,*.js,*.jsx,*.xhtml'

" Filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.cshtml,*.html,*.js,*.jsx,*.xhtml'

" Integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.).
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'.
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''.
let g:closetag_close_shortcut = '<leader>>'

"===============================================================================
" Local customization
"===============================================================================

" Local customization in ~/.vimrc_local.
let $LOCALFILE = expand('~/.vimrc_local')
if filereadable($LOCALFILE)
  source $LOCALFILE
endif
