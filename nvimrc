" vim:fdm=marker
set encoding=utf-8
scriptencoding utf-8
set nocompatible
filetype plugin indent on

" Plugins {{{

call plug#begin('~/.nvim/plugged')

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
 
Plug 'bling/vim-airline'  " powerline plugin
Plug 'vimwiki/vimwiki' " wiki in vim
Plug 'git://github.com/sjl/gundo.vim' " graphical tree undo
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " file manager
Plug 'jeetsukumaran/vim-buffergator' "Buffer manager
"Plug 'Z1MM32M4N/vim-superman' " open man pages in vim
Plug 'christoomey/vim-tmux-navigator' " easy navigate tmux and vim panes
Plug 'wesQ3/vim-windowswap' " Easily swap buffers
Plug 'bling/vim-bufferline' " plugin for buffer display in lightline/airline
Plug 'supertab' " Tab completion
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-after' " plugin for vim-pandoc and other plugins
Plug 'altercation/vim-colors-solarized'
Plug 'VOoM' " outliner
Plug 'tpope/vim-commentary' " Comment manager/toggle
Plug 'tpope/vim-fugitive' " Git management
Plug 'tpope/vim-surround' "  surround text with whatever
" "Plug 'airblade/vim-gitgutter'
" Plug 'itchyny/lightline.vim' " alternate powerline plugin
Plug 'edkolev/tmuxline.vim' " tmux lightline plugin
Plug 'mhinz/vim-startify' " session manager and startup screen
Plug 'junegunn/goyo.vim' " writeroom style writing
Plug 'TeX-9' " Latex
Plug 'gitv' " Git Viewer 
Plug 'https://github.com/neilagabriel/vim-geeknote'  "Evernote
Plug 'davidoc/taskpaper.vim' " taskpaper alternative
" Plug 'henrik/vim-open-url' " open any url using ruby and regex
Plug 'vim-pad'  " note plugin

" " Not sure about these plugins

" Plug 'svintus/vim-editexisting' " focus file if open rather than swap warning
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

