" VUNDLE {{{
" VUNDLE SETUP {{{

set nocompatible
filetype off

" set rtp +=~/.dotfiles/.vim/vundle.git/
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" let Vundle manage Vundle
" required! 

" END VUNDLE SETUP }}}
 
" MY BUNDLES {{{
" Key commands:
" :BundleInstall for main install
" :BundleInstall! will install/update all
" :Bundle "foo" searches for foo.
" :BundleClean will remove deleted bundles

Bundle 'VOom'
Bundle 'tpope/vim-fugitive'
" use <leader> f and r to get footnotes
" Bundle 'vim-pandoc/vim-markdownfootnotes' 
Bundle 'tpope/vim-surround'    
" auto-close html tags
Bundle 'HTML-AutoCloseTag'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
Bundle 'vim-pandoc/vim-pandoc'  
" Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-ruby/vim-ruby'
" syntax check
Bundle 'Syntastic'
" javascript syntax checker plugin
Bundle 'jshint.vim'
" terminal emulator in vim buffer
Bundle 'conque-shell' 
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" File directory
Bundle 'scrooloose/nerdtree'
" auto delimit
Bundle 'delimitMate.vim'
"code snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"
Bundle "vim-scripts/autonumbering-in-vim"
" Better Vim-markdown syntax reading
Bundle 'mikewest/vim-markdown'
" Latex magic
Bundle 'LaTeX-Box-Team/LaTeX-Box'
" simplenote web service plugin
" Bundle 'simplenote.vim'
" let g:SimplenoteUsername = "mclearc@gmail.com"
" let g:SimplenotePassword = "noumenal"

" Tab contextual completion
Bundle 'SuperTab'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" END BUNDLES }}}
" END VUNDLE }}}

" GLOBAL/GENERIC SETTINGS {{{

filetype plugin indent on     " required!

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=128
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
set guifont=AnonymousPro:h18
" set ch=2 " make command line two lines high
set laststatus=2 "always have status line
" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

set incsearch
syntax on
" auto-change directory to current buffer
autocmd BufEnter * :cd %:p:h
set wrap
set linebreak
set nolist
set linespace=2
set number
set cursorline
set hlsearch                    " highlight matches
set ofu=syntaxcomplete#Complete
set autoread
set ignorecase                  " searches are case insensitive...
set smartcase
" set autoindent
set smartindent
set noswapfile                  " No swap file
set tabstop=2 shiftwidth=2 expandtab
set formatprg=par
set spell spelllang=en_us
set background=dark
set ts=4
setlocal textwidth=72
" setlocal formatoptions+=tcwa
"colorscheme koehler
"colorscheme colorer
"colorscheme desert256
"colorschme baycomb
"coloescheme inkpot
colorscheme dante
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" set foldlevel=99

inoremap ;; <esc>

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

" Conque-Terminal

let g:ConqueTerm_Color = 1
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_ExecFileKey = '<F11>'
let g:ConqueTerm_SendFileKey = '<F10>'
let g:ConqueTerm_SendVisKey = '<F9>'
let g:ConqueTerm_SendFunctionKeys = 1

" PANDOC
" read all .md files as pandoc files
au BufNewFile,BufRead *.md set filetype=pandoc

let g:pandoc_no_empty_implicits = 1
let g:pandoc_auto_format = 0
let g:pandoc_use_hard_wraps = 1
let g:pandoc_no_folding = 1
let maplocalleader = ","
" let mapleader = ""
let g:pandoc_no_spans = 1

let b:surround_{char2nr("i")} = "*\r*"
let b:surround_{char2nr("s")} = "**\r**"
"surround current word with single asterisks
nmap <leader>i viwsiW
imap <leader>i <ESC>viwsiWi
"same thing using command key in macvim
nmap <D-i> viwsiW
imap <D-i> <ESC>viwsiWi
"surround current word with double asterisks
nmap <leader>b viwssW
imap <leader>b <ESC>viwssWi

" Converts current line into level 1-6 ATX heading use F1 + number (e.g. 3)
nnor <F1>1 :s/^#*\s*/# /<CR>
inor <F1>1 <Esc>:s/^#*\s*/# /<CR>A
nnor <F1>2 :s/^#*\s*/## /<CR>
inor <F1>2 <Esc>:s/^#*\s*/## /<CR>A
nnor <F1>3 :s/^#*\s*/### /<CR>
inor <F1>3 <Esc>:s/^#*\s*/### /<CR>A
nnor <F1>4 :s/^#*\s*/#### /<CR>
inor <F1>4 <Esc>:s/^#*\s*/#### /<CR>A
nnor <F1>5 :s/^#*\s*/##### /<CR>
inor <F1>5 <Esc>:s/^#*\s*/##### /<CR>A
nnor <F1>6 :s/^#*\s*/###### /<CR>
inor <F1>6 <Esc>:s/^#*\s*/###### /<CR>A

" Convert current line from ATX heading into normal para
nnor <F1>0 :s/^#*\s*//<CR>
nnor <F8>0 :s/^#*\s*//<CR>

"Map NERDTree to ,t
nmap <silent> <localLeader>t :NERDTreeToggle<CR>

" link mvim to marked app
:nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" auto-source .vimrc on save
au! BufWritePost .vimrc source %

" Latex-Box to Skim settings
let g:LatexBox_viewer = 'open -a skim'
let g:LatexBox_latexmk_options = '-pvc'
" SyncTex with Skim
map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline
		\ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>

" Citation completion
let g:SuperTabDefaultCompletionType = "context"

let g:pandoc_bibfiles = ['/Users/Roambot/Dropbox/PDFLibrary/MasterLib.bib']

let g:Tex_BIBINPUTS= ['/Users/Roambot/Dropbox/PDFLibrary/MasterLib.bib']
