return {
  "theprimeagen/harpoon",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    local map = vim.keymap.set

    map("n", "<leader>a", mark.add_file, { desc = "[A]dd to harpoon" })
    map("n", "<leader><CR>", ui.toggle_quick_menu, { desc = "Toggle harpoon" })
  end,
}
