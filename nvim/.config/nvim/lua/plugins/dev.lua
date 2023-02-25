function P(value)
  print(vim.inspect(value))
end

local function reload_package(...)
  return require("plenary.reload").reload_module(...)
end

function R(name)
  reload_package(name)
  return require(name)
end

return {}
