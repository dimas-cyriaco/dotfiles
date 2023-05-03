if true then return {} end

return {
  {
    "habamax/vim-godot",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require 'lspconfig'.gdscript.setup {}
    end,
  },
}
