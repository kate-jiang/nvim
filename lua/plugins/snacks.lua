return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        {
          section = 'terminal',
          cmd = 'chafa ~/Pictures/wallpapers/isabelle.jpg --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1',
          height = 17,
          padding = 1,
        },
        {
          pane = 2,
          { section = 'keys', gap = 1, padding = 1 },
          { section = 'startup' },
        },
      },
    },
    scratch = { enabled = false },
    dim = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = {
      enabled = true,
      win = {
        style = {
          width = vim.o.columns,
          height = vim.o.lines - 1,
        },
      },
    },
    notifier = { enabled = true, style = 'compact' },
    quickfile = { enabled = true },
    scroll = {
      enabled = false,
      animate = {
        duration = {
          step = 5, -- ms per step
          total = 100, -- maximum duration
        },
      },
      spamming = 0,
    },
    statuscolumn = { enabled = true, left = { 'sign', 'git' }, right = { 'fold', 'mark' } },
    words = { enabled = true },
  },
  keys = {
    {
      '<leader>lg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>gh',
      function()
        Snacks.lazygit.log_file()
      end,
      desc = 'Lazygit Current File History',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = 'Lazygit Current File History',
    },
    {
      '<leader>j',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },
    {
      '<leader>gb',
      function()
        Snacks.git.blame_line()
      end,
      desc = 'Git Blame Line',
    },
    {
      '<leader>go',
      function()
        Snacks.gitbrowse { what = 'commit' }
      end,
      desc = 'Open Commit in Browser',
      mode = { 'n', 'v' },
    },
  },
}
