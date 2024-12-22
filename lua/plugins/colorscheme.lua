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

-- return {
--   'rose-pine/neovim',
--   name = 'rose-pine',
--   config = function()
--     require('rose-pine').setup {
--       variant = 'moon',
--       dark_variant = 'moon',
--       dim_inactive_windows = false,
--       extend_background_behind_borders = true,
--       highlight_groups = {
--         TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
--         TelescopeNormal = { bg = 'none' },
--         TelescopePromptNormal = { bg = 'none' },
--         TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
--         TelescopeSelection = { fg = 'text', bg = 'none' },
--         TelescopeSelectionCaret = { fg = 'rose', bg = 'rose' },
--         CursorLineNr = { fg = 'rose' },
--         -- CurSearch = { fg = 'base', bg = 'leaf', inherit = false },
--         -- Search = { fg = 'text', bg = 'leaf', blend = 20, inherit = false },
--       },
--       before_highlight = function() end,
--       enable = {
--         terminal = true,
--         legacy_highlights = false,
--         migrations = true,
--       },
--       styles = {
--         bold = true,
--         italic = true,
--         transparency = true,
--       },
--       palette = {},
--       groups = {},
--     }
--     vim.cmd 'colorscheme rose-pine'
--   end,
-- }

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
