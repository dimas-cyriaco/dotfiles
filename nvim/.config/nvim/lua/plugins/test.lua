return {
  "David-Kunz/jester",
  keys = {
    {
      "<leader>tt",
      function()
        require("jester").run()
      end,
      desc = "Run nearest test",
    },
    {
      "<leader>tf",
      function()
        require("jester").run_file()
      end,
      desc = "Run file",
    },
    {
      "<leader>tl",
      function()
        require("jester").run_last()
      end,
      desc = "Watch last test",
    },
    {
      "<leader>tw",
      function()
        require("jester").run_file({ path_to_jest_run = "ipnpm jest --watchAll" })
      end,
      desc = "Watch file",
    },
    {
      "<leader>tW",
      function()
        require("jester").run({ path_to_jest_run = "ipnpm jest --watchAll" })
      end,
      desc = "Watch nearest test",
    },
  },
  config = function()
    require("jester").setup({
      path_to_jest_run = "ipnpm jest",
    })
  end,
}
