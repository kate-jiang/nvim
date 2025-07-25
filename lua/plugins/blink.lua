return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    "fang2hou/blink-copilot",
  },
  version = '*',
  opts = {
    keymap = {
      preset = 'default',
      ['<Enter>'] = { 'accept', 'fallback' },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },

    sources = {
      default = { 'copilot', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      }
    },
  },
  opts_extend = { 'sources.default' },
}
