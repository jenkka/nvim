return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
            },
            sections = {
                lualine_c = { "filename", "%S" },
            },
        })
    end
}
