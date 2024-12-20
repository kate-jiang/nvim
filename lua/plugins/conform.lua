return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true, objc = true, objcpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters = {
      prettier = {
        args = function()
          -- Retrieve Vim's indentation settings
          local expandtab = vim.api.nvim_get_option_value('expandtab', { scope = 'local' })
          local shiftwidth = vim.api.nvim_get_option_value('shiftwidth', { scope = 'local' })
          local tabstop = vim.api.nvim_get_option_value('tabstop', { scope = 'local' })

          -- Configure Prettier arguments based on Vim's settings
          local args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }
          if expandtab then
            table.insert(args, '--use-tabs=false')
            table.insert(args, '--tab-width=' .. shiftwidth)
          else
            table.insert(args, '--use-tabs=true')
            table.insert(args, '--tab-width=' .. tabstop)
          end
          return args
        end,
        stdin = true,
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}
