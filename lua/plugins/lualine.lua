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
        section_separators = { left = '', right = '' },
      },
      tabline = {
        lualine_b = {
          {
            'buffers',
            section_separators = { left = '', right = '' },
            icons_enabled = false,
            max_length = vim.o.columns - 3,
            use_mode_colors = true,
          },
        },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return 'λ ' .. str
            end,
          },
        },
        lualine_b = {
          {
            'filename',
            path = 1,
            fmt = function(str)
              return '󰧱 ' .. str
            end,
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
          { 'branch' },
        },
        lualine_z = {
          { 'filesize' },
          { 'encoding' },
        },
      },
      extensions = { 'nvim-tree', 'lazy', 'mason' },
      inactive_tabline = {
        lualine_c = { 'filename' },
      },
    }
  end,
}
