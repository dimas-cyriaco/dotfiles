return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    buffers = {
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --              -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
      group_empty_dirs = true, -- when true, empty folders will be grouped together
      show_unloaded = true,
      window = {
        mappings = {
          ["d"] = "buffer_delete",
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
          ["oc"] = { "order_by_created", nowait = false },
          ["od"] = { "order_by_diagnostics", nowait = false },
          ["om"] = { "order_by_modified", nowait = false },
          ["on"] = { "order_by_name", nowait = false },
          ["os"] = { "order_by_size", nowait = false },
          ["ot"] = { "order_by_type", nowait = false },
        },
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
    enable_normal_mode_for_inputs = true,
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        never_show = {
          ".DS_Store",
          ".git",
          ".idea",
          ".next",
          ".turbo",
          ".vscode",
          "node_modules",
          "dist",
          "coverage",
          "tmp",
        },
      },
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      -- follow_current_file = {
      --   enabled = true,
      --   leave_dirs_open = true,
      -- },
      bind_to_cwd = false,
      group_empty_dirs = false,
    },
    popup_border_style = "rounded",
    sources = { "filesystem", "buffers", "document_symbols", "git_status" },
    source_selector = {
      sources = {
        { source = "filesystem" },
        { source = "buffers" },
        { source = "document_symbols" },
        { source = "git_status" },
      },
    },
    sort_case_insensitive = true,
    window = {
      position = "float",
      mappings = {
        ["e"] = nil, -- disable auto expand; it doesn't work with edgy
        ["<tab>"] = "toggle_node",
      },
    },
  },
}
