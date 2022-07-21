--key maps
local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true }

-- leader key
vim.g.mapleader = ' '

-- file operations
keymap('n', '<leader>s', ':w<CR>', opt)
keymap('n', '<leader>qq', ':q<CR>', opt)
keymap('n', '<leader>qf', ':q!<CR>', opt)

-- window nvigation
keymap('n', '<leader>h', ':wincmd h  <CR>', opt)
keymap('n', '<leader>j', ':wincmd j  <CR>', opt)
keymap('n', '<leader>k', ':wincmd k  <CR>', opt)
keymap('n', '<leader>l', ':wincmd l  <CR>', opt)

-- file navigations
keymap('n', '<leader>pv', ':NERDTreeToggle <CR>', opt)
keymap('n', '<Leader>ps', ':Telescope live_grep <CR>', opt)
keymap('n', '<Leader>pb', ':Telescope file_browser <CR>', opt)
keymap('n', '<Leader>pf', ':Telescope find_files  <CR>', opt)

-- commenting
keymap('n', '<C-\\>', ':Commentary <CR>', opt)
keymap('v', '<C-\\>', ':Commentary <CR>', opt)

-- git manager
keymap('n', '<leader>ggg', ':Git<leader>', opt)
keymap('n', '<leader>gga', ':G <CR>', opt)
keymap('n', '<leader>ggc', ':G commit <CR>', opt)
keymap('n', '<leader>ggp', ':G push <CR>', opt)
keymap('n', '<leader>ggl', ':diffget //3 <CR>', opt)
keymap('n', '<leader>ggr', ':diffget //2 <CR>', opt)

-- custom movements
keymap('n', 'dge', 'd$', opt)
keymap('n', 'ge', '$', opt)
keymap('v', 'ge', '$', opt)

-- debugger
keymap('n', '<leader>db', ':call vimspector#ToggleBreakpoint() <CR>', opt)
keymap('n', '<leader>do', ':call vimspector#StepOver() <CR>', opt)
keymap('n', '<leader>di', ':call vimspector#StepInto() <CR>', opt)
keymap('n', '<leader>du', ':call vimspector#StepOut() <CR>', opt)
keymap('n', '<leader>dr', ':call vimspector#Restart() <CR>', opt)
keymap('n', '<leader>ds', ':call vimspector#Stop() <CR>', opt)
keymap('n', '<leader>dd', ':call vimspector#Continue() <CR>', opt)
keymap('n', '<leader>dx', ':call vimspector#Reset() <CR>', opt)

-- lsp
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', opt)
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', opt)
keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', opt)
keymap('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', opt)
keymap('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', opt)
keymap('n', 'gr', ':lua vim.lsp.buf.references()<cr>', opt)
keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>', opt)
keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', opt)
keymap('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', opt)
keymap('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>', opt)
keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', opt)
