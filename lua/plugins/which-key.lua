return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    spec = {
      { '<leader>c', group = 'Code' },
      { '<leader>g', group = 'Git' },
      { '<leader>l', group = 'Lazygit' },
      { '<leader>r', group = 'Rename', icon = '' },
      { '<leader>s', group = 'Search' },
      { '<leader>sa', group = 'Search Sessions' },
      { '<leader>a', group = 'Mark in harpoon', icon = '' },
      { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
      { '<leader>d', group = 'Delete', icon = '' },
      { '<leader>u', group = 'Undotree', icon = '' },
      { '<leader>f', group = 'Find' },
    },
  },
}
