local success, toggleterm = pcall(require, "toggleterm")
if not success then
  return
end

toggleterm.setup{
  open_mapping = [[<c-t>]],
  direction = 'float',
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.5
    end
  end
}

local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local test_terminal = Terminal:new({ hidden = true, direction = 'vertical' })
function _TEST_TERM_TOGGLE()
  test_terminal:toggle()
end
