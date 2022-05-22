local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
	return
end

local types = require("luasnip.util.types")

vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-h>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end, { silent = true })

vim.keymap.set("i", "<c-k>", function()
	if luasnip.choice_active() then
		luasnip.change_choice()
	end
end, { silent = true })

luasnip.config.set_config({
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
})

-- lvim.builtin.which_key.mappings["S"] = {
--   name = "+LuaSnip",
--   r = { "<cmd>source ~/.config/lvim/lua/user/snippets.lua<cr>", "Reload Snippets" },
-- }

require("user.snippets.languages.typescript")
require("user.snippets.languages.lua")
