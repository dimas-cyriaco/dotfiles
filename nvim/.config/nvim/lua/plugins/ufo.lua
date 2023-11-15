-- vim.cmd([[hi! link Folded CursorLine]])

return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  ft = { "typescript" },
  -- config = {
  --   close_fold_kinds = { "imports" },
  -- },
  config = function()
    require("ufo").setup({
      close_fold_kinds = { "imports" },
    })

    vim.cmd([[hi! link Folded CursorLine]])

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
      pattern = { "*.norg" },
      callback = function()
        local ok, ufo = pcall(require, "ufo")

        if ok then
          if ufo.hasAttached() then
            ufo.detach()
          end
        end
      end,
    })
  end,
}
