" vim:fdm=marker
set encoding=utf-8
scriptencoding utf-8
set nocompatible
filetype plugin indent on
" Plugins {{{

call plug#begin('~/.vim/plugged')

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " file manager
Plug 'jeetsukumaran/vim-buffergator', { 'on': 'BuffergatorOpen'} "Buffer manager
Plug 'Z1MM32M4N/vim-superman' " open man pages in vim
Plug 'git://github.com/cwoac/nvim.git' " nvalt for vim
Plug 'christoomey/vim-tmux-navigator' " easy navigate tmux and vim panes
Plug 'wesQ3/vim-windowswap' " Easily swap buffers
Plug 'bling/vim-bufferline' " plugin for buffer display in lightline/airline
Plug 'SuperTab' " Tab completion
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'altercation/vim-colors-solarized'
Plug 'VOoM' " outliner
Plug 'tpope/vim-commentary' " Comment manager/toggle
Plug 'tpope/vim-fugitive' " Git management
Plug 'tpope/vim-surround' "  surround text with whatever
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim' " alternate powerline plugin
Plug 'edkolev/tmuxline.vim' " tmux lightline plugin
Plug 'scrooloose/nerdtree' 
Plug 'tpope/vim-obsession' " vim session management
Plug 'junegunn/goyo.vim' " writeroom style writing
Plug 'TeX-9' " Latex
Plug 'gitv' " Git Viewer 
Plug 'https://github.com/neilagabriel/vim-geeknote'  "Evernote
Plug 'davidoc/taskpaper.vim' " taskpaper alternative
Plug 'henrik/vim-open-url' " open any url using ruby and regex

" Not sure about these plugins

" Plug 'extradite.vim'  " More Git action
" Plug 'utl.vim'   " use Links
" Plug 'Raimondi/delimitMate' " autopair
" Plug 'terryma/vim-multiple-cursors'
" Plug 'MarkdownFootnotes'  " Pandoc vim footnotes
" Plug 'tpope/vim-sensible'
" Plug 'rstacruz/vim-opinion'
" Plug 'bling/vim-airline'
" Plug 'reedes/vim-pencil'
" Plug 'kien/ctrlp.vim'
" Plug 'dhruvasagar/vim-prosession'
" Plug 'Valloric/YouCompleteMe' " Vim auto-complete
" Plug 'vim-pad' " note pad
" Plug 'titlecase.vim'  "Change to title case
" Plug 'vim-scripts/EasyMotion'
" TeX Plugin
" Plug 'SirVer/ultisnips' " snippets via python
" Plug 'honza/vim-snippets' " snippet bank

call plug#end()
" End Plugins

"}}}
" Keymappings {{{
" remap escape
inoremap jk <Esc>
"go to beginning of line in insert
inoremap <S-Left> <Esc>0i
" go to end of line in insert
inoremap <S-Right> <Esc>$i
" make cursor move to next visual line below cursor this is a test 
noremap Q gwip
nnoremap <Leader>c :set cursorline! <CR>
nnoremap <C-N><C-N> :set invnumber<CR>
" presents spelling options in dropdown and returns to normal mode
nnoremap \s ea<C-X><C-S>
" save file
nnoremap <Leader>w :w<CR> 
" link vim to marked app
nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p' <CR>\|:redraw!<CR>
" Let's make it easy to edit this file (mnemonic for the key sequence is " 'e'dit 'v'imrc)
nnoremap <silent> ,ev :e $MYVIMRC<cr>
" And to source this file as well (mnemonic for the key sequence is " 's'ource 'v'imrc)
nnoremap <silent> ,sv :so $MYVIMRC<cr>
" Yank text to the OS X clipboard
"noremap <leader>y "*y
"noremap <leader>yy "*Y
" Preserve indentation while pasting text from the OS X clipboard
"noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
" Mapping to toggle fold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

let maplocalleader = ","
" Toggle table of contents
nnoremap <localLeader>c :TOC<CR>
" Toggle Goyo on/off
nnoremap <localLeader>g :Goyo<CR>
"Map NERDTree to ,t
nnoremap <silent> <localLeader>t :NERDTreeToggle<CR>
nnoremap <localLeader>v :Voom markdown<CR>

" Fuzzyfinder for home directory
noremap <C-T> :FZF ~<CR>
" Fuzzyfinder for current directory
noremap <C-F> :FZF<CR>
noremap <leader>v <Plug>TaskList

" Remap navigation commands to center view on cursor using zz
" nnoremap <C-U> 11kzz
" nnoremap <C-D> 11jzz
" nnoremap j jzz
" nnoremap k kzz
" nnoremap # #zz
" nnoremap * *zz
" nnoremap n nzz
" nnoremap N Nzz

