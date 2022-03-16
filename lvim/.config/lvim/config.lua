lvim.format_on_save = true
lvim.colorscheme = "onedark"
lvim.leader = ";"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Diagnostics" },
}

lvim.builtin.which_key.mappings["j"] = {
  name = "+Jest",
  j = { "<cmd>lua require'jester'.run{ path_to_jest = './node_modules/.bin/jest' }<CR>", "Run nearest Test" },
  f = { "<cmd>lua require'jester'.run_file{ path_to_jest = './node_modules/.bin/jest' }<CR>", "Run file" },
  l = { "<cmd>lua require'jester'.run_last{ path_to_jest = './node_modules/.bin/jest' }<CR>", "Run last Test" },
}

lvim.builtin.which_key.mappings["a"] = {
  name = "+Harpoon",
  m = { "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<cr>", "Show List" },
  a = { "<cmd>lua require'harpoon.mark'.add_file()<cr>", "Add Mark" },
  u = { "<cmd>lua require'harpoon.ui'.nav_file(1)<cr>", "Add Mark" },
  i = { "<cmd>lua require'harpoon.ui'.nav_file(2)<cr>", "Add Mark" },
  o = { "<cmd>lua require'harpoon.ui'.nav_file(3)<cr>", "Add Mark" },
  p = { "<cmd>lua require'harpoon.ui'.nav_file(4)<cr>", "Add Mark" }
}

lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "eslint", filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" } },
}

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
}

lvim.plugins = {
  {"christoomey/vim-tmux-navigator"},
  {"folke/tokyonight.nvim"},
  {"folke/trouble.nvim"},
  {"David-Kunz/jester"},
  {'jamestthompson3/sort-import.nvim',
    config = function()
      require('sort-import').setup()
    end
  },
  {'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      require('onedark').load()
    end
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
    require("numb").setup {
      show_numbers = true,
      show_cursorline = true,
    }
    end,
  },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
    end
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,        -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,              -- Function to run after the scrolling animation ends
      })

      local t = {}
      -- Syntax: t[keys] = {function, {function arguments}}
      t['<D-j>'] = {'scroll', {'-1', 'true', '100'}}
      t['<D-k>'] = {'scroll', { '1', 'true', '100'}}

      require('neoscroll.config').set_mappings(t)
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = function ()
      require'nvim-treesitter.configs'.setup {
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      }
    end
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
    config = function ()
      require('nvim-treesitter.configs').setup {
        textsubjects = {
          enable = true,
          -- prev_selection = ',', -- (Optional) keymap to select the previous selection
          keymaps = {
            ['<cr>'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
          },
        },
      }
    end
  },
  { 'ThePrimeagen/harpoon',
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-lua/popup.nvim" },
    },
    config = function ()
      require("telescope").load_extension('harpoon')
    end
  }
}

lvim.keys.normal_mode["<S-x>"] = ":BufferClose<CR>"

lvim.keys.normal_mode["<M-j>"] = ":lua require('neoscroll').scroll(1, true, 100)<CR>"
lvim.keys.normal_mode["<M-k>"] = ":lua require('neoscroll').scroll(-1, true, 100)<CR>"

vim.wo.foldmethod="expr"
vim.o.foldexpr="nvim_treesitter#foldexpr()"
vim.wo.foldenable=true

local actions = require "telescope.actions"
require("telescope").setup {
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
        }
      }
    }
  }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

local ls = require "luasnip"
local types = require "luasnip.util.types"

vim.keymap.set({ "i", "s" }, "<c-l>", function ()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-h>", function ()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<c-k>", function ()
  if ls.choice_active() then
    ls.change_choice()
  end
end, { silent = true })

ls.config.set_config {
  history = true,

  updateevents = "TextChanged,TextChangedI",

  enable_autosnippets = true,

  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  },
}

require "user.snippets"

lvim.builtin.which_key.mappings["S"] = {
  name = "+LuaSnip",
  r = { "<cmd>source ~/.config/lvim/lua/user/snippets.lua<cr>", "Reload Snippets" },
}

