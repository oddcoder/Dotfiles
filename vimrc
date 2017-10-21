execute pathogen#infect()

set nocompatible  "stop behaving like 1800s vi!

set path+=**

" when tabbing get neat menu at the at the : mode
set wildmenu

syntax on
filetype plugin indent on
set smartindent
set smarttab
set ignorecase
set showmatch
set backspace=indent,eol,start

colorscheme solarized
set background=dark
" set light solarized or dark solarized automatically
"if strftime("%H") >= 5 && strftime("%H") <= 17
"  set background=light
"else
"  set background=dark
"endif

set cursorline
set number

set tags=./tags;/
setlocal foldmethod=syntax

nnoremap <CR> :noh<CR><CR>
let g:license_author = 'Ahmed Abd El Mawgood'
let g:license_email = 'ahmedsoliman@oddcoder.com'

let g:netrw_banner=0
let g:netrw_liststyle=3
let $VIM='~/.vim'
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&"
func! WordProcessorMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu

noremap ,p :call WordProcessorMode()<CR>

set lazyredraw
set foldmethod=indent
" hightlight trailing spaces
syn match WhiteSpace "\s\+$" containedin=ALL conceal cchar=◦
set conceallevel=2 
set concealcursor=nv
highlight Conceal ctermfg=red


" gpg with vim
if has("autocmd")
  augroup GPGASCII
    au!
    au BufReadPost *.asc :%!gpg -q -d
    au BufReadPost *.asc |redraw
    au BufWritePre *.asc :%!gpg -q -e -a
    au BufWritePost *.asc u
    au VimLeave *.asc :!clear

    au BufReadPost *.pgp :%!gpg -q -d
    au BufReadPost *.pgp |redraw
    au BufWritePre *.pgp :%!gpg -q -e -a
    au BufWritePost *.pgp u
    au VimLeave *.pgp :!clear

  augroup END
endif " has ("autocmd")
