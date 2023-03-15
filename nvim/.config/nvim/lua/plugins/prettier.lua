return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        tsserver = function(_, opts)
          require("lazyvim.util").on_attach(function(client)
            if client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            end
          end)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
      },
    },
  },
}
