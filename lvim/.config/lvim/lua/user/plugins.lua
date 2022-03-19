lvim.plugins = {
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {"christoomey/vim-tmux-navigator"},
  {"folke/trouble.nvim"},
  {"David-Kunz/jester"},
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
      require"lsp_signature".on_attach()
      -- require "lsp_signature".setup()
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
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = 'qf',
  },
  {
    'ethanholz/nvim-lastplace',
    config = function ()
      require'nvim-lastplace'.setup{}
    end
  },
  {
    'sunjon/shade.nvim',
    config = function ()
      require'shade'.setup({
        overlay_opacity = 50,
        opacity_step = 1,
        keys = {
          brightness_up    = '<C-Up>',
          brightness_down  = '<C-Down>',
          toggle           = '<Leader>ss',
        }
      })
    end
  },
  {"rebelot/kanagawa.nvim"},
}

