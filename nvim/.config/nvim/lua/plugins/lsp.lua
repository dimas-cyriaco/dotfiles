---@diagnostic disable: missing-fields, undefined-global

local paths = {
  vim.fn.stdpath("config") .. "/spell/ltex.dictionary.pt-BR.txt",
}

local words = {}
for _, path in ipairs(paths) do
  local f = io.open(path)
  if f then
    for word in f:lines() do
      table.insert(words, word)
    end
    f:close()
  end
end

return {
  {
    "hinell/lsp-timeout.nvim",
    event = "LazyFile", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "Wansmer/symbol-usage.nvim",
    event = "LazyFile", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function()
      require("symbol-usage").setup({
        ---@type 'above'|'end_of_line'|'textwidth' above by default
        vt_position = "end_of_line",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = {
        enabled = true,
      },
      servers = {
        ltex = {
          settings = {
            -- https://valentjn.github.io/ltex/settings.html
            ltex = {
              language = "pt-BR",
              additionalRules = {
                enablePickyRules = true,
                motherTongue = "pt-BR",
              },
              dictionary = {
                ["pt-BR"] = words,
              },
            },
          },
        },
      },
    },
  },
}
