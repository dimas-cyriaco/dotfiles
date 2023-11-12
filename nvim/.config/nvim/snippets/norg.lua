local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

return {
  s(
    { name = "external link", trig = "el" },
    { t("{:"), i(1, "file"), t(":"), i(2), t("}["), i(3, "description"), t("]"), i(0) }
  ),
}, {}
