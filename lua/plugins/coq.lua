return {
  {
    'whonore/Coqtail',
    init = function()
      vim.g.loaded_coqtail = 1
      vim.g['coqtail#supported'] = 0
    end,
  },
  {
    'tomtomjhj/vscoq.nvim',
    filetypes = 'coq',
    dependecies = {
      'neovim/nvim-lspconfig',
      'whonore/Coqtail',
    },
    opts = {
      vscoq = { ... },
      lsp = { ... },
    },
    config = function()
      require('vscoq').setup {
        vscoq = {
          proof = {
            cursor = { sticky = true },
          },
        },
        lsp = {
          on_attach = function(_, bufnr)
            vim.keymap.set('n', '<C-n>', '<Cmd>VsCoq stepForward<CR>', { buffer = bufnr, desc = 'VsCoq step forward' })
            vim.keymap.set('n', '<C-e>', '<Cmd>VsCoq stepBackward<CR>', { buffer = bufnr, desc = 'VsCoq step backward' })
            vim.keymap.set('n', '<leader>cl', '<Cmd>VsCoq interpretToPoint<CR>', { buffer = bufnr, desc = 'VsCoq interpret to point' })
            vim.keymap.set('n', '<leader>cg', '<Cmd>VsCoq interpretToEnd<CR>', { buffer = bufnr, desc = 'VsCoq interpret to end' })
            vim.keymap.set('n', '<leader>c<CR>', '<cmd>VsCoqPanels<CR>', { buffer = bufnr, desc = 'Open VsCoq' })

            vim.schedule(function()
              vim.cmd 'VsCoqPanels'
            end)
          end,
          -- autostart = false, -- use this if you want to manually `:LspStart vscoqtop`.
          -- cmd = { 'vscoqtop', '-bt', '-vscoq-d', 'all' }, -- for debugging the server
        },
      }
    end,
  },
}
