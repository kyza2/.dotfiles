syntax enable

set background=dark
set termguicolors

colorscheme habamax

let &t_ut=''

set path+=**
set wildmenu
set wildoptions=tagfile
set wildignore+=*/node_modules/*
set wildignore+=*/.git/*
set wildignore+=*/.next/*
set wildignore+=*/include/*

set ignorecase

set scrolloff=4
set laststatus=2
set number

set wrap
set textwidth=140
set linebreak
set breakindent
set breakindentopt=shift:2

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set hidden
set lazyredraw
set noswapfile
set autoread
set nobackup

" For Xorg
function XClipPaste()
  let @c=system("xclip -o -sel clip") 
  :normal "cp<CR>
endfunction

" Paste
nnoremap <silent> <C-v> <cmd>call XClipPaste()<CR>
inoremap <silent> <C-v> <cmd>call XClipPaste()<CR>
vnoremap <silent> <C-v> <cmd>call XClipPaste()<CR>

" Copy
vnoremap <silent> <C-c> "cy <bar> :call system('xclip -sel clipboard', @c)<CR>h
xnoremap <silent> <C-c> "cy <bar> :call system('xclip -sel clipboard', @c)<CR>h

" Quit vime
nnoremap Q ZZ

" Find files
nnoremap <C-p> :find 

" Toggle highlight
nnoremap \ :set invhlsearch<CR>

" Block Selection
nnoremap <C-b> <C-v>

" Search for selected text 
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>N:set hlsearch<CR>

" Vertical Scrolling
nnoremap <C-d> 2<C-e>
nnoremap <C-u> 2<C-y>

" Start / End of line
nnoremap <C-h> ^
nnoremap <C-l> $
