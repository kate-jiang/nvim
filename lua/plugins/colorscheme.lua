return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      transparent_background = true,
      term_colors = false,
      custom_highlights = function(colors)
        return {
          Cursor = { fg = '#000000', bg = colors.overlay1 },
          lCursor = { fg = '#000000', bg = colors.overlay1 },
          CursorLine = { bg = colors.surface0 },
          CursorLineNr = { fg = colors.pink },
          Search = { bg = colors.peach, fg = '#000000' },
          IncSearch = { bg = colors.red, fg = '#181825' },
          EndOfBuffer = { fg = colors.flamingo },
          YankHighlight = { bg = '#d45f98', fg = colors.peach },
          SnacksIndentScope = { fg = colors.overlay0 },
          SnacksIndent = { fg = colors.surface0 },
          -- WinSeparator = { fg = colors.base, bg = colors.crust },
        }
      end,
    }

    vim.cmd [[colorscheme catppuccin]]
  end,
}
