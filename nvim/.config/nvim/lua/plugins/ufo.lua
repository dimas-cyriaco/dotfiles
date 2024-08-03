--   "kevinhwang91/nvim-ufo",
--   dependencies = { "kevinhwang91/promise-async" },
--   ft = { "typescript", "lua" },
--   config = function()
--     require("ufo").setup({
--       open_fold_hl_timeout = 500,
--       enable_get_fold_virt_text = true,
--       preview = {},
--       close_fold_kinds_for_ft = {
--         default = { 'imports' },
--         c = { 'comment', 'region' }
--       },
--     })
--   end,
-- }
return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    {
      "luukvbaal/statuscol.nvim",
      opts = function()
        local builtin = require("statuscol.builtin")
        return {
          relculright = true,
          ft_ignore = {
            "DiffviewFiles",
            "dashboard",
            "NvimTree",
            "neo-tree",
            "Outline",
            "Trouble",
          },
          segments = {
            { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            { text = { "%s" }, click = "v:lua.ScSa" },
          },
        }
      end,
    },
  },
  event = "LazyFile",
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
    for _, ls in ipairs(language_servers) do
      require("lspconfig")[ls].setup({
        capabilities = capabilities,
        -- you can add other fields for setting up lsp server in this table
      })
    end

    require("ufo").setup({
      open_fold_hl_timeout = 500,
      enable_get_fold_virt_text = true,
      preview = {},
      close_fold_kinds_for_ft = {
        default = { "imports" },
        c = { "comment", "region" },
      },
    })
  end,
}
