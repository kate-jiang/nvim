return {
  'rcarriga/nvim-dap-ui',
  enabled = false,
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  lazy = true,
  config = function()
    require('dapui').setup {
      controls = {
        element = 'repl',
        enabled = true,
      },
      floating = {
        border = 'single',
        mappings = {
          close = { 'q', '<Esc>' },
        },
      },
      icons = { collapsed = '', expanded = '', current_frame = '' },
      layouts = {
        {
          elements = {
            { id = 'console', size = 1.0 },
          },
          position = 'bottom',
          size = 10,
        },
      },
    }

    local dap, dapui = require 'dap', require 'dapui'

    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end
  end,
}
