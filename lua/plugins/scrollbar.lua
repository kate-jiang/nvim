local colors = require('catppuccin.palettes').get_palette 'mocha'

return {
  'petertriho/nvim-scrollbar',
  opts = {
    throttle_ms = 30,
    -- handle = {
    --   text = ' ',
    --   blend = 100,
    -- },
    marks = {
      Cursor = { text = '█', color = colors.surface2 },
      -- GitAdd = { text = '▁', hl = 'GitSignsAdd', priority = 1 },
      -- GitChange = { text = '▁', hl = 'GitSignsAdd', priority = 1 },
    },
    handlers = { gitsigns = true, handle = false },
  },
}
