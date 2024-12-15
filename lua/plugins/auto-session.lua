return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore = true,
      auto_save = true,
      suppressed_dirs = { "~/Downloads", "~/Documents", "~/Desktop" },
    })
  end,
}
