local formatters = require("lvim.lsp.null-ls.formatters")
-- formatters.setup {
--   {
--     exe = "prettier",
--     filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
--   },
-- }

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ exe = "xo", filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" } },
})
