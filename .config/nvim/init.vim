set exrc
set nohlsearch
set hidden

if !exists('g:vscode')
  syntax on
  set encoding=UTF-8
  set t_Co=256

  " -- Keep Settings --
  set cursorline
  set incsearch
  set smartcase
  set showmatch
  set relativenumber
  set belloff=all
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set smartindent
  set nu
  set nowrap
  set splitbelow splitright
  set wildmenu
  set nocompatible

  " % for html tags use https://www.vim.org/scripts/script.php?script_id=39
  filetype plugin on
  filetype off

  set showcmd
  set noswapfile
  set noshowmode
  set nobackup
  set undodir=~/.vim/undodir
  set undofile
  set scrolloff=8

  " set completeopt=menuone,noinsert,noselect
  set cmdheight=2
  set updatetime=50
  set shortmess+=c

endif

" >> Plugins! --
call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/ReplaceWithRegister'
  Plug 'chaoren/vim-wordmotion'
  Plug 'unblevable/quick-scope'
  Plug 'adelarsq/vim-matchit'
  Plug 'evanleck/vim-svelte', {'branch': 'main'}
  " Plug 'rhysd/clever-f.vim'

  " >vim plugins only
  if !exists('g:vscode') 
    " need to try in vsCode still
    "TEST THIS " Plugin 'alvan/vim-closetag'

    " visual plugs
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'sainnhe/gruvbox-material'
    Plug 'joshdick/onedark.vim'
    Plug 'ryanoasis/vim-devicons'

    " Utlities
    " Plug 'lifepillar/vim-colortemplate'

    " Good
    Plug 'tpope/vim-commentary'
    " Plug 'michaeljsmith/vim-indent-object'

    " Primeagen recommends--
    "Plug ***Get Harpoooooon and Telescope learn the way ..
    Plug 'tpope/vim-fugitive'
    Plug 'vim-utils/vim-man'
    Plug 'mbbill/undotree'
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'
    " Plug 'vuciv/vim-bujo'
    Plug 'tpope/vim-dispatch'
    "  Plug 'theprimeagen/vim-be-good'
  endif

" Plug install, update, help
call plug#end() 

" >vim only settings
if !exists('g:vscode')

  let mapleader = " "

  " >> qol settings
  let g:netrw_browse_split = 2
  let g:netrw_banner = 0
  let g:netrw_winsize = 25

  " >> ThemeSetup--
    "
  augroup qs_colors
    autocmd!
    " autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    " autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
    autocmd ColorScheme * highlight QuickScopePrimary gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#e3e3e3' gui=underline ctermfg=81 cterm=underline
  " highlight QuickScopeSecondary guifg='#888888' gui=underline ctermfg=81 cterm=underline
  augroup END

  let g:airline#extensions#tabline#enabled = 1
  colorscheme onedark
  set background=dark

  " set cursor
  " set guicursor=
  hi Cursor guifg='#e3e3e3' guibg='#ff50ff'
  set termguicolors
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait600-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait275-blinkoff120-blinkon175,

  " >> abbreviations
  " abbr soM something

  " >> For reload on vimrc save
  augroup myvimrc
      au!
      au BufWritePost init.vim,.vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
  augroup END

  " >> Key mappings VIM only
  imap ; <Esc>
  vmap ; <Esc>

  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '<-2<CR>gv=gv
 
  "TODO split buffer/panes

  "TODO map <C-t> buffer tab cycle
  
  " navigate windows/buffers
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  nnoremap gt :bnext<CR>
  nnoremap gT :pnext<CR>

  " mimic vsc binds
  nnoremap <C-w> <Cmd>:q<CR>

  "FIXME " nnoremap <C-r> :replace all defName vsCode
  "FIXME " nnoremap <C-/> Vgc

  " leader leader window/plugin actions 
  nnoremap <leader><leader>u :UndotreeShow<CR>
  nnoremap <leader><leader>e :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
  nnoremap <C-S-E>:wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

endif 
"end vim only settings

