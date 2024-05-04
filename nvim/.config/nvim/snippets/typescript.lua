local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node
-- local t = ls.text_node
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node

return {
  s(
    { name = "anonymous function", trig = "nf" },
    fmt('({}){} => {{\n\t{}\n}}', {
      i(1),
      i(2),
      i(3),
    })
  ),
  s(
    { name = "async anonymous function", trig = "nfa" },
    fmt('async ({}): Promise<{}> => {{\n\t{}\n}}', {
      i(1),
      i(2),
      i(3),
    })
  ),
  s(
    { name = "describe", trig = "nd" },
    fmt('describe("{}", () => {{\n\t{}\n}})', {
      i(1),
      i(2),
    })
  ),
  s(
    { name = "it", trig = "nit" },
    fmt('it("{}", async () => {{\n\t{}\n}})', {
      i(1),
      i(2),
    })
  ),
  s(
    { name = "import", trig = "nim" },
    fmt('import {{ {} }} from "{}"', {
      i(1),
      i(2),
    })
  ),
  s(
    { name = "import default", trig = "nid" },
    fmt('import {} from "{}"', {
      i(1),
      i(2),
    })
  ),
}, {}