"Copy to system clipboard
nmap <F2> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F2> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F1> :.w !pbcopy<CR><CR>
vmap <F1> :w !pbcopy<CR><CR>

" Grep TODO and NOTE
noremap <leader>d :copen<CR>:vimgrep /TODO/gj *.md *.taskpaper<CR>
noremap <leader>n :copen<CR>:vimgrep /NOTE/gj *.md *.taskpaper<CR>

" }}}
" Settings {{{
syntax enable
" buffer settings
set hidden
set switchbuf=useopen
set noshowmode
set number
set numberwidth=5
highlight LineNr ctermfg=yellow ctermbg=black guibg=black guifg=grey
hi CursorLineNR cterm=bold
augroup CLNRSet
      autocmd! ColorScheme * hi CursorLineNR cterm=bold ctermfg=white
    augroup END
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert

" change cursor shape depending on mode with different code for tmux configuration
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" iterm settings for getting solarized working
let g:solarized_termcolors= 16
let g:solarized_termtrans = 1
let g:solarized_degrade   = 0
let g:solarized_bold      = 1
let g:solarized_underline = 1
let g:solarized_italic    = 1
let g:solarized_contrast  = "normal"
let g:solarized_visibility= "normal"

" colorscheme settings
set background=dark
colorscheme solarized

" font settings
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ for\ Powerline:h16
  elseif has("gui_macvim")
    set guifont=Inconsolata\ LGC:h16
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

set spell spelllang=en_us
set tabstop=4 shiftwidth=2 expandtab
set linespace=2
"set fo+=t
set scrolloff=999 " keep cursor in middle of screen

set textwidth=80
" remap paragraph formatting 
set formatprg=par
set ruler
set laststatus=2
set showcmd
set wildmenu
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
" Move to next line when using left and right
set whichwrap+=<,>
" |nojoinspaces| allows you to use SHIFT-J in normal mode to join the next line 
" with the current line without adding unwanted spaces.
setlocal nojoinspaces
" tells vim to use HTML style comments in your markdown files. For more, see |comments| and |commentstring|.
setlocal breakat-=*
setlocal commentstring=<!--%s-->
setlocal comments=s:<!--,m:\ \ \ \ ,e:-->
set backspace=indent,eol,start
" make vim scrollable with mouse
set mouse=a

set go+=a

:botright cwindow " keep quickfix window along bottom



" }}}
" Backup and Swap Settings {{{
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
"set noswapfile
" }}}
" Tex Setup {{{
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
"}}}
" Snippets {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
 let g:UltiSnipsExpandTrigger=";;"
 let g:UltiSnipsJumpForwardTrigger="<c-b>"
 let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" }}}
" vim-pandoc settings {{{
"
let g:pandoc#biblio#sources = ["g"]
let g:pandoc#biblio#bibs = ["/Users/Roambot/Dropbox/Work/Master.bib"]
let g:pandoc#formatting#textwidth = 80
let g:pandoc#formatting#mode = 'h'
let g:pandoc#formatting#extra_equalprg = "--atx-headers"
"""""""""""""""""""""""""
" }}}
" Live Word Count {{{
 " let g:word_count="<unknown>"
 "   function! WordCount()
 "       return g:word_count
 "   endfunction
 "   function! UpdateWordCount()
 "       let lnum = 1
 "       let n = 0
 "       while lnum <= line('$')
 "           let n = n + len(split(getline(lnum)))
 "           let lnum = lnum + 1
 "       endwhile
 "       let g:word_count = n
 "   endfunction
 "   " Update the count when cursor is idle in command or insert mode.
 "   " Update when idle for 1000 msec (default is 4000 msec).
 "   set updatetime=1000
 "   augroup WordCounter
 "       au! CursorHold,CursorHoldI * call UpdateWordCount()
 "   augroup END
 "   " Set statusline, shown here a piece at a time
 "   highlight User1 ctermbg=green guibg=green ctermfg=black guifg=black
 "   set statusline=%1*            " Switch to User1 color highlight
 "   set statusline+=%<%F          " file name, cut if needed at start
 "   set statusline+=%M            " modified flag
 "   set statusline+=%y            " file type
 "   set statusline+=%=            " separator from left to right justified
 "   set statusline+=\ %{WordCount()}\ words,
 "   set statusline+=\ %l/%L\ lines,\ %P    " percentage through the file
" }}}
" Delimitmate Settings {{{

