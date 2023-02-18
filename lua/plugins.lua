require('lazy').setup({
  'morhetz/gruvbox', -- gruvbox color scheme
  'sainnhe/sonokai', -- sonokai color scheme
  'tpope/vim-fugitive', -- git manager
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled        = false,
        theme                = 'onedark',
        component_seperators = '|',
        section_seperatorts  = '',
      }
    }
  },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  'nvim-lua/plenary.nvim', -- treesitter dependancy

  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
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
  },
  'puremourning/vimspector', -- built in debbuger
  'rhysd/vim-clang-format', -- auto format for clang
  'preservim/nerdtree', -- file explorer
  'jiangmiao/auto-pairs', --auto pairing parantheses
  'tpope/vim-commentary', -- provides easy wy to comment
  'ThePrimeagen/harpoon',
    {'neoclide/coc.nvim',
      branch = 'master',
        run = 'yarn install --frozen-lockfile'
    }

})
