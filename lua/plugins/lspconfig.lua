return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            diagnostics = {
                virtual_text = false,
            },
        },
        config = function()
            vim.lsp.enable({
                "lua_ls",
                "pyright",
                "bashls"
                --"gopls",
                --"rust_analyzer",
            })

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP hover" })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Go to references" })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
        end
    }
}
