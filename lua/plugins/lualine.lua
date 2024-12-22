return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require 'lualine'

    lualine.setup {
      options = {
        globalstatus = true,
        theme = 'auto',
        symbols = {
          alternate_file = '',
          directory = '',
          readonly = '',
          unnamed = '[no name]',
          newfile = '[new]',
        },
        disabled_buftypes = { 'quickfix', 'prompt' },
        component_separators = '',
        section_separators = '', --{ left = '', right = '' },
      },
      winbar = {
        lualine_b = { 'buffers' },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return 'λ ' .. str
            end,
            separator = { right = '' },
          },
        },
        lualine_b = {
          {
            'filename',
            fmt = function(str)
              return '󰧱 ' .. str
            end,
            separator = { right = '' },
          },
        },
        lualine_c = {
          { 'diagnostics' },
          {
            'searchcount',
            maxcount = 999,
            timeout = 500,
          },
        },
        lualine_x = {
          { 'diff' },
        },
        lualine_y = {
          { 'branch', separator = { left = '' } },
        },
        lualine_z = {
          { 'encoding', separator = { left = '' } },
        },
      },
      extensions = { 'nvim-tree', 'lazy', 'mason' },
      inactive_winbar = {
        lualine_c = { 'filename' },
      },
    }
  end,
}
