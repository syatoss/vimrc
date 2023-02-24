
"nerdtree setters:
set encoding=UTF-8
set mouse=a
syntax on
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
" set undofile
set incsearch
set t_Co=256
set statusline+=%*
set nohlsearch
set nocompatible
set ic
set colorcolumn=300
set diffopt+=vertical
set termguicolors
set guifont=Comic\ Code:h18
let g:neovide_transparency = 0.9
let g:transparency = 0.9
let g:neovide_background_color = '#0f1117'.printf('%x',float2nr(255* g:transparency))
let g:neovide_floating_blur_amount_x = 2.0
let g:neovide_floating_blur_amount_y = 2.0

let g:gruvbox_termcolors=16
let g:dracula_termcolors=16

highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.vim/plugged')


Plug 'jremmen/vim-ripgrep'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'AndrewRadev/tagalong.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main'  }
Plug 'marko-cerovac/material.nvim'
Plug 'rafamadriz/neon'
Plug 'sainnhe/sonokai'
Plug 'EdenEast/nightfox.nvim'
Plug 'olimorris/onedarkpro.nvim'
Plug 'kaiuri/nvim-mariana'
Plug 'tjdevries/colorbuddy.vim'
Plug 'Th3Whit3Wolf/onebuddy'
Plug 'ThePrimeagen/harpoon'
Plug 'rafamadriz/neon'
Plug 'bluz71/vim-nightfly-colors'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'joshdick/onedark.vim'
Plug 'ful1e5/onedark.nvim'


call plug#end()

let g:gruvbox_termcolors=16
let g:gruvbox_guitermcolors=16

colorscheme nordfox


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
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-clangd', 'coc-angular', 'coc-html', 'coc-css', 'coc-json', 'coc-scssmodules' ]
let g:AutoPairs = {'<': '>', '`': '`', '"': '"', '{': '}', '(': ')', '[': ']', '''': '''' }
let NERDTreeShowHidden=1



nnoremap <leader>h :wincmd h  <CR>
nnoremap <leader>j :wincmd j  <CR>
nnoremap <leader>k :wincmd k  <CR>
nnoremap <leader>l :wincmd l  <CR>
nnoremap <leader>s :w! <CR>
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
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap -0 o<ESC>
nnoremap <leader>qq :q! <CR>
nnoremap <leader>qw :wq! <CR>
nnoremap <leader>ha :lua require("harpoon.mark").add_file() <CR>
nnoremap <leader>hh :lua require("harpoon.ui").toggle_quick_menu() <CR>
nnoremap <leader>hd :lua require("harpoon.ui").nav_next() <CR>
nnoremap <leader>hs :lua require("harpoon.ui").nav_prev() <CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap  <leader>rr :so ~/AppData/Local/nvim/init.vim <CR>
nnoremap  <leader>cr :CocRestart <CR>

lua <<EOF

local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true }
local function nkeymap(map, action)
  keymap('n', map, action, opt)
end

local function vkeymap(map, action)
  keymap('v', map, action, opt)
end

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


pcall(require('telescope').load_extension, 'fzf')

require('telescope').setup{
    defaults = {
		path_display={"truncate"},
        file_ignore_patterns = {
            "node_modules",
            "dist",
            "projects\\base*",
            "projects\\modules\\admin",
            "projects\\modules\\autocrash",
            "projects\\modules\\binsplit",
            "projects\\modules\\dap",
            "projects\\modules\\dmoqpm",
            "projects\\modules\\dmoyield",
            "projects\\modules\\flam",
            "projects\\modules\\genie",
            "projects\\modules\\hvqk",
            "projects\\modules\\launchpad",
            "projects\\modules\\litho",
            "projects\\modules\\litho-lothovision-asml-eda",
            "projects\\modules\\orlanalyzer",
            "projects\\modules\\pbit",
            "projects\\modules\\planar",
            "projects\\modules\\pri",
            "projects\\modules\\sandbox",
            "projects\\modules\\utp",
            "projects\\modules\\yield"
        }
    }
}
-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'help', 'vim','html','css' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
        opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
}

require("gitsigns").setup {
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    }

--remaps
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[f]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[f]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[f]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[f]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[f]ind [D]iagnostics' })

-- git manager
nkeymap('<leader>88', ':Git<leader>')
nkeymap('<leader>8a', ':G <CR>')
nkeymap('<leader>8c', ':G commit <CR>')
nkeymap('<leader>8p', ':G push <CR>')
nkeymap('<leader>8u', ':G push -u origin ')
nkeymap('<leader>8l', ':diffget //3 <CR>')
nkeymap('<leader>8r', ':diffget //2 <CR>')

-- Copy and paste (mostly to support neovim GUI like noevide)
vim.api.nvim_set_keymap('n','<C-S-v>','<cmd>put *<CR>',{normap = ture})
vim.api.nvim_set_keymap('v','<C-S-v>','<cmd>put *<CR>',{normap = ture})
vim.api.nvim_set_keymap('c','<c-v>','<c-r>+',{normap = ture})
vim.api.nvim_set_keymap('c','<c-s-v>','<c-r>"',{normap = ture})

EOF

function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction


" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

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

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"default coc config

" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
" nmap <leader>cl  <Plug>(coc-codelens-action)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
