--key maps
local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true }
local function nkeymap(map, action)
  keymap('n', map, action, opt)
end

local function vkeymap(map, action)
  keymap('v', map, action, opt)
end

-- leader key
vim.g.mapleader = ' '

-- file operations
nkeymap('<leader>s', ':w<CR>')
nkeymap('<leader>qq', ':q<CR>')
nkeymap('<leader>qf', ':q!<CR>')

-- window nvigation
nkeymap('<leader>h', ':wincmd h  <CR>')
nkeymap('<leader>j', ':wincmd j  <CR>')
nkeymap('<leader>k', ':wincmd k  <CR>')
nkeymap('<leader>l', ':wincmd l  <CR>')

-- file navigations
nkeymap('<leader>pv', ':NERDTreeToggle <CR>')
nkeymap('<Leader>ps', ':Telescope live_grep <CR>')
nkeymap('<Leader>pb', ':Telescope file_browser <CR>')
nkeymap('<Leader>pf', ':Telescope find_files  <CR>')

-- commenting
nkeymap('<C-\\>', ':Commentary <CR>')
vkeymap('<C-\\>', ':Commentary <CR>')

-- git manager
nkeymap('<leader>ggg', ':Git<leader>')
nkeymap('<leader>gga', ':G <CR>')
nkeymap('<leader>ggc', ':G commit <CR>')
nkeymap('<leader>ggp', ':G push <CR>')
nkeymap('<leader>ggl', ':diffget //3 <CR>')
nkeymap('<leader>ggr', ':diffget //2 <CR>')

-- custom movements
nkeymap('dge', 'd$')
nkeymap('ge', '$')
vkeymap('ge', '$')

-- debugger
nkeymap('<leader>db', ':call vimspector#ToggleBreakpoint() <CR>')
nkeymap('<leader>do', ':call vimspector#StepOver() <CR>')
nkeymap('<leader>di', ':call vimspector#StepInto() <CR>')
nkeymap('<leader>du', ':call vimspector#StepOut() <CR>')
nkeymap('<leader>dr', ':call vimspector#Restart() <CR>')
nkeymap('<leader>ds', ':call vimspector#Stop() <CR>')
nkeymap('<leader>dd', ':call vimspector#Continue() <CR>')
nkeymap('<leader>dx', ':call vimspector#Reset() <CR>')

-- lsp
nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')

-- harpoon (marked window navigation)
nkeymap('<leader>wa', ':lua require("harpoon.mark").add_file()<cr>')
nkeymap('<leader>wh', ':lua require("harpoon.ui").toggle_quick_menu()<cr>')
nkeymap('<leader>w1', ':lua require("harpoon.ui").nav_file(1)<cr>')
nkeymap('<leader>w2', ':lua require("harpoon.ui").nav_file(2)<cr>')
nkeymap('<leader>w3', ':lua require("harpoon.ui").nav_file(3)<cr>')
nkeymap('<leader>w4', ':lua require("harpoon.ui").nav_file(4)<cr>')
nkeymap('<leader>w5', ':lua require("harpoon.ui").nav_file(5)<cr>')
nkeymap('<leader>wn', ':lua require("harpoon.ui").nav_next()<cr>')
nkeymap('<leader>wy', ':lua require("harpoon.ui").nav_prev()<cr>')
