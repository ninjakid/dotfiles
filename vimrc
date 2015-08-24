" new line with same indentation
set autoindent
set smartindent

" pathogen
call pathogen#infect()		" include all plugins in bundle folder
call pathogen#helptags()	" include helppage for vim plugins in bundle folder

" filetype off

filetype plugin indent on	" enable detection, plugin, indenting

" switching between vim panes {{{
	nnoremap <c-j> <c-w>j
	nnoremap <c-k> <c-w>k
	nnoremap <c-l> <c-w>l
	nnoremap <c-h> <c-w>h

" }}}

" vimwiki

set nocompatible
filetype plugin on
syntax on



" moving around, searching and patterns

" move thru word wrapped line
nnoremap k gk
nnoremap j gj

nnoremap gb :ls<CR>:b<Space>

" toggle line numbers
nmap <C-N><C-N> :set invnumber<CR>

" go to beginning or end of line
noremap H ^
noremap L $

" move between matching opening and ending code; example {code}
" map <tab> %

" make tabstop = softtabstop = shiftwidth {{{
" usage: type command :Stab and enter value
command! -nargs=* Stab call Stab()
function! Stab()
	let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
	if l:tabstop > 0
		let &l:sts = l:tabstop
		let &l:ts = l:tabstop
		let &l:sw = l:tabstop
	endif
	call SummarizeTabs()
endfunction

function! SummarizeTabs()
	try
		echoh1 ModeMsg
		echon 'tabstoop='.&l:ts
		echon ' shiftwidth='.&l:sw
		echon ' softtabstop='.&l:sts
		if &l:et
			echon ' expandtab'
		else
			echon ' noexpandtab'
		endif
	finally
		echoh1 None
	endtry
endfunction
" }}}

" enable folding
set foldmethod=marker

" fold color
hi Folded cterm=bold ctermfg=DarkBlue ctermbg=none
hi FoldColumn cterm=bold ctermfg=DarkBlue ctermbg=none

" refocus folds; close any other fold except the one that you are on
nnoremap ,z zMzvzz

" quicker command line mode hotkey
nmap ; :

" reload .vimrc manually
map <leader>reload :source ~/.vimrc<CR>


scriptencoding utf-8
set encoding=utf-8


" Visual {{{
syntax on
set number
"set modeline
set ls=2	" display filename statusbar
set ignorecase	" ignore case when searching
set hlsearch	"highlight searches
set incsearch	"incremental search, find as you type word
set title	" show title in console title bar
" }}}

" Themes {{{
syntax enable
" set background=dark	
colorscheme distinguished
" }}}

" {{{ Word Wrapping
" better word wrapping; breaks at spaces or hyphens
set formatoptions=1
set lbr
" }}}

imap jj <Esc>

" change default leader
let mapleader=","

map <Leader>a :E<cr>
let g:netrw_liststyle=3


" save without closing file new key
noremap <Leader>s :update<CR>
" save and close file new key 
noremap <Leader>d :wq<CR>

" setting tabstop, softtabstop, shiftwidth {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
" }}}
" ultisnips configuration {{{

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}
