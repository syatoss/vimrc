syntax on


"nerdtree setters:
set encoding=UTF-8
set mouse=a
set statusline=%f
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set cursorline
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set scrolloff=10
set relativenumber
set rnu
set undodir=~/.vim/undodir
set undofile
set incsearch
set t_Co=256
set statusline+=%*
set nohlsearch
set nocompatible
set ic
set colorcolumn=300
set diffopt+=vertical

highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-angular'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'AndrewRadev/tagalong.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


call plug#end()


colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
highlight LineNr ctermfg=NONE ctermbg=NONE
hi Pmenu ctermbg=242 ctermfg=255


if executable('rg')
    let g:rg_derive_root = 'true'
endif

let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standatd']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ctrlp_use_caching=0
let g:rg_command = 'rg --vimgrep -S'
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-clangd', 'coc-angular', 'coc-html', 'coc-css', 'coc-json']
let g:AutoPairs = {'<': '>', '`': '`', '"': '"', '{': '}', '(': ')', '[': ']', '''': '''' }



nnoremap <leader>h :wincmd h  <CR>
nnoremap <leader>j :wincmd j  <CR>
nnoremap <leader>k :wincmd k  <CR>
nnoremap <leader>l :wincmd l  <CR>
nnoremap <leader>s :w <CR>
nnoremap <leader>u :UndotreeShow  <CR>
nnoremap <leader>pv :NERDTreeToggle <CR>
nnoremap <Leader>ps :Telescope live_grep <CR>
nnoremap <Leader>pb :Telescope file_browser <CR>
nnoremap <Leader>pf :Telescope find_files  <CR>
nnoremap <C-\> :Commentary <CR>
vnoremap <C-\> :Commentary <CR>
nnoremap gc +y
nnoremap gv +p
vnoremap gc +y
vnoremap gv +p
nnoremap ge $
vnoremap ge $
nnoremap dge d$
nnoremap yge y$
nnoremap gr d$
nnoremap -0 o<ESC>
nnoremap <leader>qq :q <CR>
nnoremap <leader>qf :q! <CR>
nnoremap <leader>qw :wq! <CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
map  <leader>gd <Plug>(coc-definition)
nmap  <leader>gy <Plug>(coc-type-definition)
nmap  <leader>gi <Plug>(coc-implementation)
nmap  <leader>gr <Plug>(coc-references)
nnoremap  <leader>cr :CocRestart <CR>
nnoremap  <leader>ggg :Git<leader>
nnoremap  <leader>gga :G <CR>
nnoremap  <leader>ggc :G commit <CR>
nnoremap  <leader>ggp :G push <CR>
nnoremap  <leader>ggl :diffget //3 <CR>
nnoremap  <leader>ggr :diffget //2 <CR>

lua <<EOF
require 'nvim-treesitter.install'.compilers = { "cl" }
EOF
lua <<EOF
require'nvim-treesitter.configs'.setup { highlight = { enable = true} }
EOF


function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

augroup JsonToJsonc
    autocmd! FileType json set filetype=jsonc
augroup END


" autocmd FileType json setlocal commentstring=//%s
autocmd FileType jsonc setlocal commentstring=//%s
