return {
    {
        "olimorris/codecompanion.nvim",
        version = "^18.0.0",
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("codecompanion").setup({
                -- 1. Switch strategy to OLLAMA
                strategies = {
                    chat = { adapter = "ollama" },
                    inline = { adapter = "ollama" },
                    agent = { adapter = "ollama" },
                },
                -- 2. Configure the adapter
                adapters = {
                    ollama = function()
                        return require("codecompanion.adapters").extend("ollama", {
                            schema = {
                                model = {
                                    -- IMPORTANT: This MUST match the model name you downloaded in Step 2
                                    default = "qwen2.5-coder:14b",
                                    --default = "deepseek-coder-v2",
                                },
                            },
                            -- Optional: Tweak parameters for coding
                            parameters = {
                                sync = true,
                            },
                        })
                    end,
                },
            })
        end,
    },
}
