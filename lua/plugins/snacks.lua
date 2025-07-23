---@module "snacks"
return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      width = 60,
      row = nil,                                                                   -- dashboard position. nil for center
      col = nil,                                                                   -- dashboard position. nil for center
      pane_gap = 4,                                                                -- empty columns between vertical panes
      autokeys = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
        -- Used by the `header` section
        header = '',
      },
      -- item field formatters
      formats = {
        icon = function(item)
          if item.file and item.icon == 'file' or item.icon == 'directory' then
            return M.icon(item.file, item.icon)
          end
          return { item.icon, width = 2, hl = 'icon' }
        end,
        footer = { '%s', align = 'center' },
        header = { '%s', align = 'center' },
        file = function(item, ctx)
          local fname = vim.fn.fnamemodify(item.file, ':~')
          fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
          if #fname > ctx.width then
            local dir = vim.fn.fnamemodify(fname, ':h')
            local file = vim.fn.fnamemodify(fname, ':t')
            if dir and file then
              file = file:sub(-(ctx.width - #dir - 2))
              fname = dir .. '/…' .. file
            end
          end
          local dir, file = fname:match '^(.*)/(.+)$'
          return dir and { { dir .. '/', hl = 'dir' }, { file, hl = 'file' } } or { { fname, hl = 'file' } }
        end,
      },
      sections = {
        { section = 'header' },
        { section = 'keys',   gap = 1, padding = 1 },
        { section = 'startup' },
      },
    },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = {
      enabled = true,
      win = {
        style = {
          width = vim.o.columns,
          height = vim.o.lines - 1,
        },
      },
    },
    notifier = { enabled = true, style = 'compact' },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scratch = { enabled = true },
    statuscolumn = { enabled = true, left = { 'sign', 'git' }, right = { 'fold', 'mark' } },
    words = { enabled = true },
  },
  keys = {
    {
      '<leader>lg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>t',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },
    {
      '<leader>gb',
      function()
        Snacks.git.blame_line()
      end,
      desc = 'Git Blame Line',
    },
    {
      '<leader>go',
      function()
        Snacks.gitbrowse { what = 'commit' }
      end,
      desc = 'Open Commit in Browser',
      mode = { 'n', 'v' },
    },
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Scratch Buffer',
      mode = { 'n', 'v' },
    },
    { "<leader>p",       function() Snacks.picker.smart() end,                 desc = "Smart Find Files" },
    { "<leader><space>", function() Snacks.picker.buffers() end,               desc = "Buffers" },
    { "<leader>:",       function() Snacks.picker.command_history() end,       desc = "Command History" },
    { "<leader>e",       function() Snacks.explorer() end,                     desc = "File Explorer" },
    -- find
    { "<leader>ff",      function() Snacks.picker.files() end,                 desc = "Find Files" },
    { "<leader>fp",      function() Snacks.picker.projects() end,              desc = "Projects" },
    { "<leader>fr",      function() Snacks.picker.recent() end,                desc = "Recent" },
    -- git
    { "<leader>gl",      function() Snacks.picker.git_log() end,               desc = "Git Log" },
    { "<leader>gL",      function() Snacks.picker.git_log_line() end,          desc = "Git Log Line" },
    { "<leader>gs",      function() Snacks.picker.git_status() end,            desc = "Git Status" },
    { "<leader>gd",      function() Snacks.picker.git_diff() end,              desc = "Git Diff (Hunks)" },
    { "<leader>gf",      function() Snacks.picker.git_log_file() end,          desc = "Git Log File" },
    -- Grep
    { "<leader>sB",      function() Snacks.picker.grep_buffers() end,          desc = "Grep Open Buffers" },
    { "<leader>sg",      function() Snacks.picker.grep() end,                  desc = "Grep" },
    { "<leader>fw",      function() Snacks.picker.grep_word() end,             desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { '<leader>s"',      function() Snacks.picker.registers() end,             desc = "Registers" },
    { '<leader>s/',      function() Snacks.picker.search_history() end,        desc = "Search History" },
    { "<leader>sa",      function() Snacks.picker.autocmds() end,              desc = "Autocmds" },
    { "<leader>sb",      function() Snacks.picker.lines() end,                 desc = "Buffer Lines" },
    { "<leader>sc",      function() Snacks.picker.command_history() end,       desc = "Command History" },
    { "<leader>sC",      function() Snacks.picker.commands() end,              desc = "Commands" },
    { "<leader>sd",      function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
    { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics" },
    { "<leader>sh",      function() Snacks.picker.help() end,                  desc = "Help Pages" },
    { "<leader>sH",      function() Snacks.picker.highlights() end,            desc = "Highlights" },
    { "<leader>si",      function() Snacks.picker.icons() end,                 desc = "Icons" },
    { "<leader>sj",      function() Snacks.picker.jumps() end,                 desc = "Jumps" },
    { "<leader>sk",      function() Snacks.picker.keymaps() end,               desc = "Keymaps" },
    { "<leader>sl",      function() Snacks.picker.loclist() end,               desc = "Location List" },
    { "<leader>sm",      function() Snacks.picker.marks() end,                 desc = "Marks" },
    { "<leader>sM",      function() Snacks.picker.man() end,                   desc = "Man Pages" },
    { "<leader>sp",      function() Snacks.picker.lazy() end,                  desc = "Search for Plugin Spec" },
    { "<leader>sq",      function() Snacks.picker.qflist() end,                desc = "Quickfix List" },
    { "<leader>sR",      function() Snacks.picker.resume() end,                desc = "Resume" },
    { "<leader>su",      function() Snacks.picker.undo() end,                  desc = "Undo History" },
    { "<leader>uC",      function() Snacks.picker.colorschemes() end,          desc = "Colorschemes" },
    -- LSP
    { "gd",              function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
    { "gD",              function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
    { "gr",              function() Snacks.picker.lsp_references() end,        nowait = true,                     desc = "References" },
    { "gI",              function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
    { "gy",              function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
    { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
    { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  }
}