" "}}}
" General Keymappings {{{"{{{

" Grep TODO and NOTE
noremap <leader>d :copen<CR>:vimgrep /TODO/gj *.md *.taskpaper<CR>
noremap <leader>n :copen<CR>:vimgrep /NOTE/gj *.md *.taskpaper<CR>
" clean up paragraph according to pandoc specs
nnoremap <leader>= vip=
" previous and next buffer 
nnoremap <leader>] :tabnext<CR>
nnoremap <leader>[ :tabprevious<CR>
" previous and next tab
nnoremap <leader>' :bn<CR>
nnoremap <leader>; :bp<CR>
" new tab
nnoremap <leader>q :tabnew<CR>
" remap escape
inoremap jk <Esc>

" " Insert mode navigation mappings

" delete previous word in insert
inoremap <C-D> <Esc>bdwi

" " make cursor move to next visual line below cursor this is a test 
noremap Q gwip
nnoremap <leader>c :set cursorline! <CR>
nnoremap <C-N><C-N> :set invnumber<CR>
" presents spelling options in dropdown and returns to normal mode
nnoremap <leader>s ea<C-X><C-S>

" " link vim to marked app
nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p' <CR>\|:redraw!<CR>
" Let's make it easy to edit this file (mnemonic for the key sequence is " 'e'dit 'v'imrc)
 nnoremap <silent> ,ev :e /Users/Roambot/.nvimrc<cr>
" And to source this file as well (mnemonic for the key sequence is " 's'ource 'v'imrc)
 nnoremap <silent> ,sv :so /Users/Roambot/.nvimrc<cr>
" Yank text to the OS X clipboard
" noremap <leader>y "*y
" noremap <leader>yy "*Y
" " Preserve indentation while pasting text from the OS X clipboard
" "noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
" Mapping to toggle fold
 nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
 vnoremap <Space> zf

let maplocalleader = ","
" Toggle table of contents
 nnoremap <localLeader>c :TOC<CR>
" " Toggle Goyo on/off
 nnoremap <localLeader>g :Goyo<CR>
" "Map NERDTree to ,t
 nnoremap <silent> <localLeader>t :NERDTreeToggle<CR>
 nnoremap <localLeader>v :VoomToggle<CR>
" "toggle filetype for pandoc
 nnoremap <localleader>f :set filetype=pandoc<CR> 
" " Gundo toggle
 nnoremap <localleader>G :GundoToggle<CR>
" quicksave
nnoremap <localleader>w :w!<CR>
" Fuzzyfinder for home directory
 noremap <C-t> :FZF ~<CR>
" Fuzzyfinder for current directory
 noremap <C-f> :FZF<CR>

" " Remap navigation commands to center view on cursor using zz
" " nnoremap <C-U> 11kzz
" " nnoremap <C-D> 11jzz
" " nnoremap j jzz
" " nnoremap k kzz
" " nnoremap # #zz
" " nnoremap * *zz
" " nnoremap n nzz
" " nnoremap N Nzz

" "Copy to system clipboard
nmap <F2> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F2> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F1> :.w !pbcopy<CR><CR>
vmap <F1> :w !pbcopy<CR><CR>

" }}}
" Settings {{{
syntax enable
" buffer settings
set hidden
set switchbuf=useopen
set noshowmode
set nonumber
" colorscheme settings
set background=dark
colorscheme solarized
" highlight clear SignColumn
call togglebg#map("<F5>")
set spell spelllang=en_us
set tabstop=4 shiftwidth=2 expandtab
set linespace=2
set fo+=t
set scrolloff=999 " keep cursor in middle of screen
set textwidth=80
" remap paragraph formatting 
set formatprg=par
set ruler
set laststatus=2
set showcmd
set wildmenu

" set lazyredraw " to avoid scrolling problems
" Move to next line when using left and right
set whichwrap+=<,>
" |nojoinspaces| allows you to use SHIFT-J in normal mode to join the next line 
" " with the current line without adding unwanted spaces.
setlocal nojoinspaces
" " tells vim to use HTML style comments in your markdown files. For more, see |comments| and |commentstring|.
 setlocal breakat-=*
" setlocal commentstring=<!--%s-->
" setlocal comments=s:<!--,m:\ \ \ \ ,e:-->
" make delete key work properly
set backspace=indent,eol,start
" " make vim scrollable with mouse
set mouse=a

set go+=a


" " The Silver Searcher
if executable('ag')
" Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" " bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Ag exec command
"command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap A :Ag<Space>

" " }}}
" Backup and Swap Settings {{{
set backupdir=~/.nvim/backup//
set directory=~/.nvim/swap//
set undodir=~/.nvim/undo//
set noswapfile
" }}}
" Functions {{{
"Reveal file in finder using :Reveal
function! s:RevealInFinder()
  if filereadable(expand("%"))
    let l:command = "open -R %"
  elseif getftype(expand("%:p:h")) == "dir"
    let l:command = "open %:p:h"
  else
    let l:command = "open ."
  endif
  execute ":silent! !" . l:command
  redraw!
endfunction
command! Reveal call <SID>RevealInFinder()

" }}}
" Startify Settings {{{

    autocmd User Startified setlocal cursorline

    let g:startify_enable_special         = 0
    let g:startify_files_number           = 8
    let g:startify_relative_path          = 0
    let g:startify_change_to_dir          = 1
    let g:startify_session_autoload       = 1
    let g:startify_session_persistence    = 1
    let g:startify_session_delete_buffers = 1

    let g:startify_list_order = [
      \ ['   Most recently used:'],
      \ 'files',
      \ ['   Recently used within this dir:'],
      \ 'dir',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ]

    let g:startify_skiplist = [
                \ 'COMMIT_EDITMSG',
                \ $NVIMRUNTIME .'/doc',
                \ 'bundle/.*/doc',
                \ '\.vimgolf',
                \ ]

    let g:startify_bookmarks = [
                \ '~/.nvimrc',
                \ '~/Dropbox/Wiki/index.txt',
                \ '~/Dropbox/Work/Teaching',
                \ '~/Dropbox/Work/Projects',
                \ '/Users/Roambot/Dropbox/Work/Professional/McLearCV/McLearCV.tex',
                \ '/Users/Roambot/Dropbox/Webpage/content/pages/101Assignments.md',
                \ ]

    let g:startify_custom_footer =
          \ ['', "Aus so krummem Holze, als woraus der Mensch gemacht ist, kann nichts ganz Gerades gezimmert werden (8:23)", '']

    let g:startify_custom_header =
          \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['']

    hi StartifyBracket ctermfg=240
    hi StartifyFile    ctermfg=147
    hi StartifyFooter  ctermfg=240
    hi StartifyHeader  ctermfg=114
    hi StartifyNumber  ctermfg=215
    hi StartifyPath    ctermfg=245
    hi StartifySlash   ctermfg=240
    hi StartifySpecial ctermfg=240

