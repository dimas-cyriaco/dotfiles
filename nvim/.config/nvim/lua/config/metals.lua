vim.cmd [[augroup lsp]]
vim.cmd [[au!]]
vim.cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach({})]]
vim.cmd [[augroup end]]
