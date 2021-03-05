" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/dimascyriaco/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/dimascyriaco/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/dimascyriaco/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/dimascyriaco/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/dimascyriaco/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gina.vim"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/gina.vim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-gitbranch"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/vim-gitbranch"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-js"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/vim-js"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/vim-prettier"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-wheel"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/vim-wheel"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/Users/dimascyriaco/.local/share/nvim/site/pack/packer/start/vim-which-key"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
