local on_attach = function(client, bufnr)
    local set = vim.keymap.set
    set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>")
    set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
    set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    set("n", "<C-i>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
    set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
    set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
    set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    set("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
    set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
    set("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,
    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                },
            }
        })
    end,
    ["terraformls"] = function()
        require("lspconfig").terraformls.setup{}
    end,
}
