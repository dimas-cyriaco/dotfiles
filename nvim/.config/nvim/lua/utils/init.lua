local utils = {}

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

function utils.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local map_default_options = {noremap = true, silent = true}

-- TODO: Unificar essas duas funções. Receber opt `local` para definer qual
-- método chamar.
function utils.map(lhs, rhs, opts)
  local options = map_default_options
  local mode = removeKey(opts, 'mode', 'n')
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.map_local(buffer_number, lhs, rhs, opts)
  local options = map_default_options
  local mode = removeKey(opts, 'mode', 'n')
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_buf_set_keymap(buffer_number, mode, lhs, rhs, options)
end

function utils.debug(object)
  print(vim.inspect(opts))
end

function removeKey(table, key, default)
  if not table then return default end

  local element = table[key]

  if not element then return default end

  table[key] = nil

  return element
end

return utils

