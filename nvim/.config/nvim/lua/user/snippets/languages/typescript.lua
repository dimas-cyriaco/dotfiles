local ls = require "luasnip"
local fmt = require "luasnip.extras.fmt".fmt
local s = ls.s
local i = ls.insert_node

ls.snippets = {
  typescript = {
    ls.parser.parse_snippet( "eas", [[expect.any(String)]]),
    ls.parser.parse_snippet( "eao", [[expect.any(Object)]]),
    ls.parser.parse_snippet( "eoc", [[expect.objectContaining($0)]]),
    ls.parser.parse_snippet( "eac", [[expect.arrayContaining($0)]]),

    s(
      "des",
      fmt([[
describe('{}', () => {{
  {}
}})
      ]], { i(1), i(2)})
    ),

    ls.parser.parse_snippet(
      "it",
[[
it('$1', async () => {
  $0
})
]]
    ),

    ls.parser.parse_snippet( "cns", "const $1 = $0")
  },
}
