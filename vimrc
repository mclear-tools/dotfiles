" vim:fdm=marker
set encoding=utf-8
scriptencoding utf-8
" Vundle Setup {{{

set nocompatible
filetype off

" VUNDLE & FUZZY FINDER
set rtp+=~/.vim/bundle/Vundle.vim,~/.fzf

call vundle#begin()

" Let vundle manage Vundle
" Plugins

Plugin 'gmarik/Vundle.vim'
Plugin 'Z1MM32M4N/vim-superman'
Plugin 'vim-pad'
Plugin 'christoomey/vim-tmux-navigator' " easy navigate tmux and vim panes
Plugin 'wesQ3/vim-windowswap' " Easily swap buffers
Plugin 'Valloric/YouCompleteMe' " Vim auto-complete
Plugin 'bling/vim-bufferline' " plugin for buffer display in lightline/airline
"Plugin 'SuperTab'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
" Pandoc vim footnotes
" Plugin 'MarkdownFootnotes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'VOoM'
"Plugin 'tpope/vim-sensible'
"Plugin 'rstacruz/vim-opinion'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
"Plugin 'bling/vim-airline'
Plugin 'itchyny/lightline.vim' " alternate powerline plugin
Plugin 'edkolev/tmuxline.vim' " tmux lightline plugin
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
"Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-obsession'
"Plugin 'dhruvasagar/vim-prosession'
Plugin 'junegunn/goyo.vim'
" Plugin 'vim-scripts/EasyMotion'
"TeX Plugin
Plugin 'TeX-9'
" Git Viewer
Plugin 'gitv'
" More Git action
Plugin 'extradite.vim'
"Evernote
Plugin 'https://github.com/neilagabriel/vim-geeknote'
"Change to title case
" Plugin 'titlecase.vim'
" Links
" Plugin 'utl.vim'
" End Plugins

call vundle#end()
filetype plugin indent on

"}}}
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
" Keymappings {{{
inoremap jk <Esc>
nmap <C-N><C-N> :set invnumber<CR>
" }}}
" Settings {{{
syntax enable
set noshowmode
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
" presents spelling options in dropdown and returns to normal mode
":nnoremap \s ea<C-X><C-S>
inoremap <expr> <CR> pumvisible() ? "\<C-y><Esc>" : "\<CR>" 
set tabstop=4 shiftwidth=2 expandtab
set linespace=2
"set fo+=t
set scrolloff=99
set textwidth=80
" remap paragraph formatting 
noremap Q gwip
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
" save file
nnoremap <Leader>w :w<CR>

let maplocalleader = ","
" link mvim to marked app
:nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p' <CR>\|:redraw!<CR>
"Map NERDTree to ,t
nmap <silent> <localLeader>t :NERDTreeToggle<CR>
" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>
" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>
"Copy to system clipboard
set clipboard=unnamed
set go+=a

" Yank text to the OS X clipboard
 noremap <leader>y "*y
 noremap <leader>yy "*Y
"
" " Preserve indentation while pasting text from the OS X clipboard
 noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

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
" }}}
" CtrlP Settings {{{
let g:ctrlp_by_filename = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/.hg/*,*/.svn/* 
nnoremap <leader>b :CtrlPBuffer<CR>
"let g:ctrlp_working_path_mode = ''
"}}}
" vim-pandoc settings {{{
"
let g:pandoc#biblio#sources = ["g"]
let g:pandoc#biblio#bibs = ["/Users/Roambot/Dropbox/Work/Master.bib"]
let g:pandoc#formatting#textwidth = 80
let g:pandoc#formatting#mode = 'ha'
let g:pandoc#formatting#extra_equalprg = "--atx-headers"
" Toggle table of contents
nnoremap <leader>C :TOC<CR>
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
" Backup and Swap Settings {{{
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
"set noswapfile
" }}}
" Delimitmate Settings {{{

"Delimitmate Auto-pairings
let delimitMate_matchpairs = "(:),[:],{:},<:>"
" }}}
" vim-pad settings {{{
let g:pad#default_format = "pandoc"
let g:pad#dir = "~/notes/"
" }}}
" Lightline Settings {{{

if has('gui_running')
  set guifont=Inconsolata-dz\ for\ Powerline:h14
endif

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark', 'bufferline'] ],
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

let g:bufferline_echo = 0 " turn off bufferline in command bar
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
" Toggle on/off
nnoremap <Leader>G :Goyo<CR>
" Set width
let g:goyo_width = 85
"}}}
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
