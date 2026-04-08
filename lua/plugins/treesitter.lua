return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
            })

            local ts_install = require("nvim-treesitter.install")
            local ts_config = require("nvim-treesitter.config")

            local function enable_ts(buf)
                if pcall(vim.treesitter.start, buf) then
                    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end

            -- Auto-install and enable treesitter for any filetype
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local lang = vim.treesitter.language.get_lang(args.match) or args.match
                    if not vim.list_contains(ts_config.get_installed(), lang) then
                        if vim.list_contains(ts_config.get_available(), lang) then
                            ts_install.install(lang):await(function()
                                vim.schedule(function()
                                    if vim.api.nvim_buf_is_valid(args.buf) then
                                        enable_ts(args.buf)
                                    end
                                end)
                            end)
                        end
                        return
                    end
                    enable_ts(args.buf)
                end,
            })
        end
    },
}
