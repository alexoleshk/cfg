" Comments in Vimscript start with a `"`.

" enter the current millenium
set nocompatible

" enable plugins (for netrw)
filetype plugin on

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer



" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags (когда одна и та же штука определена в
"   различных местах)
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags



" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings



" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

"определяет ширину 1ой Tab'уляции в 4 пробела
set tabstop=4

"определяет ширину Tab'уляции в 4 пробела, при сдвиге выделенного вертикального блока вправо
set shiftwidth=4

"копирует отступы с текущей строки и добавляет их при добавлении новой
set autoindent

"c indent = копирует отступы с текущей строки и добавляет их при добавлении новой для *.c файлов
set cindent

"добавляет ) после написания символа (
inoremap ( ()<left>
inoremap () ()

"добавляет } после написания символа {
inoremap { {}<Left><enter><up><end>
inoremap {} {}<Left>

"добавляет " после написания символа "
inoremap " ""<left>
inoremap "" ""

"добавляет ' после написания символа '
inoremap ' ''<left>
inoremap '' ''

inoremap [ []<left>
inoremap [] []

"подсвечивает синим строку, если та будет превышать 80 знаков
highlight MoreThan80 ctermbg=blue guibg=blue
:2match MoreThan80 /\%81v.\+/

"test comment"
