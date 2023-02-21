local actions = require("telescope.actions")
local telescopeConfig = require("telescope.config")

local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    keys = {
      { "<leader>se", "Telescope symbols", desc = "Find Emoji" },
    },
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
      vimgrep_arguments = vimgrep_arguments,
    },
    pickers = {
      find_files = {
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
    },
  },
}
