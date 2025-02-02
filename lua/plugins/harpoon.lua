return {
  'theprimeagen/harpoon',
  config = function()
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'
    local map = vim.keymap.set

    map('n', '<leader>a', mark.add_file, { desc = 'Mark in harpoon' })
    map('n', '<leader>o', ui.toggle_quick_menu, { desc = 'Toggle harpoon' })

    map('n', '<C-S-n>', function()
      ui.nav_file(1)
    end, { desc = 'Harpoon 1' })

    map('n', '<C-S-e>', function()
      ui.nav_file(2)
    end, { desc = 'Harpoon 2' })

    map('n', '<C-S-i>', function()
      ui.nav_file(3)
    end, { desc = 'Harpoon 3' })

    map('n', '<C-S-o>', function()
      ui.nav_file(4)
    end, { desc = 'Harpoon 4' })
  end,
}
