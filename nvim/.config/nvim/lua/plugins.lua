vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Packer bootstrap

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

return require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("b3nj5m1n/kommentary")
    use("arcticicestudio/nord-vim")
    use("neovim/nvim-lspconfig")
    use("kyazdani42/nvim-web-devicons")

    use({
      "karb94/neoscroll.nvim",
      config = function()
        require("neoscroll").setup()

        local t = {}
        -- Syntax: t[keys] = {function, {function arguments}}
        t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
        t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
        t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
        t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
        t["<C-k>"] = { "scroll", { "-1", "true", "0", nil } }
        t["<C-j>"] = { "scroll", { "1", "true", "0", nil } }
        t["zt"] = { "zt", { "250" } }
        t["zz"] = { "zz", { "250" } }
        t["zb"] = { "zb", { "250" } }

        require("neoscroll.config").set_mappings(t)
      end,
    })

    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })

    use({
      "glepnir/dashboard-nvim",
      config = function()
        vim.cmd("let g:dashboard_default_executive ='telescope'")
        vim.g.dashboard_custom_section = {
          a = { description = { "  Load Last Session         leader l  " }, command = "SessionLoad" },
          b = { description = { "  Find File                 leader f f" }, command = "Telescope find_files" },
          c = { description = { "  Recents                   leader f h" }, command = "Telescope oldfiles" },
          d = { description = { "  Find Word                 leader f g" }, command = "Telescope live_grep" },
          e = { description = { "  New File                  leader e n" }, command = "DashboardNewFile" },
          f = { description = { "  Bookmarks                 leader m  " }, command = "Telescope marks" },
          g = { description = { "  Update Plugins            leader u  " }, command = "PackerUpdate" },
          h = { description = { "  Settings                  leader e v" }, command = "edit $MYVIMRC" },
          i = { description = { "  Exit                      leader q  " }, command = "exit" },
        }
      end,
    })

    use({
      "marko-cerovac/material.nvim",
      config = function()
        require("material").setup()
        vim.cmd([[colorscheme material]])
      end,
    })

    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-tree").setup({
          auto_close = true,
          update_to_buf_dir = {
            enable = false,
          },
          diagnostics = {
            enable = true,
            icons = {
              hint = "│",
              info = "│",
              warning = "│",
              error = "│",
            },
          },
          update_focused_file = {
            enable = true,
          },
        })
      end,
    })

    use({
      "williamboman/nvim-lsp-installer",
      config = function()
        local lsp_installer = require("nvim-lsp-installer")

        lsp_installer.on_server_ready(function(server)
          local opts = {}

          -- (optional) Customize the options passed to the server
          -- if server.name == "tsserver" then
          -- opts.root_dir = function() ... end
          -- end

          -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
          server:setup(opts)
          vim.cmd([[ do User LspAttachBuffers ]])
        end)
      end,
    })

    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
      config = function()
        local cmp = require("cmp")

        cmp.setup({
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            end,
          },
          mapping = {
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
          },
          sources = cmp.config.sources({
            { name = "path" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            -- { name = 'buffer' },
            -- { name = 'vsnip' }, -- For vsnip users.
            { name = "luasnip" }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
          }, {
            { name = "buffer" },
          }),
        })

        -- Setup lspconfig.
        -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        --[[ require('lspconfig')[%YOUR_LSP_SERVER%].setup {
	capabilities = capabilities
      } ]]
      end,
    })

    use({
      "windwp/nvim-autopairs",
      requires = {
        "hrsh7th/nvim-cmp",
      },
      config = function()
        require("nvim-autopairs").setup({
          check_ts = true,
        })

        require("nvim-autopairs.completion.cmp").setup({
          map_cr = true, --  map <CR> on insert mode
          map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
          auto_select = true, -- automatically select the first item
          insert = false, -- use insert confirm behavior instead of replace
          map_char = { -- modifies the function or method delimiter by filetypes
            all = "(",
            tex = "{",
          },
        })
      end,
    })

    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
      config = function()
        local actions = require("telescope.actions")

        require("telescope").setup({
          pickers = {
            buffers = {
              show_all_buffers = true,
              sort_lastused = true,
              mappings = {
                i = {
                  ["<c-d>"] = actions.delete_buffer,
                },
                n = {
                  ["<c-d>"] = actions.delete_buffer,
                },
              },
            },
          },
        })
      end,
    })

    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      config = function()
        require("null-ls").config({
          sources = {
            require("null-ls").builtins.formatting.stylua,
          },
        })

        require("lspconfig")["null-ls"].setup({
          on_attach = function(client)
            if client.resolved_capabilities.document_formatting then
              vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
            end
          end,
        })
      end,
    })

    use({
      "nvim-lualine/lualine.nvim",
      requires = {
        { "kyazdani42/nvim-web-devicons", opt = true },
        "arkav/lualine-lsp-progress",
      },
      config = function()
        require("lualine").setup({
          options = {
            theme = "nord",
          },
          sections = {
            lualine_x = {
              "lsp_progress",
              function()
                local msg = "no active lsp"

                if #vim.lsp.buf_get_clients() then
                  local clients = {}
                  for _, client in pairs(vim.lsp.get_active_clients()) do
                    table.insert(clients, client.name)
                  end

                  if next(clients) == nil then
                    return msg
                  end

                  return " " .. table.concat(clients, ",")
                end

                return msg
              end,
              "filetype",
            },
          },
        })
      end,
    })

    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup({
          use_lsp_diagnostic_sign = true,
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        })
      end,
    })

    if packer_bootstrap then
      require("packer").sync()
    end
  end,

  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
})
