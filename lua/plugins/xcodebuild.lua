return {
  'wojciech-kulik/xcodebuild.nvim',
  enabled = false,
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('xcodebuild').setup {
      code_coverage = {
        enabled = true,
      },
    }

    local function toggle_dapui_and_run(command)
      return function()
        require('dapui').toggle()
        vim.cmd(command)
      end
    end

    vim.keymap.set('n', '<leader>xl', '<cmd>XcodebuildToggleLogs<cr>', { desc = '[L]ogs' })
    vim.keymap.set('n', '<leader>xb', toggle_dapui_and_run 'XcodebuildBuildRun', { desc = '[B]uild & Run Project' })
    vim.keymap.set('n', '<leader>xr', toggle_dapui_and_run 'XcodebuildRun', { desc = '[R]un without building' })
    vim.keymap.set('n', '<leader>xx', '<cmd>XcodebuildPicker<cr>', { desc = '[X]codebuild Actions' })
    vim.keymap.set('n', '<leader>xd', '<cmd>XcodebuildSelectDevice<cr>', { desc = 'Select [D]evice' })
  end,
}
