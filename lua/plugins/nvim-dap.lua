return {
  'mfussenegger/nvim-dap',
  enabled = false,
  dependencies = {
    'wojciech-kulik/xcodebuild.nvim',
  },
  config = function()
    local codelldbPath = os.getenv 'HOME' .. '/dev/tools/codelldb/extension/adapter/codelldb'
    require('xcodebuild.integrations.dap').setup(codelldbPath)
  end,
}
