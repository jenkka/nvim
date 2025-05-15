return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "gopls" }
            })
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
            --local lspconfig = require("lspconfig")
            --lspconfig.lua_ls.setup({})
            --lspconfig.pyright.setup({})
            --lspconfig.gopls.setup({})

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

            --vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, {})
            --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            --vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, {})
            --vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, {})
        end
    }
}
