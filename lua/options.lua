--setters
local options = {
  encoding = "UTF-8",
  mouse = "a",
  statusline = "%f",
  errorbells = false,
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  cursorline = true,
  expandtab = true,
  smartindent = true,
  nu = true,
  wrap = false,
  smartcase = true,
  swapfile = false,
  backup = false,
  scrolloff = 10,
  relativenumber = true,
  rnu = true,
 -- undodir = "/home/stas/.vim/undodir",
  undofile = true,
  incsearch = true,
  --t_Co=256,
  hlsearch = false,
  compatible = false,
  ic = true,
  --colorcolumn=300,
  diffopt = "vertical",
  termguicolors = true,
  updatetime = 250,
  timeout = true,
  timeoutlen = 300,
  guifont = 'FantasqueSansMono Nerd Font:h22'
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
