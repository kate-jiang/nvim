vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map('n', '<esc>', '<cmd>nohl<cr>', opts)

-- disable updating register for x and c
map('n', 'x', '"_x', opts)
map('n', 'c', '"_c', opts)
map('n', 'C', '"_C', opts)

-- buffers management
map('n', '<S-l>', '<cmd>bn<CR>', { desc = 'Next buffer' })
map('n', '<S-h>', '<cmd>bp<CR>', { desc = 'Previous buffer' })
map('n', '<leader>w', '<cmd>bd<CR>', { desc = 'Close buffer' })
map('n', '<leader>W', '<cmd>bd!<CR>', { desc = 'Force close buffer' })

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
map('n', '<leader>,', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Diagnostics' })
map('n', '<leader>e', '<cmd>Oil --float<CR>', { desc = 'Toggle Oil' })
map('x', 'u', '<esc>u', opts)
map('v', 'u', '<esc>u', opts)

-- map('n', '<leader>dm', '<cmd>delm!<CR>', { desc = 'Delete all marks' })
-- map('n', '<leader>G', '<cmd>DiffviewOpen<CR>', { desc = 'Open Diffview' })

-- map('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
-- map('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
-- map('x', 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
-- map('x', 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- map('n', '<C-M-k>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
-- map('n', '<C-M-j>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
-- map('n', '<C-M-h>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
-- map('n', '<C-M-l>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- splits management
-- map('n', '<leader>v', '<C-w>v', { desc = 'Split window vertically' })
-- map('n', '<leader>s', '<C-w>s', { desc = 'Split window horizontally' })
-- map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

-- tabs management
-- map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" })
-- map("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close current tab" })
-- map('n', '[t', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
-- map('n', ']t', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