" open nerdtree at start with startify
"    autocmd VimEnter *
"               \   if !argc()
"                \ |   Startify
"                \ |   NERDTree
"                \ |   wincmd w
"               \ | endif


" }}}
" Vim-Pad {{{

let g:pad#dir = "~/Dropbox/Notes/"
let g:pad#set_mappings = 0
let g:pad#default_format = "pandoc"
let g:pad#default_file_extension = ".md"
let g:pad#window_height = 10
let g:pad#search_backend = "ag"

nnoremap <localleader>p :Pad ls<CR>
nnoremap <localleader>n :Pad new<CR>
nnoremap <localleader>sp :Pad ls<Space>


" }}}
" Voom Settings {{{

let g:voom_tree_width = 50
let g:voom_ft_modes = {'pandoc': 'markdown', 'markdown': 'markdown', 'tex': 'latex'}
let g:voom_default_mode = 'pandoc'

" }}}
" Vim Wiki {{{

let g:vimwiki_list = [{"path": '/Users/Roambot/Dropbox/Wiki', "path_html": '~/Dropbox/Apps/VimWiki/WikiPages', "template_path": '~/Dropbox/Apps/VimWiki', "template_default": 'default', "template_ext": '.tpl', "syntax": 'markdown', "ext": '.txt', "custom_wiki2html": 'vimwiki_markdown', "index": 'index'}] 

" Mappings

nmap <localleader>i <Plug>VimwikiIndex
nnoremap <localleader>sw :VWS 


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
let g:pandoc#keyboard#sections#header_style = 'a2'
" disable header number in column
let g:pandoc#folding#fdc = 0
" let g:pandoc#after#modules#enabled = ["supertab", "goyo"]

" build shortcuts
nnoremap <localleader>d :Pandoc! pdf -s  -N -V mainfont=Optima --latex-engine=xelatex --smart --bibliography=/Users/Roambot/Dropbox/Work/Master.bib<CR>
nnoremap <localleader>m :Pandoc! beamer -i -s --latex-engine=xelatex --variable=fontsize:11pt -V sansfont=Avenir -V theme:Hannover -V colortheme:dolphin<CR>
"""""""""""""""""""""""""
" }}}
" Delimitmate Settings {{{

