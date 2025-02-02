return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    spec = {
      { '<leader>c', group = 'Code', mode = { 'n', 'x' } },
      { '<leader>p', group = 'Project', icon = '' },
      { '<leader>g', group = 'Git' },
      { '<leader>l', group = 'Lazygit' },
      { '<leader>r', group = 'Rename', icon = '' },
      { '<leader>s', group = 'Search' },
      { '<leader>w', group = 'Buffer' },
      { '<leader>a', group = 'Mark in harpoon', icon = '' },
      { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
      { '<leader>m', group = 'Messages', icon = '' },
      { '<leader>u', group = 'Undotree', icon = '' },
      { '<leader>f', group = 'Find' },
    },
  },
}
