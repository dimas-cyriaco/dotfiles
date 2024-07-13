return {
  "mei28/qfc.nvim",
  event = "LazyFile",
  config = function()
    require("qfc").setup({
      timeout = 3000, -- Timeout setting in milliseconds
      enabled = true, -- Enable/disable autoclose feature
    })
    -- ft = 'qf', -- for lazy load
    -- cmd = {'QFC'} -- for lazy load
  end,
}
