return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '┃' },
      change = { text = '┋' },
      delete = { text = '_' },
      topdelete = { text = '┃' },
      changedelete = { text = '┋' },
    },
    signs_staged = {
      add = { text = '┃' },
      change = { text = '┋' },
      delete = { text = '_' },
      topdelete = { text = '┃' },
      changedelete = { text = '┋' },
    },
    current_line_blame = true,
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      local function get_repo_url()
        local handle = io.popen 'git config --get remote.origin.url'
        if handle then
          local url = handle:read '*a'
          handle:close()
          if url ~= '' then
            return url:gsub('\n', ''):gsub('git@(.+):', 'https://%1/'):gsub('%.git$', '')
          end
        end
        return nil
      end

      local function open_commit_link()
        local repo_url = get_repo_url()
        if not repo_url then
          vim.notify('Repository URL not found', vim.log.levels.ERROR)
          return
        end

        -- Get blame info for the current line
        gitsigns.blame_line {
          full = true,
          callback = function(blame_info)
            if blame_info and blame_info.sha and blame_info.sha ~= '0000000000000000000000000000000000000000' then
              local commit_sha = blame_info.sha
              local commit_url = string.format('%s/commit/%s', repo_url, commit_sha)
              -- Open the link in the browser
              vim.notify('Opening commit: ' .. commit_url, vim.log.levels.INFO)
              os.execute(string.format('xdg-open "%s"', commit_url)) -- Replace with 'open' on macOS
            else
              vim.notify('No commit information available for this line', vim.log.levels.WARN)
            end
          end,
        }
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next git [c]hange' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous git [c]hange' })

      vim.keymap.set('n', '<leader>go', open_commit_link, { buffer = bufnr, desc = 'Open commit link on GitHub' })

      -- Blame in floating window
      map('n', '<leader>gb', gitsigns.blame_line, { desc = 'Show git blame in floating window' })

      -- Visual mode
      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'stage git hunk' })
      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'reset git hunk' })
      -- Normal mode
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
      map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
    end,
  },
}
