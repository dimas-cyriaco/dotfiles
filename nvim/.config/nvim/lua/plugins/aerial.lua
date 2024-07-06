-- return {}
return {
  "stevearc/aerial.nvim",
  opts = function()
    local opts = {
      filter_kind = {
        "Class",
        "Constant",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Key",
        "Module",
        "Method",
        "Struct",
      },
    }
    return opts
  end,
}
