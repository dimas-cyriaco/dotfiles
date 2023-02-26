local actions = require("telescope.actions")
local telescopeConfig = require("telescope.config")

local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
  },
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
  keys = {
    { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo history" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        undo = {
          use_delta = true
          -- telescope-undo.nvim config, see below
        },
      },
    })
    require("telescope").load_extension("undo")
    -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
  end
}
