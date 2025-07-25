return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '┃' },
      change = { text = '┋' },
      delete = { text = '_' },
      topdelete = { text = '┃' },
      changedelete = { text = '┋' },
    },
    signs_staged = {
      add = { text = '┃' },
      change = { text = '┋' },
      delete = { text = '_' },
      topdelete = { text = '┃' },
      changedelete = { text = '┋' },
    },
    current_line_blame = true,
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next git [c]hange' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous git [c]hange' })

      -- Visual mode
      map('v', '<leader>hs',
        function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end,
        { desc = 'git [s]tage hunk' }
      )
      map('v', '<leader>hr',
        function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end,
        { desc = 'git [r]eset hunk' }
      )

      -- Normal mode
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
    end,
  },
}
