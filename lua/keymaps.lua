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
nkeymap('<leader>w', ':w!<CR>')
nkeymap('<leader>q', ':q!<CR>')

-- window nvigation
nkeymap('<leader>h', ':wincmd h  <CR>')
nkeymap('<leader>j', ':wincmd j  <CR>')
nkeymap('<leader>k', ':wincmd k  <CR>')
nkeymap('<leader>l', ':wincmd l  <CR>')

-- file navigations
nkeymap('<leader>pv', ':NERDTreeToggle <CR>')

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
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- commenting
nkeymap('<C-\\>', ':Commentary <CR>')
vkeymap('<C-\\>', ':Commentary <CR>')

-- git manager
nkeymap('<leader>88', ':Git<leader>')
nkeymap('<leader>8a', ':G <CR>')
nkeymap('<leader>8c', ':G commit <CR>')
nkeymap('<leader>8p', ':G push <CR>')
nkeymap('<leader>8u', ':G push -u origin ')
nkeymap('<leader>8l', ':diffget //3 <CR>')
nkeymap('<leader>8r', ':diffget //2 <CR>')

-- custom movements
nkeymap('dge', 'd$')
nkeymap('ge', '$')
vkeymap('ge', '$')
vim.api.nvim_set_keymap('n','<C-S-v>','<cmd>put *<CR>',{normap = ture})
vim.api.nvim_set_keymap('v','<C-S-v>','<cmd>put *<CR>',{normap = ture})
vim.api.nvim_set_keymap('c','<c-v>','<c-r>+',{normap = ture})
vim.api.nvim_set_keymap('c','<c-s-v>','<c-r>"',{normap = ture})

-- debugger
nkeymap('<leader>db', ':call vimspector#ToggleBreakpoint() <CR>')
nkeymap('<leader>do', ':call vimspector#StepOver() <CR>')
nkeymap('<leader>di', ':call vimspector#StepInto() <CR>')
nkeymap('<leader>du', ':call vimspector#StepOut() <CR>')
nkeymap('<leader>dr', ':call vimspector#Restart() <CR>')
nkeymap('<leader>ds', ':call vimspector#Stop() <CR>')
nkeymap('<leader>dd', ':call vimspector#Continue() <CR>')
nkeymap('<leader>dx', ':call vimspector#Reset() <CR>')

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
