return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  ft = { "typescript", "lua" },
  config = function()
    require("ufo").setup({
      open_fold_hl_timeout = 500,
      enable_get_fold_virt_text = true,
      preview = {},
      close_fold_kinds_for_ft = {
        default = { 'imports' },
        c = { 'comment', 'region' }
      },
    })
  end,
}
