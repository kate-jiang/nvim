return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('telescope').setup {
      defaults = {
        theme = 'ivy',
        file_ignore_patterns = { '%.DS_Store', '%.git/', 'node_modules' },
        mappings = {
          i = {
            ['<C-j>'] = 'move_selection_next',
            ['<C-k>'] = 'move_selection_previous',
            ['<C-d>'] = 'delete_buffer',
            ['<esc>'] = 'close',
          },
        },
      },
      pickers = {
        find_files = {
          theme = 'dropdown',
          previewer = false,
          hidden = true,
        },
        help_tags = {
          theme = 'ivy',
          previewer = true,
        },
        keymaps = {
          theme = 'ivy',
        },
        live_grep = {
          theme = 'ivy',
          previewer = true,
          disable_coordinates = true,
        },
        grep_string = {
          theme = 'ivy',
          previewer = true,
          show_line = false,
        },
        lsp_references = {
          theme = 'ivy',
          previewer = true,
          show_line = false,
        },
        buffers = {
          theme = 'ivy',
          previewer = true,
          initial_mode = 'insert',
          sort_mru = true,
          sort_lastused = true,
          -- ignore_current_buffer = true,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    local map = vim.keymap.set

    map('n', '<leader>sh', builtin.help_tags, { desc = 'Search help' })
    map('n', '<leader>sk', builtin.keymaps, { desc = 'Search keymaps' })
    map('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
    map('n', '<leader>ss', builtin.builtin, { desc = 'Search telescope' })
    map('n', '<leader>fw', builtin.grep_string, { desc = 'Find word' })
    map('n', '<leader>sg', builtin.live_grep, { desc = 'Search with grep' })
    map('n', '<leader>sd', builtin.diagnostics, { desc = 'Search diagnostics' })
    map('n', '<leader>sr', builtin.resume, { desc = 'Search resume' })
    map('n', '<leader><leader>', builtin.buffers, { desc = 'Find buffers' })
    map('n', '<leader>sad', '<cmd>Autosession delete<CR>', { desc = 'Delete sessions' })
    map('n', '<leader>sas', '<cmd>Autosession search<CR>', { desc = 'Search sessions' })

    map('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
      })
    end, { desc = 'Fuzzy search buffer' })

    map('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = 'Search open files' })

    map('n', '<leader>sn', function()
      builtin.live_grep { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Search nvim files' })
  end,
}
