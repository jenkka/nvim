-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Basic settings
vim.opt.mouse = "" -- Turn off mouse

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smartindent = true -- Neovim's equivalent for better indenting

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 200

vim.opt.colorcolumn = "81"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.history = 1000
vim.opt.cursorline = true

vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- Treesitter folding
-- Commands:
-- zR: open all folds
-- zM: close all open folds
-- za: toggles the fold at the cursor
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevel = 99

vim.opt.list = true
vim.opt.listchars = { tab = ">·", trail = "█", nbsp = "␣" }

-- Open explorer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Ctrl+c is the new Esc!
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Toggle search highlighting
vim.keymap.set("n", "<leader>h", ":set hlsearch!<CR>")

-- Bindings for easy split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append line below without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Center word lookup
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without overriding current buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Turn off this garbage
vim.keymap.set("n", "Q", "<nop>")

-- Useless plugin shortcut
vim.keymap.set("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")

vim.keymap.set('n', '<leader>cp', ':lua ToggleCopyGarbage()<CR>', { noremap = true, silent = true })

-- CodeCompanion AI Shortcuts
vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle AI Chat" })
vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionActions<cr>", { desc = "Open AI Actions" })
vim.keymap.set("v", "<leader>ad", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add selected to AI Chat" })

-- Show diagnostics
vim.keymap.set("n",
    "<leader>e",
    vim.diagnostic.open_float,
    { desc = "Show LSP diagnostic" })

vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- Toggle garbage when copying text
local copyGarbage = true
function ToggleCopyGarbage()
    if copyGarbage then
        vim.opt.number = false
        vim.opt.relativenumber = false
    else
        vim.opt.number = true
        vim.opt.relativenumber = true
    end
    copyGarbage = not copyGarbage
end
