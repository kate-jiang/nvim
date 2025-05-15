return {
  'github/copilot.vim',
  -- enabled = false,
  config = function()
    -- Use fnm to get path to Node 20
    local handle = io.popen 'fnm exec --using=20 which node'
    if handle then
      local node_path = handle:read '*a'
      handle:close()

      -- Remove trailing whitespace/newline
      node_path = node_path:gsub('^%s*(.-)%s*$', '%1')

      -- Set the Node.js host path for Copilot
      if node_path ~= '' then
        vim.g.copilot_node_command = node_path
      end
    end
  end,
}