"Delimitmate Auto-pairings
let delimitMate_matchpairs = "(:),[:],{:},<:>"
" }}}
" Lightline Settings {{{

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['wordcount', 'percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \   'wordcount': 'WordCount',
      \   'bufferline'   : 'MyBufferline',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

 function! MyBufferline()
    call bufferline#refresh_status()
    let b = g:bufferline_status_info.before
    let c = g:bufferline_status_info.current
    let a = g:bufferline_status_info.after
    let alen = strlen(a)
    let blen = strlen(b)
    let clen = strlen(c)
    let w = winwidth(0) * 4 / 11
    if w < alen+blen+clen
        let whalf = (w - strlen(c)) / 2
        let aa = alen > whalf && blen > whalf ? a[:whalf] : alen + blen < w - clen || alen < whalf ? a : a[:(w - clen - blen)]
        let bb = alen > whalf && blen > whalf ? b[-(whalf):] : alen + blen < w - clen || blen < whalf ? b : b[-(w - clen - alen):]
        return (strlen(bb) < strlen(b) ? '...' : '') . bb . c . aa . (strlen(aa) < strlen(a) ? '...' : '')
    else
        return b . c . a
    endif
endfunction

let g:bufferline_echo = 1 " turn off bufferline in command bar
let g:bufferline_active_buffer_right = ' '
let g:bufferline_active_buffer_left = '⮁ '

function! WordCount()
  if &filetype == "pandoc"
  let s:old_status = v:statusmsg
  let position = getpos(".")
  exe ":silent normal g\<c-g>"
  let stat = v:statusmsg
  let s:word_count = 0
  if stat != '--No lines in buffer--'
    if stat =~ "^Selected"
      let s:word_count = str2nr(split(v:statusmsg)[5])
    else
      let s:word_count = str2nr(split(v:statusmsg)[11])
    end
    let v:statusmsg = s:old_status
  end
  call setpos('.', position)
  return s:word_count
  endif 
endfunction

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

" function! MyReadonly()
"   return &ft !~? 'help' && &readonly ? 'RO' : ''
" endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
"      return strlen(_) ? mark._ : ''
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" let g:lightline = {
"       \ 'colorscheme': 'solarized',
"       \ 'mode_map': { 'c': 'NORMAL' },
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
"       \ },
"       \ 'component_function': {
"       \   'modified': 'MyModified',
"       \   'readonly': 'MyReadonly',
"       \   'fugitive': 'MyFugitive',
"       \   'filename': 'MyFilename',
"       \   'fileformat': 'MyFileformat',
"       \   'filetype': 'MyFiletype',
"       \   'fileencoding': 'MyFileencoding',
"       \   'mode': 'MyMode',
"       \ },
"       \ 'separator': { 'left': '⮀', 'right': '⮂' },
"       \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
"       \ }

" function! MyModified()
"   return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
" endfunction

" function! MyReadonly()
"   return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
" endfunction

" function! MyFilename()
"   return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
"         \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
"         \  &ft == 'unite' ? unite#get_status_string() : 
"         \  &ft == 'vimshell' ? vimshell#get_status_string() :
"         \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
"         \ ('' != MyModified() ? ' ' . MyModified() : '')
" endfunction

" function! MyFugitive()
"   if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
"     let _ = fugitive#head()
"     return strlen(_) ? '⭠ '._ : ''
"   endif
"   return ''
" endfunction

" function! MyFileformat()
"   return winwidth(0) > 70 ? &fileformat : ''
" endfunction

" function! MyFiletype()
"   return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
" endfunction

" function! MyFileencoding()
"   return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
" endfunction

" function! MyMode()
"   return winwidth(0) > 60 ? lightline#mode() : ''
" endfunction

"set guifont=AnonymousPro:h16

" }}}
" Tmuxline {{{

let g:tmuxline_preset = 'full'

" }}}
" NerdTree {{{ 
"Open automatically when file isn't specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
"NERDTree Window Position
let NERDTreeWinPos = 'right'

"Close NerdTree when it's the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}
" Goyo {{{ 
"
" Set width
let g:goyo_width = 85
" silent! call lightline#enable() " show lightline in Goyo mode

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

" ensure quit all windows
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

" }}}
" Extras and Unused {{{
"Filenames in tabs in iTerm
"set t_ts=^[]1;
"set t_fs=^G
"set guitablabel=%t

" Switch tabs with numbers
"if has("gui_macvim")
""  map <D-1> :tabfirst<Cr>
""  map <D-2> :tabfirst<Cr>gt
""  map <D-3> :tabfirst<Cr>3gt
""  map <D-4> :tabfirst<Cr>4gt
""  map <D-5> :tabfirst<Cr>5gt
""  map <D-6> :tabfirst<Cr>6gt
""  map <D-7> :tabfirst<Cr>7gt
""  map <D-8> :tabfirst<Cr>8gt
""  map <D-9> :tabfirst<Cr>9gt
"endif

" open all buffers in tabs (gui)
"map <silent> <leader>tb :tab :ball<cr>

"}}}
" AIRLINE SETTINGS {{{
" let g:airline_theme = 'solarized'

" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif

" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = 'RO'
" let g:airline_symbols.linenr = '⭡'

" let g:airline_powerline_fonts = 'Anonymous Pro'
" let g:airline#extensions#hunks#enabled = 0
" let g:airline#extensions#whitespace#enabled = 0

" function! AirLineBlaenk()
"   function! Modified()
"     return &modified ? " +" : ''
"   endfunction

"  call airline#parts#define_raw('filename', '%<%f')
"  call airline#parts#define_function('modified', 'Modified')

"   let g:airline_section_b = airline#section#create_left(['filename'])
"   let g:airline_section_c = airline#section#create([''])
"   let g:airline_section_gutter = airline#section#create(['modified', '%='])
"   let g:airline_section_x = airline#section#create_right([''])
" " let g:airline_section_y = airline#section#create_right(['%c'])
"   let g:airline_section_y = airline#section#create_right(['%{WordCount()} words', '%l/%L lines, %P'])
"   let g:airline_section_z = airline#section#create(['branch'])
  
" endfunction

" autocmd Vimenter * call AirLineBlaenk()

" let g:airline_theme_patch_func = 'AirLineBlaenkTheme'

" " 0,1: gfg, gbg; 2,3: tfg, tbg; 4: styles
" function! AirLineBlaenkTheme(palette)
"   if g:airline_theme == 'solarized'
"     let purple = ['#ffffff', '#5f5faf', 255, 13, '']
"     let violet = ['#5f5faf', '#aeaed7', 13, 61, '']
"     let inv_purple = ['#5f5faf', '#ffffff', 13, 255, '']
"     let purple_violet = ['#5f5faf', '#aeaed7', 61, 13, '']

"     " dark = middle
"     " white = focus
"     " light = edges

"     let a:palette.ctrlp = {
"       \ 'CtrlPlight' : purple,
"       \ 'CtrlPwhite' : inv_purple,
"       \ 'CtrlPdark'  : violet,
"       \ 'CtrlParrow1': inv_purple,
"       \ 'CtrlParrow2': purple,
"       \ 'CtrlParrow3': purple_violet,
"       \ }

"     let secondary = ['#ffffff', '#657b83', 255, 240, '']

"     let magenta = ['#ffffff', '#d33682', 255, 125, '']
"     let blue = ['#ffffff', '#268bd2', 255, 33, '']
"     let green = ['#ffffff', '#859900', 255, 64, '']
"     let red = ['#ffffff', '#dc322f', 255, 160, '']
"     let orange = ['#ffffff', '#cb4b16', 255, 166, '']

"     let modes = {
"       \ 'normal': blue,
"       \ 'insert': green,
"       \ 'replace': magenta,
"       \ 'visual': orange
"       \}

"     let a:palette.replace = copy(a:palette.insert)
"     let a:palette.replace_modified = a:palette.insert_modified

"     for key in ['insert', 'visual', 'normal']
"       " no red on modified
"       let a:palette[key . '_modified'].airline_c[0] = '#657b83'
"       let a:palette[key . '_modified'].airline_c[2] = 11

"       for section in ['a', 'b', 'y', 'z']
"         let airline_section = 'airline_' . section
"         if has_key(a:palette[key], airline_section)
"           " white foreground for most components; better contrast imo
"           let a:palette[key][airline_section][0] = '#ffffff'
"           let a:palette[key][airline_section][2] = 255
"         endif
"       endfor
"     endfor

"     for key in keys(modes)
"       let a:palette[key].airline_a = modes[key]
"       let a:palette[key].airline_z = modes[key]

"       "let a:palette[key . '_modified'].airline_b = ['#002b36', '#93a1a1', 234, 245]

"       let a:palette[key].airline_b = secondary
"       let a:palette[key].airline_y = secondary
"     endfor

"   endif
" endfunction

" let g:airline#extensions#default#section_truncate_width = {
"   \ 'x': 60,
"   \ 'y': 60
"   \ }

" let g:airline_mode_map = {
"   \ '__' : '-',
"   \ 'n'  : 'N',
"   \ 'i'  : 'I',
"   \ 'R'  : 'R',
"   \ 'v'  : 'V',
"   \ 'V'  : 'V-L',
"   \ 'c'  : 'C',
"   \ '' : 'V-B',
"   \ 's'  : 'S',
"   \ 'S'  : 'S-L',
"   \ '' : 'S-B',
"   \ }

""""""""""""""""""""""""""""""""""""
" }}}
" CtrlP Settings {{{
"let g:ctrlp_by_filename = 1
" nnoremap <leader>b :CtrlPBuffer<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/.hg/*,*/.svn/* 
"let g:ctrlp_working_path_mode = ''
"}}}
