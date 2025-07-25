local api = vim.api

-- don't comment newlines
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- restore session on init
api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("persistence").load()
    vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  end,
})

-- open file to last location
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = api.nvim_buf_get_mark(0, '"')
    local lcount = api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- highlight on yank
api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank {
      higroup = 'YankHighlight',
    }
  end,
})

-- lsp
api.nvim_create_autocmd("LspAttach", {
  group = api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    -- defaults:
    -- https://neovim.io/doc/user/news-0.11.html#_defaults

    map("gd", vim.lsp.buf.definition, "Definitions")
    map("gr", vim.lsp.buf.references, "References")
    map("grn", vim.lsp.buf.rename, "Rename")
    map("gi", vim.lsp.buf.implementation, "Implementation")
    map("gs", vim.lsp.buf.signature_help, "Signature")
    map("gD", vim.lsp.buf.declaration, "Declaration")
    map("K", vim.lsp.buf.hover, "Hover Documentation")
    map("<leader>,", vim.diagnostic.open_float, "Diagnostics")
    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")

    local function client_supports_method(client, method, bufnr)
      if vim.fn.has 'nvim-0.11' == 1 then
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, { bufnr = bufnr })
      end
    end

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = api.nvim_create_augroup('lsp-highlight', { clear = false })

      -- When cursor stops moving: Highlights all instances of the symbol under the cursor
      -- When cursor moves: Clears the highlighting
      api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      -- When LSP detaches: Clears the highlighting
      api.nvim_create_autocmd('LspDetach', {
        group = api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        end,
      })
    end
  end,

})
