return {
  "mfussenegger/nvim-lint",
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      -- javascript = { "cspell" },
      -- typescript = { "cspell" },
      -- sh = { "shellcheck" },
      -- zsh = { "shellcheck" },
      dockerfile = { "hadolint" },
      -- gotmpl = { "djlint" },
    },
  },
}