">> Plug Settings for all version
let g:wordmotion_prefix = "<leader>"
let g:wordmotion_mappings = { 'w' : 'w', 'b' : 'b', 'e' : '<W-e>' , 'iw': 'iw'}
" let g:clever_f_chars_match_any_signs = ";"
" let g:clever_f_fix_key_direction = 1
" let g:clever_f_mark_direct = 1

">> Key maps for all
"<< cause i know better
let mapleader = " "
map , %

" nnoremap ; zz
noremap J }j
noremap K {k

" nav remaps
nnoremap die ggVG
nnoremap H B
nnoremap L W
nnoremap } 9k
nnoremap { 9j

" normal maps
nnoremap R r
nnoremap S R
nnoremap U <C-r>
nnoremap Q @
" nnoremap <silent> <Esc> :noh<CR>

" insert maps
inoremap <C-p> <C-r>0
inoremap <C-l> <Del>

"FIXME suggestions (ctrl + . works) "inoremap <C-space> <C-p>

" visual remaps
vnoremap L W
vnoremap H B
vnoremap > >gv
vnoremap < <gv

" Stuff for wsl copy
vnoremap <C-c> "+y
let s:clip = '/mnt/c/Windows/System32/clip.exe'
let g:clipboard = {
  \   'name': 'WslClipboard',
  \   'copy': {
  \      '+': 'clip.exe',
  \      '*': 'clip.exe',
  \    },
  \   'paste': {
  \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  \   },
  \   'cache_enabled': 0,
  \ }

"FIXME vmap <C-/> gcc
vmap s S

" gspot maps
nmap gs ysiw

" Map for r as gr
vmap r gr 
nmap <silent> r :set opfunc=SpecialChange<CR>gr
function! SpecialChange(type)
    silent exec 'gr' 
endfunction

" ctrl maps
"FIXME " noremap <C-S-CR> O<Esc>
nnoremap <CR> o<Esc>
"FIXME " nmap <S-C><CR> O<Esc>
nnoremap <C-s> <Cmd>:w<CR>

" leader maps
nnoremap <leader>a $
nnoremap <leader>i ^
vnoremap <leader>i $
vnoremap <leader>a ^

" FIXME does not account for indent this way
nnoremap <leader>o o<Esc>O
nnoremap <leader>. @@

nnoremap <leader>; $a;<Esc>
nnoremap <leader><leader>; a;<Esc>
nnoremap <leader>, $a,<Esc>
nnoremap <leader>p "+p
nnoremap <leader>m M
nnoremap <leader>v vaBV
nnoremap <leader>V vabV

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>d "_d
vnoremap <leader>d "_d

"FIXME nnoremap <leader>K "break line at next space
noremap <leader>J J

" Imitate goto symbol clear/insert
nmap <leader>{ f{ci{
nmap <leader>} f}i
nmap <leader>( f(ci(
nmap <leader>) f)i
nmap <leader>[ f[ci[
nmap <leader>] f]i

"TODO better [ ] as g; and g,

if exists('g:vscode')

  nnoremap <silent> <leader>z <Cmd>call VSCodeCall('workbench.action.toggleZenMode')<CR><Cmd>call VSCodeCall('workbench.action.focusActiveEditorGroup')<CR>
  map <silent> zv <Cmd>call VSCodeCall('workbench.action.toggleZenMode')<CR><Cmd>call VSCodeCall('workbench.action.focusActiveEditorGroup')<CR>

  " FIXME buffer wont save in vsCode?
  nnoremap <silent> <leader>s <Cmd>call VSCodeCall('workbench.action.files.save')<CR>
  nnoremap <silent> <leader><leader>r <Cmd>call VSCodeCall('workbench.action.openRecent')<CR>

  " hit that gspot with vsc actions (todo make some work for neovim)
  nnoremap <silent> gp <Cmd>call VSCodeCall('editor.action.marker.next')<CR>
  nnoremap <silent> gl <Cmd>call VSCodeCall('editor.action.openLink')<CR>

  " Git version controls
  nnoremap <silent> gb <Cmd>call VSCodeCall('editor.action.dirtydiff.next')<CR>

  "TODO some things to control git staging, can use vim commands?
  "TODO gpot for errors? gE? then <c-d><c-u> when conditional?

  noremap <silent> gm <Cmd>call VSCodeCall('editor.action.addSelectionToNextFindMatch')<CR>
  noremap <silent> gM <Cmd>call VSCodeCall('editor.action.selectHighlights')<CR>

  " For my bookmarks extension
  " TODO make a function for taking in the number (refactor dis shitz)
  noremap <silent> m1 <Cmd>call VSCodeCall('numberedBookmarks.toggleBookmark1')<CR>
  noremap <silent> m2 <Cmd>call VSCodeCall('numberedBookmarks.toggleBookmark2')<CR>
  noremap <silent> m3 <Cmd>call VSCodeCall('numberedBookmarks.toggleBookmark3')<CR>
  noremap <silent> m4 <Cmd>call VSCodeCall('numberedBookmarks.toggleBookmark4')<CR>
  noremap <silent> m5 <Cmd>call VSCodeCall('numberedBookmarks.toggleBookmark5')<CR>
  noremap <silent> m6 <Cmd>call VSCodeCall('numberedBookmarks.toggleBookmark6')<CR>
  noremap <silent> m7 <Cmd>call VSCodeCall('numberedBookmarks.toggleBookmark7')<CR>
  noremap <silent> m8 <Cmd>call VSCodeCall('numberedBookmarks.toggleBookmark8')<CR>
  noremap <silent> m9 <Cmd>call VSCodeCall('numberedBookmarks.toggleBookmark9')<CR>
  noremap <silent> m0 <Cmd>call VSCodeCall('numberedBookmarks.toggleBookmark0')<CR>
  noremap <silent> '1 <Cmd>call VSCodeCall('numberedBookmarks.jumpToBookmark1')<CR>
  noremap <silent> '2 <Cmd>call VSCodeCall('numberedBookmarks.jumpToBookmark2')<CR>
  noremap <silent> '3 <Cmd>call VSCodeCall('numberedBookmarks.jumpToBookmark3')<CR>
  noremap <silent> '4 <Cmd>call VSCodeCall('numberedBookmarks.jumpToBookmark4')<CR>
  noremap <silent> '5 <Cmd>call VSCodeCall('numberedBookmarks.jumpToBookmark5')<CR>
  noremap <silent> '6 <Cmd>call VSCodeCall('numberedBookmarks.jumpToBookmark6')<CR>
  noremap <silent> '7 <Cmd>call VSCodeCall('numberedBookmarks.jumpToBookmark7')<CR>
  noremap <silent> '8 <Cmd>call VSCodeCall('numberedBookmarks.jumpToBookmark8')<CR>
  noremap <silent> '9 <Cmd>call VSCodeCall('numberedBookmarks.jumpToBookmark9')<CR>
  noremap <silent> '0 <Cmd>call VSCodeCall('numberedBookmarks.jumpToBookmark0')<CR>

  " Good example of cmd bind that extends
  nnoremap <silent> ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>

  " Different settings in vsCode for scoping 
  highlight QuickScopePrimary gui=underline cterm=underline ctermfg=155 
  highlight QuickScopeSecondary gui=underline cterm=underline ctermfg=81

  " Fix for comments?
  "FIXME use plugin for vim motions not working with vsCode comments
  xmap gc <Plug>VSCodeCommentary
  nmap gc <Plug>VSCodeCommentary
  omap gc <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine
  vmap <silent> gC <Cmd>call VSCodeCall('editor.action.blockComment')<CR>

  "FIXME " Highlighting in vsCode/neoVCS/neovim are all different?
  vmap <silent> af <Cmd>call VSCodeCall('editor.action.smartSelect.grow')<CR>
  vmap <silent> aF <Cmd>call VSCodeCall('editor.action.smartSelect.shrink')<CR>

  "BORKED
  "(Hacky attempt and having colored action bar but overwrites and esc not working)
  "nnoremap <silent> i <Cmd>call VSCodeCall('settings.cycle.statusBarInsert')<CR>i
  "#nnoremap <silent> v <Cmd>call VSCodeCall('settings.cycle.statusBarVisual')<CR>v
  "#nnoremap <silent> ; <Cmd>call VSCodeCall('settings.cycle.statusBarEsc')<CR><Esc>
  "#nnoremap <silent> ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
endif
