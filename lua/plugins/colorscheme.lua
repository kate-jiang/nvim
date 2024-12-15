return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'macchiato',
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          CursorLine = { bg = colors.surface0 },
          CursorLineNr = { fg = colors.pink },
          Search = { bg = colors.peach, fg = '#000000' },
          IncSearch = { bg = colors.red, fg = '#181825' },
          EndOfBuffer = { fg = colors.flamingo },
          WinSeparator = { fg = colors.base, bg = colors.crust },
          YankHighlight = { bg = '#d45f98', fg = colors.peach },
        }
      end,
    }

    vim.cmd [[colorscheme catppuccin]]
  end,
}

-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("tokyonight").setup({
--       style = "night",
--       transparent = true,
--       terminal_colors = true,
--       lualine_bold = true,
--       on_highlights = function(highlights, colors)
--         highlights.GitSignsAdd = { fg = colors.green }
--         highlights.GitSignsChange = { fg = colors.yellow }
--         highlights.GitSignsDelete = { fg = colors.red }
--         highlights.CursorLine = { bg = colors.bg_dark }
--         highlights.Visual = { bg = "#8c3b62" }
--       end,
--     })
--
--     vim.cmd([[colorscheme tokyonight]])
--   end,
-- }
