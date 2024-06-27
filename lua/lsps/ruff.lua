return {
  cmd_env = { RUFF_TRACE = "messages" },
  settings = {
    logLevel = "warning",
    logFile = "~/.local/state/nvim/ruff.log",
    args = {
      check = {
      "--fix-only",
      "--watch",
      },
    },
  },
}
