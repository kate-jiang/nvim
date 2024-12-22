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
    dim = {
      enabled = true,
      animate = {
        easing = 'outQuad',
        duration = {
          step = 10, -- ms per step
          total = 250, -- maximum duration
        },
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
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
    },
    {
      '<leader>go',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse',
      mode = { 'n', 'v' },
    },
    {
      '<leader>un',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss All Notifications',
    },
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
        Snacks.toggle.diagnostics():map '<leader>ud'
        Snacks.toggle.inlay_hints():map '<leader>uh'
        Snacks.toggle.indent():map '<leader>ug'
        Snacks.toggle.dim():map '<leader>uD'
      end,
    })
  end,
}
