return {
  settings = {
    pyright = {
      -- disableLanguageServices = false,
      disableOrganizeImports = true, -- using ruff
      autoImportCompletions = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
        -- logLevel = 'Information',
        -- autoImportCompletions = true,
        -- autoSearchPaths = true,
        -- diagnosticMode = 'workspace',
        -- typeCheckingMode = 'off',
        -- useLibraryCodeForTypes = true,
      },
    },
  },
}
