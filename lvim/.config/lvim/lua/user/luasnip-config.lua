local ls = require "luasnip"
local types = require "luasnip.util.types"

vim.keymap.set({ "i", "s" }, "<c-l>", function ()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-h>", function ()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<c-k>", function ()
  if ls.choice_active() then
    ls.change_choice()
  end
end, { silent = true })

ls.config.set_config {
  history = true,

  updateevents = "TextChanged,TextChangedI",

  enable_autosnippets = true,

  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  },
}

lvim.builtin.which_key.mappings["S"] = {
  name = "+LuaSnip",
  r = { "<cmd>source ~/.config/lvim/lua/user/snippets.lua<cr>", "Reload Snippets" },
}
