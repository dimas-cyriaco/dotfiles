local utils = require('utils')
local map_local = utils.map_local

local on_attach = function(client, bufnr)
    require('completion').on_attach()

    local function map(...) map_local(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    map('<leader>la', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
    map('<leader>law', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    map('<leader>ld', "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>")
    map('<leader>lh', "<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
    map('<leader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
    map('<leader>llw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
    map('<leader>lp', "<cmd>lua require('lspsaga.provider').preview_definition()<CR>")
    map('<leader>lr', "<cmd>lua require('lspsaga.rename').rename()<CR>")
    map('<leader>lrf', '<cmd>lua vim.lsp.buf.references()<CR>')
    map('<leader>lrw', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    map('<leader>ls', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>")
    map('<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    map('[d', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>")
    map(']d', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>")
    map('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
    map('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
    map('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        map("<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    elseif client.resolved_capabilities.document_range_formatting then
        map("<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
    end

    -- Set autocommands conditional on server_capabilities
    -- if client.resolved_capabilities.document_highlight then
    --     vim.api.nvim_exec([[
    --     hi LspReferenceRead cterm=bold ctermbg=red guibg=LightSkyBlue3 guifg=Black
    --     hi LspReferenceText cterm=bold ctermbg=red guibg=LightSkyBlue3 guifg=Black
    --     hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightSkyBlue3 guifg=Black
    --     augroup lsp_document_highlight
    --     autocmd! * <buffer>
    --     autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    --     autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    --     augroup END
    --     ]], false)
    -- end
end


local nvim_lsp = require('lspconfig')
-- require'snippets'.use_suggested_mappings(true) -- for snippets.vim
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Code actions
capabilities.textDocument.codeAction = {
  dynamicRegistration = false;
      codeActionLiteralSupport = {
          codeActionKind = {
              valueSet = {
                 "",
                 "quickfix",
                 "refactor",
                 "refactor.extract",
                 "refactor.inline",
                 "refactor.rewrite",
                 "source",
                 "source.organizeImports",
              };
          };
      };
}

-- Snippets
capabilities.textDocument.completion.completionItem.snippetSupport = true;

-- LSPs
local servers = { "tsserver" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities;
        on_attach = on_attach;
        init_options = {
            onlyAnalyzeProjectsWithOpenFiles = true,
            suggestFromUnimportedLibraries = false,
            closingLabels = true,
        };
    }
end

-- Lua LSP. NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
-- require('nlua.lsp.nvim').setup(require('lspconfig'), {
--     capabilities = capabilities;
--     on_attach = on_attach;
--     init_options = {
--         onlyAnalyzeProjectsWithOpenFiles = true,
--         suggestFromUnimportedLibraries = false,
--         closingLabels = true,
--     };
-- })