"Delimitmate Auto-pairings
let delimitMate_matchpairs = "(:),[:],{:},<:>"
" }}}
" " Lightline Settings {{{

" let g:lightline = {
"       \ 'colorscheme': 'solarized',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
"       \   'right': [ [ 'syntastic', 'lineinfo', 'time'], ['wordcount', 'percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
"       \ },
"       \ 'component_function': {
"       \   'time': 'MyTime',
"       \   'fugitive': 'MyFugitive',
"       \   'filename': 'MyFilename',
"       \   'fileformat': 'MyFileformat',
"       \   'filetype': 'MyFiletype',
"       \   'fileencoding': 'MyFileencoding',
"       \   'mode': 'MyMode',
"       \   'ctrlpmark': 'CtrlPMark',
"       \   'wordcount': 'WordCount',
"       \   'bufferline'   : 'MyBufferline',
"       \ },
"       \ 'component_expand': {
"       \   'syntastic': 'SyntasticStatuslineFlag',
"       \ },
"       \ 'component_type': {
"       \   'syntastic': 'error',
"       \ },
"       \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"       \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
"       \ }

"  function! MyTime()
"   return strftime('%x %X')
"  endfunction


"  function! MyBufferline()
"     call bufferline#refresh_status()
"     let b = g:bufferline_status_info.before
"     let c = g:bufferline_status_info.current
"     let a = g:bufferline_status_info.after
"     let alen = strlen(a)
"     let blen = strlen(b)
"     let clen = strlen(c)
"     let w = winwidth(0) * 4 / 11
"     if w < alen+blen+clen
"         let whalf = (w - strlen(c)) / 2
"         let aa = alen > whalf && blen > whalf ? a[:whalf] : alen + blen < w - clen || alen < whalf ? a : a[:(w - clen - blen)]
"         let bb = alen > whalf && blen > whalf ? b[-(whalf):] : alen + blen < w - clen || blen < whalf ? b : b[-(w - clen - alen):]
"         return (strlen(bb) < strlen(b) ? '...' : '') . bb . c . aa . (strlen(aa) < strlen(a) ? '...' : '')
"     else
"         return b . c . a
"     endif
" endfunction

" let g:bufferline_echo = 1 " turn off bufferline in command bar
" let g:bufferline_active_buffer_right = ']'
" let g:bufferline_active_buffer_left = '['

" function! WordCount()
"   if &filetype == "pandoc"
"   let s:old_status = v:statusmsg
"   let position = getpos(".")
"   exe ":silent normal g\<c-g>"
"   let stat = v:statusmsg
"   let s:word_count = 0
"   if stat != '--No lines in buffer--'
"     if stat =~ "^Selected"
"       let s:word_count = str2nr(split(v:statusmsg)[5])
"     else
"       let s:word_count = str2nr(split(v:statusmsg)[11])
"     end
"     let v:statusmsg = s:old_status
"   end
"   call setpos('.', position)
"   return s:word_count
"   endif 
" endfunction

" function! MyModified()
"   return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
" endfunction

" function! MyReadonly()
"   if &filetype == "help"
"     return ""
"   elseif &readonly
"     return "\ue0a2"
"   else
"     return ""
"   endif
" endfunction

" " function! MyReadonly()
" "   return &ft !~? 'help' && &readonly ? 'RO' : ''
" " endfunction

" function! MyFilename()
"   let fname = expand('%:t')
"   return fname == 'ControlP' ? g:lightline.ctrlp_item :
"         \ fname == '__Tagbar__' ? g:lightline.fname :
"         \ fname =~ '__Gundo\|NERD_tree' ? '' :
"         \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
"         \ &ft == 'unite' ? unite#get_status_string() :
"         \ &ft == 'vimshell' ? vimshell#get_status_string() :
"         \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
"         \ ('' != fname ? fname : '[No Name]') .
"         \ ('' != MyModified() ? ' ' . MyModified() : '')
" endfunction

" function! MyFugitive()
"   try
"     if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
"       let mark = ''  " edit here for cool mark
"       let _ = fugitive#head()
" "      return strlen(_) ? mark._ : ''
"       return strlen(_) ? ' '._ : ''
"     endif
"   catch
"   endtry
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
"   let fname = expand('%:t')
"   return fname == '__Tagbar__' ? 'Tagbar' :
"         \ fname == 'ControlP' ? 'CtrlP' :
"         \ fname == '__Gundo__' ? 'Gundo' :
"         \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
"         \ fname =~ 'NERD_tree' ? 'NERDTree' :
"         \ &ft == 'unite' ? 'Unite' :
"         \ &ft == 'vimfiler' ? 'VimFiler' :
"         \ &ft == 'vimshell' ? 'VimShell' :
"         \ winwidth(0) > 60 ? lightline#mode() : ''
" endfunction

" function! CtrlPMark()
"   if expand('%:t') =~ 'ControlP'
"     call lightline#link('iR'[g:lightline.ctrlp_regex])
"     return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
"           \ , g:lightline.ctrlp_next], 0)
"   else
"     return ''
"   endif
" endfunction

" let g:ctrlp_status_func = {
"   \ 'main': 'CtrlPStatusFunc_1',
"   \ 'prog': 'CtrlPStatusFunc_2',
"   \ }

" function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
"   let g:lightline.ctrlp_regex = a:regex
"   let g:lightline.ctrlp_prev = a:prev
"   let g:lightline.ctrlp_item = a:item
"   let g:lightline.ctrlp_next = a:next
"   return lightline#statusline(0)
" endfunction

" function! CtrlPStatusFunc_2(str)
"   return lightline#statusline(0)
" endfunction

" let g:tagbar_status_func = 'TagbarStatusFunc'

" function! TagbarStatusFunc(current, sort, fname, ...) abort
"     let g:lightline.fname = a:fname
"   return lightline#statusline(0)
" endfunction

" augroup AutoSyntastic
"   autocmd!
"   autocmd BufWritePost *.c,*.cpp call s:syntastic()
" augroup END
" function! s:syntastic()
"   SyntasticCheck
"   call lightline#update()
" endfunction

" let g:unite_force_overwrite_statusline = 0
" let g:vimfiler_force_overwrite_statusline = 0
" let g:vimshell_force_overwrite_statusline = 0

" " " let g:lightline = {
" " "       \ 'colorscheme': 'solarized',
" " "       \ 'mode_map': { 'c': 'NORMAL' },
" " "       \ 'active': {
" " "       \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
" " "       \ },
" " "       \ 'component_function': {
" " "       \   'modified': 'MyModified',
" " "       \   'readonly': 'MyReadonly',
" " "       \   'fugitive': 'MyFugitive',
" " "       \   'filename': 'MyFilename',
" " "       \   'fileformat': 'MyFileformat',
" " "       \   'filetype': 'MyFiletype',
" " "       \   'fileencoding': 'MyFileencoding',
" " "       \   'mode': 'MyMode',
" " "       \ },
" " "       \ 'separator': { 'left': '⮀', 'right': '⮂' },
" " "       \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
" " "       \ }

" " " function! MyModified()
" " "   return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
" " " endfunction

" " " function! MyReadonly()
" " "   return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
" " " endfunction

" " " function! MyFilename()
" " "   return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
" " "         \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
" " "         \  &ft == 'unite' ? unite#get_status_string() : 
" " "         \  &ft == 'vimshell' ? vimshell#get_status_string() :
" " "         \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
" " "         \ ('' != MyModified() ? ' ' . MyModified() : '')
" " " endfunction

" " " function! MyFugitive()
" " "   if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
" " "     let _ = fugitive#head()
" " "     return strlen(_) ? '⭠ '._ : ''
" " "   endif
" " "   return ''
" " " endfunction

" " " function! MyFileformat()
" " "   return winwidth(0) > 70 ? &fileformat : ''
" " " endfunction

" " " function! MyFiletype()
" " "   return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
" " " endfunction

" " " function! MyFileencoding()
" " "   return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
" " " endfunction

" " " function! MyMode()
" " "   return winwidth(0) > 60 ? lightline#mode() : ''
" " " endfunction

" " "set guifont=AnonymousPro:h16

" " " }}}
" AIRLINE SETTINGS {{{
  let g:airline_theme = 'solarized'
  let g:airline_powerline_fonts=1
 
" Tweak of solarized colors
let g:airline_theme_patch_func = 'AirLineBlaenkTheme'
" 0,1: gfg, gbg; 2,3: tfg, tbg; 4: styles
function! AirLineBlaenkTheme(palette)
  if g:airline_theme == 'solarized'
    let magenta = ['#ffffff', '#d33682', 255, 125, '']
    let blue = ['#ffffff', '#268bd2', 255, 33, '']
    let green = ['#ffffff', '#859900', 255, 64, '']
    let red = ['#ffffff', '#dc322f', 255, 160, '']
    let orange = ['#ffffff', '#cb4b16', 255, 166, '']
    let cyan = ['#ffffff', '#2aa198', 255, 37, '']
    let modes = {
      \ 'normal': blue,
      \ 'insert': cyan,
      \ 'replace': magenta,
      \ 'visual': orange
      \}
    let a:palette.replace = copy(a:palette.insert)
    let a:palette.replace_modified = a:palette.insert_modified
    for key in keys(modes)
      let a:palette[key].airline_a = modes[key]
      let a:palette[key].airline_z = modes[key]
    endfor
  endif
endfunction

" enable/disable detection of whitespace errors. >
  let g:airline#extensions#whitespace#enabled = 0

" enable/disable tmuxline integration >
  let g:airline#extensions#tmuxline#enabled = 1

" symbol dictionary
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" enable/disable bufferline integration >
  let g:airline#extensions#bufferline#enabled = 0
  let g:bufferline_echo = 1

" enable buffers in tabs
  let g:airline#extensions#tabline#enabled = 1
" Tabline separators
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
" display tab number in tab
  let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
" go to tab number with <leader>number
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
" display only filename in tabs
let g:airline#extensions#tabline#fnamemod = ':t'

" display time
function! AirlineInit()
"  let g:airline_section_y = airline#section#create(['ffenc', '%{strftime("%H:%M")}'])
   let g:airline_section_y = airline#section#create(['%{strftime("%a %b %d %X")}'])
endfunction
autocmd VimEnter * call AirlineInit()

"""""""""""""""""""""""""""""""""""
" }}}
" Tmuxline {{{

let g:tmuxline_preset = 'full'

" }}}
" NerdTree {{{ 
"Open automatically when file isn't specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
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

" "}}}
