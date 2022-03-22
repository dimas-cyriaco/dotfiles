local success, nvim_tree = pcall(require, "nvim-tree")
if not success then
	return
end

nvim_tree.setup({
	hide_root_folder = true,
	update_focused_file = {
		enable = true,
	},
})

vim.cmd([[let g:nvim_tree_group_empty = 1]])
