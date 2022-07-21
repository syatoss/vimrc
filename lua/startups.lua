local treesitter = require 'nvim-treesitter.configs'
vim.cmd 'colorscheme gruvbox'

treesitter.setup {
  ensure_installed = {
    "c", "lua", "javascript", "java", "typescript", "python", "angular", 
  },
  sync_install = false,
  auto_install = true, -- auto install missing
  ignore_install = {},
  highlight = { enable = true },
  indent = { enable = true }
}
