
syntax on
"set nocompatible
"filetype off
filetype plugin on
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set wrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set clipboard=unnamedplus
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80

"set completeopt=menuone,noinsert,noselect
"let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'stsewd/fzf-checkout.vim'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'szw/vim-maximizer'
"  I AM SO SORRY FOR DOING COLOR SCHEMES IN MY VIMRC, BUT I HAVE
"  TOOOOOOOOOOOOO
Plug 'colepeters/spacemacs-theme.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

Plug 'voldikss/vim-floaterm'
Plug 'kdheepak/lazygit.nvim'

Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'mhinz/vim-startify'
Plug 'metakirby5/codi.vim'

"telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'preservim/nerdcommenter'
"Plug 'mxw/vim-jsx'
" Plug 'dart-lang/dart-vim-plugin'
call plug#end()
"let g:jsx_ext_required = 0
let mapleader = " "
"source files
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/airline.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/codiconfig.vim
source $HOME/.config/nvim/plug-config/tsserver.vim
source $HOME/.config/nvim/plug-config/fugitive.vim
source $HOME/.config/nvim/plug-config/telescopeconfig.vim
luafile $HOME/.config/nvim/plug-config/telescope.lua
source $HOME/.config/nvim/plug-config/vim-jsx.vim
luafile $HOME/.config/nvim/plug-config/treesitter.lua
source $HOME/.config/nvim/plug-config/nerdCommenter.vim

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_invert_selection='0'

"
"nerdtree
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-m> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

colorscheme gruvbox
set background=dark

"let g:fzf_layout = {'window': { 'width':0.8, 'height':0.8}}
"let $FZF_DEFAULT_OPTS='--reverse'
"let g:fzf_branch_actions = {
"      \ 'rebase': {
"      \   'prompt': 'Rebase> ',
"      \   'execute': 'echo system("{git} rebase {branch}")',
"      \   'multiple': v:false,
"      \   'keymap': 'ctrl-r',
"      \   'required': ['branch'],
"      \   'confirm': v:false,
"      \ },
"      \ 'track': {
"      \   'prompt': 'Track> ',
"      \   'execute': 'echo system("{git} checkout --track {branch}")',
"      \   'multiple': v:false,
"      \   'keymap': 'ctrl-t',
"      \   'required': ['branch'],
"      \   'confirm': v:false,
"      \ },
"      \}

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

"cambiar entre ventanas
map <leader>tn <esc>:tabnext<CR>
map <leader>tp <esc>:tabprevious<CR>
map <leader>tt <esc>:tabnew<CR>
map <leader>tc <esc>:tabclose<CR>
nnoremap <leader>m :MaximizerToggle!<CR>

fun GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun
"better indentation
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

nnoremap <leader>w :w<cr>
:imap ii <Esc>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>T :Todo<cr>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
" vim TODO
nmap <Leader>tr <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#window_width = 40
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

" Vim with me
nnoremap <leader>vwm :colorscheme gruvbox<bar>:set background=dark<CR>
nmap <leader>vtm :highlight Pmenu ctermbg=blue guibg=blue

vnoremap X "_d
inoremap <C-c> <esc>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
noremap <leader>P :Prettier<cr>
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"Buffers
" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>Bf :bfirst<cr>
nnoremap <leader>Bl :blast<cr>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

autocmd BufWritePre * :call TrimWhitespace()

" Terminal commands
" ueoa is first through fourth finger left hand home row.
" This just means I can crush, with opposite hand, the 4 terminal positions
nmap <leader>tu :call GotoBuffer(0)<CR>
nmap <leader>twu :call GotoWindow(GotoBuffer(0))<CR>
nmap <leader>te :call GotoBuffer(1)<CR>
nmap <leader>twe :call GotoWindow(GotoBuffer(1))<CR>
nmap <leader>to :call GotoBuffer(2)<CR>
nmap <leader>two :call GotoWindow(GotoBuffer(2))<CR>
nmap <leader>ta :call GotoBuffer(3)<CR>
nmap <leader>twa :call GotoWindow(GotoBuffer(3))<CR>

nmap <leader>tsu :call SetBuffer(0)<CR>
nmap <leader>tse :call SetBuffer(1)<CR>
nmap <leader>tso :call SetBuffer(2)<CR>
nmap <leader>tsa :call SetBuffer(3)<CR>

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

fun! GotoBuffer(ctrlId)
    if (a:ctrlId > 9) || (a:ctrlId < 0)
        echo "CtrlID must be between 0 - 9"
        return
    end

    let contents = g:win_ctrl_buf_list[a:ctrlId]
    if type(l:contents) != v:t_list
        echo "Nothing There"
        return
    end

    let bufh = l:contents[1]
    call nvim_win_set_buf(0, l:bufh)
endfun

" How to do this but much better?
let g:win_ctrl_buf_list = [0, 0, 0, 0]
fun! SetBuffer(ctrlId)
    if has_key(b:, "terminal_job_id") == 0
        echo "You must be in a terminal to execute this command"
        return
    end
    if (a:ctrlId > 9) || (a:ctrlId < 0)
        echo "CtrlID must be between 0 - 9"
        return
    end

    let g:win_ctrl_buf_list[a:ctrlId] = [b:terminal_job_id, nvim_win_get_buf(0)]
endfun

fun! SendTerminalCommand(ctrlId, command)
    if (a:ctrlId > 9) || (a:ctrlId < 0)
        echo "CtrlID must be between 0 - 9"
        return
    end
    let contents = g:win_ctrl_buf_list[a:ctrlId]
    if type(l:contents) != v:t_list
        echo "Nothing There"
        return
    end

    let job_id = l:contents[0]
    call chansend(l:job_id, a:command)
endfun

"coc_snippet
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" open new split panes to right and below
set splitright
set splitbelow
nnoremap <c-n> :terminal <CR>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>
