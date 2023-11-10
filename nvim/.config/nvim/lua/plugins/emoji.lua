return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji" },
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    ---@diagnostic disable-next-line: undefined-global
    local cmp = require("cmp")
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
  end,
}
