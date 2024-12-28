vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map('n', '<esc>', '<cmd>nohl<cr>', opts)

-- disable updating register for x and c
map('n', 'x', '"_x', opts)
map('n', 'c', '"_c', opts)
map('n', 'C', '"_C', opts)

-- splits management
map('n', '<leader>\\', '<C-w>v', { desc = 'Split window vertically' })
map('n', '<leader>|', '<C-w>s', { desc = 'Split window horizontally' })
-- map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

-- resize with ctrl +/-
map('n', '<C-->', '<cmd>resize -4<cr>', { desc = 'Smaller horizontal split' })
map('n', '<C-=>', '<cmd>resize +4<cr>', { desc = 'Bigger horizontal split' })
map('n', '<C-[>', '<cmd>vertical resize -4<cr>', { desc = 'Smaller vertical split' })
map('n', '<C-]>', '<cmd>vertical resize +4<cr>', { desc = 'Bigger vertical split' })

-- tabs management
-- map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" })
-- map("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close current tab" })
-- map('n', '[t', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
-- map('n', ']t', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })

-- buffers management
map('n', '<C-l>', '<cmd>bn<CR>', { desc = 'Go to next buffer' })
map('n', '<C-h>', '<cmd>bp<CR>', { desc = 'Go to previous buffer' })
map('n', '<leader>dw', '<cmd>bd<CR>', { desc = 'Close buffer' })
-- map('n', '<leader>do', '<cmd>%bd<CR><cmd>e#<CR>', { desc = 'Close all other buffers' })
-- map("n", "<leader>bn", "<cmd>new<CR>", { desc = "New buffer" })

-- copy & paste
map('x', 'p', '"_dP', opts)
map('', '<leader>dd', '"_dd<esc>', { desc = 'Delete without changing register' })

-- scrolling
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- indenting
map('x', '<', '<gv', opts)
map('x', '>', '>gv', opts)
map('n', '<', '<<', opts)
map('n', '>', '>>', opts)

-- other
-- map('n', '<leader>mm', '<cmd>messages<cr>', { desc = 'Show messages' })
map('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

map('x', 'u', '<esc>u', opts)
map('v', 'u', '<esc>u', opts)
