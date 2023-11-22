return {
  {
    "ngalaiko/tree-sitter-go-template",
    ft = { "gotmpl" },
    config = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.gotmpl = {
        install_info = {
          url = "https://github.com/ngalaiko/tree-sitter-go-template",
          files = { "src/parser.c" },
        },
        filetype = "gotmpl",
        used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "html" },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "diff",
        "dockerfile",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "norg",
        "sql",
        "typescript",
        -- "yaml",
      },
    },
  },
}
