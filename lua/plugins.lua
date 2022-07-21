require('packer').startup(function()
  use 'morhetz/gruvbox' -- gruvbox color scheme
  use 'sainnhe/sonokai' -- sonokai color scheme
  use 'nvim-lua/plenary.nvim' -- treesitter dependancy
  use 'nvim-telescope/telescope-fzf-native.nvim' -- treesitter deoendancy
  use 'nvim-telescope/telescope.nvim' -- awesome fuzzy finder
  use 'preservim/nerdtree' -- file explorer
  use 'jiangmiao/auto-pairs' --auto pairing parantheses
  use 'tpope/vim-commentary' -- provides easy wy to comment
  use 'tpope/vim-fugitive' -- git manager
  use 'andrejlevkovitch/vim-lua-format' -- auto format for lua
  use 'puremourning/vimspector' -- built in debbuger
  use 'rhysd/vim-clang-format' -- auto format for clang
  use 'nvim-treesitter/nvim-treesitter' -- better syntax highlighting
  use 'nvim-treesitter/nvim-treesitter-angular' -- better syntax highlighting for angular
  use "neovim/nvim-lspconfig" -- lsp installer dependancy
  use "williamboman/nvim-lsp-installer" -- lsp installer
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'vim-airline/vim-airline'
end)


