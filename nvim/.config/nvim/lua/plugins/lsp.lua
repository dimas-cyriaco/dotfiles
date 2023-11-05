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
              -- https://community.languagetool.org/rule/list?lang=en
              -- disabledRules = {
              --   ["en-GB"] = { "TOO_LONG_SENTENCE", "OXFORD_SPELLING_Z_NOT_S", "DASH_RULE" },
              --   fr = { "APOS_TYP", "FRENCH_WHITESPACE", "FR_SPELLING_RULE", "COMMA_PARENTHESIS_WHITESPACE" },
              -- },
            },
          },
        },
      },
    },
  },
}
