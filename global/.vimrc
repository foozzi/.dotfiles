" Base settings (add comments)
set nocompatible
syntax enable                               " syntax highlight

set t_Co=256                                " set 256 colors

set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8	                            " utf-8 by default

set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

" set clipboard=unnamed                       " use system clipboard
set clipboard=unnamedplus

set exrc                                    " enable usage of additional .vimrc files from working directory
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

let mapleader = " "                         " leader key

" Buffers
set switchbuf=useopen                       " open buffer instead of creating a new one
set laststatus=2
" close current buffer
nmap <leader>bc :bd<CR>

" Search
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    autocmd FileType python,rst,c,cpp set colorcolumn=80

    autocmd FileType vimwiki set wrap
    autocmd FileType vimwiki set textwidth=80
augroup END

" terminal
cabbrev bterm bo term
autocmd TerminalWinOpen *
  \ if &buftype == 'terminal' |
  \   resize 10 |
  "\   setlocal termwinsize=0x140 |
  \ endif
nmap <leader>tt  :bterm<CR>

autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" plugings
call plug#begin()

Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
" Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
" Plug 'tommcdo/vim-exchange'
" Plug 'michaeljsmith/vim-indent-object'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'jamessan/vim-gnupg'
Plug 'ryanoasis/vim-devicons'
" https://github.com/LunarWatcher/auto-pairs/blob/master/doc/AutoPairs.txt
Plug 'LunarWatcher/auto-pairs'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'morhetz/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'majutsushi/tagbar'

call plug#end()

filetype on
filetype plugin on
filetype plugin indent on

" tagbar
" let g:tagbar_autofocus=0
" let g:tagbar_width=42
" autocmd BufEnter *.py :call tagbar#autoopen(0)

" ultisnips
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" easymotion
map <leader>F <Plug>(easymotion-s)
map <leader>f <Plug>(easymotion-f)
" nerdtree
map <c-t>   :NERDTree<CR>
nmap " :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
" autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments

" fzf
" set rtp+=/opt/homebrew/opt/fzf
" nmap <leader>bb :Buffers<CR>

" auto-pairs
let g:AutoPairsMapBS = 1
let g:AutoPairsBSAfter = 0

" airline
" let g:airline#extensions#obsession#enable = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#ale#enabled = 1
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#whitespace#enabled = 0
" let g:airline_theme='gruvbox'
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_symbols.linenr = ' ☰ '
" let g:airline_symbols.colnr = ' : '
" let g:airline_symbols.maxlinenr = ''

" theme
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='soft'

" vim wiki
let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.wiki\|.md\)\='
" toogle checklists
nnoremap <leader>cl :VimwikiToggleListItem<CR>
" reset gpg-agent password cache after close or save the buffer (vimwiki diary)
autocmd BufWritePost *.asc.md !gpgconf --reload gpg-agent
" https://github.com/WnP/vimwiki_markdown
" ~/vimwiki/personal - private content
" ~/vimwiki/public_wiki - public wiki content
" ~/vimwiki/diary - private diary
let default_wiki = '~/Productivity/vimwiki/personal'
let public_wiki = '~/Productivity/vimwiki/public_wiki'
let g:diary = '~/Productivity/vimwiki/diary'
let g:diary_index_name = 'diary'
let g:diary_ext = '.asc.md'
let g:vimwiki_list = [{
    \ 'path': default_wiki,
    \ 'diary_rel_path': '../diary',
    \ 'auto_diary_index': 1,
    \ 'auto_export': 0},
    \ {'path': public_wiki,
	\ 'auto_export': 0,
    \ 'diary_rel_path': '../diary',
	\ 'template_path': public_wiki . '/templates/',
	\ 'template_default': 'default',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': public_wiki . '/site_html/',
	\ 'custom_wiki2html': 'vimwiki_markdown',
	\ 'template_ext': '.tpl'},
    \ {'path': diary,
    \ 'index': diary_index_name,
    \ 'ext': diary_ext,
    \ 'diary_rel_path': './',
    \ 'auto_diary_index': 1,
    \ 'auto_export': 0}]
" fix - https://github.com/vimwiki/vimwiki/issues/1055
exe 'autocmd BufEnter ' . diary_index_name . diary_ext . ' :VimwikiDiaryGenerateLinks'
" inserting default diary template
function! AppendDiaryTemplate()
  " detecting path of current buffer
  let current_dir = substitute(expand('%:p:h'), '^' . $HOME, '~', '')
  if current_dir == g:diary
    r! ~/scripts/vimwiki_diary_template
    execute '1,2d'
    normal G
    normal o
  endif
endfunction
command! InsertDiaryTemplate call AppendDiaryTemplate()
nnoremap <leader>idr :InsertDiaryTemplate<CR>
" inserting default GPG fingerprint for the diary
let g:diaryGPG = 'CE7EB8727486553012A04E284EE708165AA10C48'
command! InsertGPGAndExit call AppendGPGAndExit()
function! AppendGPGAndExit()
  " detecting vim-gnupg dialog
  if match(getline(2), '^GPG:') == 0
      call append(line('.'), g:diaryGPG)
      wq
  endif
endfunction
nnoremap <leader>igg :InsertGPGAndExit<CR>

" prettier
nmap <leader>mm <Plug>(PrettierAsync)

" ALE
let g:ale_linters = {
\   'python': ['ruff', 'mypy', 'pyright'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['ruff', 'ruff_format'],
\   'javascript': ['prettier', 'eslint'],
\}
let g:ale_fix_on_save = 1
map <C-e> <Plug>(ale_next_wrap)
map <C-r> <Plug>(ale_previous_wrap)
nmap <leader>go :ALEGoToDefinition<CR>
nmap <leader>qf :ALEFix<CR>
nmap <leader>k  :ALEHover<CR>
let g:ale_python_auto_virtualenv = 1
let g:ale_fix_on_save = 1

" YCM
set completeopt-=preview
" autocmd CompleteDone * if pumvisible() == 0 | pclose | endif

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',ё\\,яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё/|
