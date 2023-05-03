local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
  },
  keys = {
    { "<leader>se", "<cmd>Telescope symbols<cr>", desc = "Find Emoji" },
    { "<leader>fu", "<cmd>Telescope undo<cr>",    desc = "Undo history" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        buffers = {
          mappings = {
            i = {
              ['<C-d>'] = actions.delete_buffer,
            },
            n = {
              ['<C-d>'] = actions.delete_buffer,
            },
          },
        }
      },
      extensions = {
        undo = {
          use_delta = true
        },
      },
    })
    require("telescope").load_extension("undo")
  end
}
