local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.s
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node

local typescript_snippets = {
	ls.parser.parse_snippet("eas", [[expect.any(String)]]),
	ls.parser.parse_snippet("eao", [[expect.any(Object)]]),
	ls.parser.parse_snippet("eoc", [[expect.objectContaining($0)]]),
	ls.parser.parse_snippet("eac", [[expect.arrayContaining($0)]]),
	ls.parser.parse_snippet("cl", [[console.log($0)]]),

	s(
		"ea",
		fmt(
			[[
          expect.any({})
        ]],
			{ c(1, { t("String"), t("Object") }) }
		)
	),

	s(
		"des",
		fmt(
			[[
          describe('{}', () => {{
            {}
          }})
        ]],
			{ i(1), i(2) }
		)
	),

	ls.parser.parse_snippet(
		"it",
		[[
        it('$1', async () => {
          $0
        })
      ]]
	),

	ls.parser.parse_snippet("cns", "const $1 = $0"),
}

ls.snippets = {
	typescript = typescript_snippets,
	typescriptreact = typescript_snippets,
	javascript = typescript_snippets,
	javascriptreact = typescript_snippets,
}
