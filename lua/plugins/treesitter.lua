return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            -- CHANGED: The module is now 'config' (singular), not 'configs'
            local config = require("nvim-treesitter.config")

            config.setup({
                ensure_installed = {
                    "lua",
                    "go",
                    "python",
                    "markdown",
                    "vimdoc",
                    "bash",
                    "cpp",
                    "rust"
                },

                -- Auto-install missing parsers when you open a file
                auto_install = true,

                highlight = {
                    enable = true,
                    -- Disable vim's regex highlighting for large files to save CPU
                    additional_vim_regex_highlighting = false,
                },

                indent = { enable = true },
            })
        end
    },
}
