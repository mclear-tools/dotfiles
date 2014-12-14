
set nocompatible
filetype off

" VUNDLE & FUZZY FINDER
set rtp+=~/.vim/bundle/Vundle.vim,~/.fzf

call vundle#begin()

" Let vundle manage Vundle
" Plugins

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
" Pandoc vim footnotes
Plugin 'MarkdownFootnotes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'VOoM'
"Plugin 'tpope/vim-sensible'
"Plugin 'rstacruz/vim-opinion'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'SuperTab'
Plugin 'Raimondi/delimitMate'
"Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-obsession'
"Plugin 'dhruvasagar/vim-prosession'
Plugin 'junegunn/goyo.vim'
Plugin 'vim-scripts/EasyMotion'
"TeX Plugin
Plugin 'TeX-9'
" Git Viewer
Plugin 'gitv'
" More Git action
Plugin 'extradite.vim'
"Evernote
Plugin 'https://github.com/neilagabriel/vim-geeknote'
"Change to title case
Plugin 'titlecase.vim'
" Links
Plugin 'utl.vim'
" End Plugins

call vundle#end()
filetype plugin indent on

""" Tex Setup
let g:tex_flavor = 'latex'
let g:tex_nine_config = {'compiler': 'xelatex', 'viewer': {'app':'open', 'target':'pdf'}}


" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
set number
"highlight LineNr ctermfg=yellow ctermbg=black guibg=black guifg=grey
hi CursorLineNR cterm=bold
augroup CLNRSet
      autocmd! ColorScheme * hi CursorLineNR cterm=bold ctermfg=white
    augroup END
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! <CR>

let g:solarized_termcolors= 16
let g:solarized_termtrans = 1
let g:solarized_degrade   = 0
let g:solarized_bold      = 1
let g:solarized_underline = 1
let g:solarized_italic    = 1
let g:solarized_contrast  = "normal"
let g:solarized_visibility= "normal"

set background=dark
colorscheme solarized
set spell spelllang=en_us
" presents spelling options in dropdown
:nnoremap \s ea<C-X><C-S>
set tabstop=4 shiftwidth=2 expandtab
set linespace=2
"set fo+=t
set scrolloff=99
set textwidth=80
" remap paragraph formatting 
:noremap Q gwip
set ruler
set laststatus=2
set showcmd
set wildmenu
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
" Move to next line when using left and right
set whichwrap+=<,>
set guifont=AnonymousPro:h16
" |nojoinspaces| allows you to use SHIFT-J in normal mode to join the next line 
" with the current line without adding unwanted spaces.
setlocal nojoinspaces
" tells vim to use HTML style comments in your markdown files. For more, see |comments| and |commentstring|.
setlocal breakat-=*
setlocal commentstring=<!--%s-->
setlocal comments=s:<!--,m:\ \ \ \ ,e:-->

"map ;; to esc key and save!
imap ;; <Esc>
map ;; <Esc>

" GOYO 
"
" Toggle on/off
nnoremap <Leader>G :Goyo<CR>
" Set width
let g:goyo_width = 85

" Ensure :q to quit even when Goyo is active
"
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
" Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd User GoyoEnter call <SID>goyo_enter()
autocmd User GoyoLeave call <SID>goyo_leave()

" Custom settings
function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set number
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()

let maplocalleader = ","
" link mvim to marked app
:nnoremap <leader>m :silent !open -a Marked.app '%:p' <CR>\|:redraw!<CR>
"Map NERDTree to ,t
nmap <silent> <localLeader>t :NERDTreeToggle<CR>
" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>
" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>
" For Airline, allows powerline sympbols
let g:airline_powerline_fonts = 1

"Copy to system clipboard
set clipboard=unnamed

" Mapping to toggle fold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" change cursor in insert mode
" change color
if &term =~ "xterm\\|rxvt"
    " use an orange cursor in insert mode
      let &t_SI = "\<Esc>]12;orange\x7"
        " use a red cursor otherwise
          let &t_EI = "\<Esc>]12;red\x7"
            silent !echo -ne "\033]12;red\007"
              " reset cursor when vim exits
                autocmd VimLeave * silent !echo -ne "\033]112\007"
                  " use \003]12;gray\007 for gnome-terminal
                endif
" change shape
if &term =~ '^xterm'
    " solid underscore
      let &t_SI .= "\<Esc>[4 q"
        " solid block
          let &t_EI .= "\<Esc>[2 q"
            " 1 or 0 -> blinking block
              " 3 -> blinking underscore
                " Recent versions of xterm (282 or above) also support
                  " 5 -> blinking vertical bar
                    " 6 -> solid vertical bar
                  endif

" CtrlP Settings
let g:ctrlp_by_filename = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/.hg/*,*/.svn/* 
nnoremap <leader>b :CtrlPBuffer<CR>

" vim-pandoc settings
"
let g:pandoc#biblio#sources = ["g"]
let g:pandoc#biblio#bibs = ["/Users/Roambot/Dropbox/Work/Master.bib"]
let g:pandoc#formatting#textwidth = 80
let g:pandoc#formatting#mode = 'h'
let g:pandoc#formatting#extra_equalprg = "--atx-headers"
" Toggle table of contents
nnoremap <leader>C :TOC<CR>
"""""""""""""""""""""""""

" Live Word Count
 let g:word_count="<unknown>"
   function! WordCount()
       return g:word_count
   endfunction
   function! UpdateWordCount()
       let lnum = 1
       let n = 0
       while lnum <= line('$')
           let n = n + len(split(getline(lnum)))
           let lnum = lnum + 1
       endwhile
       let g:word_count = n
   endfunction
   " Update the count when cursor is idle in command or insert mode.
   " Update when idle for 1000 msec (default is 4000 msec).
   set updatetime=1000
   augroup WordCounter
       au! CursorHold,CursorHoldI * call UpdateWordCount()
   augroup END
   " Set statusline, shown here a piece at a time
   highlight User1 ctermbg=green guibg=green ctermfg=black guifg=black
   set statusline=%1*            " Switch to User1 color highlight
   set statusline+=%<%F          " file name, cut if needed at start
   set statusline+=%M            " modified flag
   set statusline+=%y            " file type
   set statusline+=%=            " separator from left to right justified
   set statusline+=\ %{WordCount()}\ words,
   set statusline+=\ %l/%L\ lines,\ %P    " percentage through the file

"set noswapfile
"BACKUP FILES
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"Delimitmate Auto-pairings
let delimitMate_matchpairs = "(:),[:],{:},<:>"

"Filenames in tabs in iTerm
set t_ts=^[]1;
set t_fs=^G
set guitablabel=%t

" Switch tabs with numbers
if has("gui_macvim")
  map <D-1> :tabfirst<Cr>
  map <D-2> :tabfirst<Cr>gt
  map <D-3> :tabfirst<Cr>3gt
  map <D-4> :tabfirst<Cr>4gt
  map <D-5> :tabfirst<Cr>5gt
  map <D-6> :tabfirst<Cr>6gt
  map <D-7> :tabfirst<Cr>7gt
  map <D-8> :tabfirst<Cr>8gt
  map <D-9> :tabfirst<Cr>9gt
endif

" open all buffers in tabs (gui)
map <silent> <leader>tb :tab :ball<cr>

"NERDTree Window Position
let NERDTreeWinPos = 'right'

" AIRLINE SETTINGS
let g:airline_theme = 'solarized'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = 'RO'
let g:airline_symbols.linenr = '⭡'

let g:airline_powerline_fonts = 'Anonymous Pro'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

function! AirLineBlaenk()
  function! Modified()
    return &modified ? " +" : ''
  endfunction

 call airline#parts#define_raw('filename', '%<%f')
 call airline#parts#define_function('modified', 'Modified')

  let g:airline_section_b = airline#section#create_left(['filename'])
  let g:airline_section_c = airline#section#create([''])
  let g:airline_section_gutter = airline#section#create(['modified', '%='])
  let g:airline_section_x = airline#section#create_right([''])
" let g:airline_section_y = airline#section#create_right(['%c'])
  let g:airline_section_y = airline#section#create_right(['%{WordCount()} words', '%l/%L lines, %P'])
  let g:airline_section_z = airline#section#create(['branch'])
  
endfunction

autocmd Vimenter * call AirLineBlaenk()

let g:airline_theme_patch_func = 'AirLineBlaenkTheme'

" 0,1: gfg, gbg; 2,3: tfg, tbg; 4: styles
function! AirLineBlaenkTheme(palette)
  if g:airline_theme == 'solarized'
    let purple = ['#ffffff', '#5f5faf', 255, 13, '']
    let violet = ['#5f5faf', '#aeaed7', 13, 61, '']
    let inv_purple = ['#5f5faf', '#ffffff', 13, 255, '']
    let purple_violet = ['#5f5faf', '#aeaed7', 61, 13, '']

    " dark = middle
    " white = focus
    " light = edges

    let a:palette.ctrlp = {
      \ 'CtrlPlight' : purple,
      \ 'CtrlPwhite' : inv_purple,
      \ 'CtrlPdark'  : violet,
      \ 'CtrlParrow1': inv_purple,
      \ 'CtrlParrow2': purple,
      \ 'CtrlParrow3': purple_violet,
      \ }

    let secondary = ['#ffffff', '#657b83', 255, 240, '']

    let magenta = ['#ffffff', '#d33682', 255, 125, '']
    let blue = ['#ffffff', '#268bd2', 255, 33, '']
    let green = ['#ffffff', '#859900', 255, 64, '']
    let red = ['#ffffff', '#dc322f', 255, 160, '']
    let orange = ['#ffffff', '#cb4b16', 255, 166, '']

    let modes = {
      \ 'normal': blue,
      \ 'insert': green,
      \ 'replace': magenta,
      \ 'visual': orange
      \}

    let a:palette.replace = copy(a:palette.insert)
    let a:palette.replace_modified = a:palette.insert_modified

    for key in ['insert', 'visual', 'normal']
      " no red on modified
      let a:palette[key . '_modified'].airline_c[0] = '#657b83'
      let a:palette[key . '_modified'].airline_c[2] = 11

      for section in ['a', 'b', 'y', 'z']
        let airline_section = 'airline_' . section
        if has_key(a:palette[key], airline_section)
          " white foreground for most components; better contrast imo
          let a:palette[key][airline_section][0] = '#ffffff'
          let a:palette[key][airline_section][2] = 255
        endif
      endfor
    endfor

    for key in keys(modes)
      let a:palette[key].airline_a = modes[key]
      let a:palette[key].airline_z = modes[key]

      "let a:palette[key . '_modified'].airline_b = ['#002b36', '#93a1a1', 234, 245]

      let a:palette[key].airline_b = secondary
      let a:palette[key].airline_y = secondary
    endfor

  endif
endfunction

let g:airline#extensions#default#section_truncate_width = {
  \ 'x': 60,
  \ 'y': 60
  \ }

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'v'  : 'V',
  \ 'V'  : 'V-L',
  \ 'c'  : 'C',
  \ '' : 'V-B',
  \ 's'  : 'S',
  \ 'S'  : 'S-L',
  \ '' : 'S-B',
  \ }

""""""""""""""""""""""""""""""""""""

"NerdTree
"Open automatically when file isn't specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
"Close NerdTree when it's the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


