return {
  -- was goofing with ruff.. got dup messages
  -- handlers = {
  --   ['textDocument/publishDiagnostics'] = function() end,
  -- },
  settings = {
    pyright = {
      -- disableLanguageServices = false,
      disableOrganizeImports = true, -- using ruff
    },
    python = {
      analysis = {
        -- ignore = { '*' },
        logLevel = 'Information',
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = 'workspace',
        typeCheckingMode = 'off',
        useLibraryCodeForTypes = true,
      },
    },
  },
}
