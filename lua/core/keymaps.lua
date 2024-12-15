vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set

map('n', '<esc>', '<cmd>nohl<cr>')

-- disable updating register for x and c
map('n', 'x', '"_x')
map('n', 'c', '"_c')
map('n', 'C', '"_C')

-- splits management
map('n', '<leader>\\', '<C-w>v', { desc = 'Split window vertically' })
-- map("n", "<leader>|", "<C-w>s", { desc = "Split window horizontally" })
-- map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

-- resize with ctrl +/-
-- map("n", "<C-->", "<cmd>resize -4<cr>", { desc = "Smaller horizontal split" })
-- map("n", "<C-=>", "<cmd>resize +4<cr>", { desc = "Bigger horizontal split" })
map('n', '<C-->', '<cmd>vertical resize -4<cr>', { desc = 'Smaller vertical split' })
map('n', '<C-=>', '<cmd>vertical resize +4<cr>', { desc = 'Bigger vertical split' })

-- tabs management
-- map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" })
-- map("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map('n', '[t', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
map('n', ']t', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })

-- buffers management
map('n', '<C-]>', '<cmd>bn<CR>', { desc = 'Go to next buffer' })
map('n', '<C-[>', '<cmd>bp<CR>', { desc = 'Go to previous buffer' })
-- map("n", "<leader>bn", "<cmd>new<CR>", { desc = "New buffer" })

-- copy & paste
map('x', 'p', '"_dP')
map('', '<leader>dd', '"_dd<esc>', { desc = 'Delete without changing register' })

-- scrolling
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- indenting
map('v', '<', '<gv', { desc = 'Indent left' })
map('v', '<', '>gv', { desc = 'Indent right' })
map('n', '<', '<<', { desc = 'Indent left' })
map('n', '>', '>>', { desc = 'Indent right' })

-- other
map('n', '<leader>mm', '<cmd>messages<cr>', { desc = 'Show messages' })
