vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank {
      higroup = 'YankHighlight',
      timeout = 200,
    }
  end,
})

vim.api.nvim_create_user_command('VsCoqPanels', function()
  vim.cmd 'VsCoq panels'

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.bo[buf].filetype

    if ft == 'coq' then
      vim.api.nvim_win_set_width(win, 70)
    end

    if ft == 'coq-goals' then
      vim.api.nvim_win_set_height(win, 18)
    end
  end
end, {})
