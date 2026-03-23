return {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    config = function()
        vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, {})
    end
}
