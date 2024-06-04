local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node

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
    { name = "expect to equal", trig = "ete" },
    fmt('expect({}).toEqual({})', {
      i(1),
      i(2),
    })
  ),
  s(
    { name = "expect to match object", trig = "emo" },
    fmt('expect({}).toMatchObject({})', {
      i(1),
      i(2),
    })
  ),
  s(
    { name = "faker person fullname", trig = "fpf" },
    fmt('faker.person.fullName()', {})
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
    fmt([[
    it("{}", async () => {{
      // Arrange

      {}

      // Act


      // Assert

    }})
    ]], {
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
}
