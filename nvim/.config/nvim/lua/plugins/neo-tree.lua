return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    enable_normal_mode_for_inputs = false,
    source_selector = {
      sources = {
        { source = "filesystem" },
        { source = "git_status" },
        { source = "buffers" },
        { source = "document_symbols" },
      },
    },
    window = {
      mappings = {
        ["e"] = nil, -- disable auto expand; it doesn't work with edgy
        ["<tab>"] = "toggle_node",
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        never_show = {
          ".DS_Store",
          ".git",
        },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
    },
    document_symbols = {
      follow_cursor = true,
      renderers = {
        symbol = {
          { "indent", with_expanders = true },
          { "kind_icon", default = "?" },
          { "name", zindex = 10 },
        },
      },
    },
  },
}
