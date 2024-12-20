local state = {
  floating = {
    buf = -1,
    win = -1,
  },
  small = {
    buf = -1,
    win = -1,
  },
}

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  -- Calculate position
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Handle buffer
  local buf = opts.buf
  if buf == -1 or not (buf and vim.api.nvim_buf_is_valid(buf)) then
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded',
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

local function create_horizontal_split(opts)
  opts = opts or {}
  local height = opts.height or math.floor(vim.o.lines * 0.25)

  local buf = opts.buf
  if buf == -1 or not (buf and vim.api.nvim_buf_is_valid(buf)) then
    buf = vim.api.nvim_create_buf(false, true)
  end

  -- Create bottom horizontal split
  vim.cmd('botright ' .. height .. 'split')
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win, buf)

  return { buf = buf, win = win }
end

local function toggle_terminal(opts, term_state, create_window)
  -- If the existing window is not valid, create a new one
  if not (term_state.win ~= -1 and vim.api.nvim_win_is_valid(term_state.win)) then
    local new_state = create_window {
      buf = term_state.buf,
      width = opts.width,
      height = opts.height,
      position = opts.position,
    }
    term_state.buf = new_state.buf
    term_state.win = new_state.win
    if vim.bo[term_state.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
      vim.api.nvim_feedkeys('i', 'n', true)
    end
  else
    -- Hide the existing window
    vim.api.nvim_win_hide(term_state.win)
    term_state.win = -1
  end
  return term_state
end

vim.api.nvim_create_user_command('FloatingTerminal', function()
  state.floating = toggle_terminal({}, state.floating, create_floating_window)
end, {})

vim.api.nvim_create_user_command('SmallTerminal', function()
  state.small = toggle_terminal({ height = math.floor(vim.o.lines * 0.25) }, state.small, create_horizontal_split)
end, {})

local map = vim.keymap.set
map('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Escape terminal mode' })
map('n', '<leader>j', ':SmallTerminal<CR>', { desc = 'Open SmallTerminal' })
map('n', '<leader><tab>', ':FloatingTerminal<CR>', { desc = 'Open FloatingTerminal' })
