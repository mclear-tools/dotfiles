" VUNDLE {{{
" VUNDLE SETUP {{{

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
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

" Distraction-free writing
Bundle 'vimroom.vim'
" Outliner
Bundle 'VOoM' 
" More outline magic
Bundle 'VimOutliner'
Bundle 'vimoutliner-colorscheme-fix'
" Awesome git-wrapper
Bundle 'tpope/vim-fugitive' 
" bracket matching 
Bundle 'tpope/vim-surround'    
" pandoc plug-in
Bundle 'vim-pandoc/vim-pandoc'  
" File directory
Bundle 'scrooloose/nerdtree' 
" auto delimit
Bundle 'delimitMate.vim' 
" Latex magic
Bundle 'LaTeX-Box' 
" Tab completion
Bundle 'SuperTab' 
" non github repos
Bundle 'git://git.wincent.com/command-t.git' 
" GUI Colorschemes for terminal vim!
Bundle 'vim-scripts/guicolorscheme.vim'
" Vim-pandoc footnotes
Bundle 'git://github.com/vim-pandoc/vim-markdownfootnotes.git'
" END BUNDLES }}}
" END VUNDLE }}}

" GLOBAL/GENERIC SETTINGS {{{

filetype plugin indent on     " required!

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=128
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
set guifont=Inconsolata:h20
" set ch=2 " make command line two lines high
set laststatus=2 "always have status line
" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=999

set incsearch
syntax on
" auto-change directory to current buffer
autocmd BufEnter * :cd %:p:h
" set wrap
set linebreak
set nolist
set linespace=2
set number
set columns=92
set cursorline
set hlsearch                    " highlight matches
set autoread
set ruler                       " always show info at bottom
set ignorecase                  " searches are case insensitive...
set smartcase
set autoindent
set noswapfile                  " No swap file
set tabstop=4 shiftwidth=2 expandtab
set formatprg=par
set spell spelllang=en_us
set background=dark
setlocal textwidth=72
" |nojoinspaces| allows you to use SHIFT-J in normal mode to join the next line with the current line 
" without adding unwanted spaces.
setlocal nojoinspaces
" tells vim to use HTML style comments in your markdown files. For more, see |comments| and |commentstring|.
setlocal breakat-=*
setlocal commentstring=<!--%s-->
setlocal comments=s:<!--,m:\ \ \ \ ,e:-->
" setlocal formatoptions+=tcwa
"colorscheme koehler
"colorscheme colorer
"colorscheme desert256
colorscheme baycomb
" colorscheme inkpot
" colorscheme dante
set t_Co=256 " enable 256 colors
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

" PANDOC
" read all .md files as pandoc files
au BufNewFile,BufRead *.md set filetype=pandoc

let g:pandoc_no_empty_implicits = 1
let g:pandoc_auto_format = 0
let g:pandoc_use_hard_wraps = 1
let g:pandoc_no_folding = 0
let maplocalleader = ","
" let mapleader = ""
let g:pandoc_no_spans = 1
"
"Map NERDTree to ,t
nmap <silent> <localLeader>t :NERDTreeToggle<CR>

" link mvim to marked app
:nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" Latex-Box to Skim settings
let g:LatexBox_viewer = 'open -a skim'
" let g:LatexBox_viewer = 'open -a preview'
let g:LatexBox_latexmk_options = '-pvc'

" SyncTex with Skim
map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline
		\ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>

" Citation completion
let g:SuperTabDefaultCompletionType = "context"

let g:pandoc_bibfiles = ['/Users/Roambot/Dropbox/PDFLibrary/Master.bib']

let g:Tex_BIBINPUTS= ['/Users/Roambot/Dropbox/PDFLibrary/Master.bib']

func! OutlinerMode() 
  setlocal formatoptions=1 
  setlocal noexpandtab 
  map j gj 
  map k gk
  setlocal spell spelllang=en_us 
  set complete+=s
  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
endfu 
com! OM call OutlinerMode()

" Mapping to toggle fold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
