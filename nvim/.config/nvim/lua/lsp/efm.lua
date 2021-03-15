local lspconfig = require "lspconfig"

local eslint = {
  lintCommand = "eslint -f unix",
  lintStdin = false,
  lintIgnoreExitCode = true,
}

lspconfig.efm.setup {
  settings = {
    rootMarkers = {".git/"},
    init_options = {documentFormatting = true},
    languages = {
      javascript = {eslint},
      javascriptreact = {eslint},
      typescript = {eslint},
      typescriptreact = {eslint}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  },
}

