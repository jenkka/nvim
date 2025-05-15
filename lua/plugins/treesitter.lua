return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require ("nvim-treesitter.configs")
            config.setup({
                ensure_installed = { "lua", "go", "python" },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = false },
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-refactor",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                refactor = {
                    smart_rename = {
                        enable = true,
                        keymaps = {
                            smart_rename = "<leader>rn",
                        },
                    },
                },
            })
        end

    },
}
