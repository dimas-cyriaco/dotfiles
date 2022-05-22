local success, _ = pcall(require, "nvim-lightbulb")
if not success then
	vim.notify("Unable to load nvim-lightbulb")
	return
end

vim.api.nvim_create_augroup('lightbulb_config',  { clear = true })

vim.api.nvim_create_autocmd('CursorHold,CursorHoldI', {
  group = 'packer_user_config',
  pattern = '*',
  callback = require'nvim-lightbulb'.update_lightbulb
})
