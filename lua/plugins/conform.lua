return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { "stylua" },
            sh = { "shfmt" },
            python = { "ruff_fix", "ruff_format" },
            go = { "goimports", "gofmt" },
            --rust = { "rustfmt" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            ["_"] = { "trim_whitespace" }, -- Runs on all filetypes
        },
        -- Set up format-on-save
        format_on_save = {
            timeout_ms = 1000,
            -- lsp_fallback = true, -- If no formatter is found, use the LSP (e.g. gopls)
            lsp_format = "fallback",
        },
    },
}
