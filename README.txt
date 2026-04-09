================================================================================
                        NEOVIM CONFIG QUICK REFERENCE
                              jcglez | 2026
================================================================================

LEGEND:  <leader> = Space    <localleader> = \    C- = Ctrl+

Press <leader> and wait (1s) -- which-key will show all available keybinds.


================================================================================
  CONFIG STRUCTURE
================================================================================

init.lua                   Entry point -- bootstraps lazy.nvim
lua/vim-options.lua        Core settings, keymaps, and options
lua/plugins/              One file per plugin (lazy.nvim auto-imports all)
lua/graveyard/            Disabled plugins (moved here instead of deleted)

To add a plugin: create a new file in lua/plugins/ returning a lazy spec.
To remove one: delete its file (or move to graveyard/). Run :Lazy clean after.


================================================================================
  INSTALLED PLUGINS
================================================================================

Plugin                    Purpose
-----------               ---------------------------------------------------
fzf-lua                   Fuzzy finder (files, grep, buffers)
oil.nvim                  File explorer as an editable buffer
blink.cmp                 Autocompletion (LSP, snippets, paths, buffer words)
nvim-lspconfig            LSP client configuration
mason.nvim                Auto-install LSP servers and tools
mason-lspconfig            Bridge between Mason and lspconfig
conform.nvim              Auto-formatting and format-on-save
nvim-treesitter           Syntax highlighting, folding, indentation
trouble.nvim              Diagnostics list panel
tiny-inline-diagnostic     Inline diagnostic display (replaces virtual text)
undotree                  Visual undo history browser
which-key.nvim            Shows available keybinds after pressing a prefix
lualine.nvim              Statusline
nvim-lastplace            Reopens files at the last cursor position
codecompanion.nvim        AI chat assistant (Ollama / qwen2.5-coder:14b)
moonfly                   Colorscheme (catppuccin available but commented out)
mini.icons                Icon provider
friendly-snippets         Community snippet collection
cellular-automaton        Make it rain! (just for fun, in graveyard)


================================================================================
  FINDING STUFF (fzf-lua)
================================================================================

<leader>ff    Find files by name
<leader>fg    Live grep across all files
              Tip: add  -- -g '*.go'  to filter by filetype
<leader>fb    Switch between open buffers


================================================================================
  FILE BROWSING (oil.nvim)
================================================================================

-             Open parent directory (replaces current buffer)
:Oil          Open current file's directory
:Oil --float  Open in a floating window (doesn't replace buffer)

Inside Oil:
  - Navigate with normal motions (j/k, /, etc.)
  - Rename files by editing their names
  - Delete files by deleting lines
  - Create files by typing new names
  - Press :w (save) to apply all changes
  - Press - again to go up one directory


================================================================================
  LSP -- READING & UNDERSTANDING CODE (lspconfig)
================================================================================

K              Hover info -- shows type, docs, signature
gd             Go to definition          (C-o to jump back)
gi             Go to implementation
gr             Find all references
<leader>ca     Code actions / quick fixes
<leader>rn     Rename symbol across the project
<leader>e      Show diagnostic detail in a floating window
<leader>xx     Toggle full diagnostics list (Trouble panel)

LSP servers auto-installed via Mason:
  lua_ls, pyright, bashls, gopls, ts_ls

Commands:
  :Mason          Manage LSP servers and tools
  :LspInfo        Check which LSP is attached to current buffer
  :LspRestart     Restart LSP if it gets stuck


================================================================================
  AUTOCOMPLETION (blink.cmp)
================================================================================

While the completion menu is open:
  C-n / Tab       Next item
  C-p / S-Tab     Previous item
  C-y             Accept selected completion
  C-e             Dismiss menu

Sources (in priority order): LSP, file paths, snippets, buffer words
Documentation auto-shows after 200ms delay.
Function signatures show automatically as you type.


================================================================================
  FORMATTING (conform.nvim)
================================================================================

<leader>f     Format current buffer manually

Format-on-save is always active (1s timeout, falls back to LSP).

Configured formatters:
  Lua         stylua
  Shell       shfmt
  Python      ruff (fix + format)
  Go          goimports + gofmt
  JS/TS       prettier
  All files   trailing whitespace is trimmed

Commands:
  :ConformInfo    Shows which formatter is active for the current file


================================================================================
  EDITING KEYMAPS
================================================================================

VISUAL MODE
  J               Move selected lines down (auto re-indents)
  K               Move selected lines up (auto re-indents)
  <leader>p       Paste without overwriting your yank register
  <leader>d       Delete without polluting yank register

NORMAL MODE
  J               Join line below without moving cursor
  <leader>d       Delete to void register (doesn't overwrite yank)
  Q               Disabled (no accidental Ex mode)

CLIPBOARD (system)
  <leader>y       Yank selection to system clipboard
  <leader>Y       Yank whole line to system clipboard
  <leader>cp      Toggle copy mode (hides line numbers, signs, etc.)


================================================================================
  NAVIGATION
================================================================================

SEARCH
  /pattern        Search forward           ?pattern  Search backward
  n               Next match (auto-centers screen)
  N               Previous match (auto-centers screen)
  *               Search word under cursor forward
  #               Search word under cursor backward
  <leader>h       Toggle search highlighting on/off
                  (hlsearch is off by default)

SPLITS
  C-h             Move to left split
  C-j             Move to split below
  C-k             Move to split above
  C-l             Move to right split
  :vs             Vertical split
  :sp             Horizontal split
  C-w =           Equalize split sizes
  C-w o           Close all splits except current

JUMPS
  C-o             Jump back (previous location)
  C-i             Jump forward
  gd              Go to definition (then C-o to come back)
  gf              Go to file under cursor
  %               Jump to matching bracket


================================================================================
  UNDO & HISTORY
================================================================================

<leader>ut    Toggle Undotree -- visual undo history browser
              Navigate branches of undo history, recover anything.
              Undo history persists across sessions (saved to disk).

u             Undo
C-r           Redo


================================================================================
  FOLDING (Treesitter-based)
================================================================================

za            Toggle fold at cursor
zR            Open ALL folds
zM            Close ALL folds
zo            Open one fold
zc            Close one fold

Folds use Treesitter expressions -- they follow code structure (functions,
blocks, etc.) rather than indentation. All folds start open by default.


================================================================================
  AI ASSISTANT (CodeCompanion + Ollama)
================================================================================

<leader>aa    Toggle AI chat window
<leader>ac    Open AI actions menu (explain, refactor, etc.)
<leader>ad    Add visual selection to chat as context (visual mode)

Currently using: qwen2.5-coder:14b via Ollama (runs locally).


================================================================================
  USEFUL VIM DEFAULTS (not from plugins)
================================================================================

TEXT OBJECTS (use with d, c, y, v -- e.g. "diw" = delete inner word)
  iw / aw       inner/around word
  i" / a"       inner/around double quotes (also i' i` i( i[ i{ )
  ip / ap       inner/around paragraph
  it / at       inner/around HTML/XML tag

REGISTERS
  "ay           Yank into register 'a'     "ap  Paste from register 'a'
  "+y           Yank to system clipboard   "+p  Paste from system clipboard
  "0p           Paste last yank (not affected by deletes)
  :reg          Show all registers

MACROS
  qa            Start recording macro into register 'a'
  q             Stop recording
  @a            Play macro 'a'
  @@            Replay last macro

MARKS
  ma            Set mark 'a' at cursor
  'a            Jump to mark 'a' (line)
  `a            Jump to mark 'a' (exact position)
  :marks        List all marks

VISUAL MODES
  v             Character-wise visual
  V             Line-wise visual
  C-v           Block (column) visual -- great for multi-line edits

MISC
  .             Repeat last change
  C-a / C-x     Increment / decrement number under cursor
  gU / gu       Uppercase / lowercase (motion or visual selection)
  :earlier 5m   Undo to state 5 minutes ago
  :later 5m     Redo to state 5 minutes ago


================================================================================
  SETTINGS WORTH KNOWING ABOUT (vim-options.lua)
================================================================================

- Mouse is disabled (vim.opt.mouse = "")
- Relative line numbers are on
- Tabs = 4 spaces, smart indent
- Line wrap is off
- Swap files are off, persistent undo is on
- Search is case-insensitive unless you use uppercase (smartcase)
- Scroll keeps 8 lines of padding above/below cursor
- Color column at column 81
- Spell checking is on (en_us)
- Whitespace chars are visible: tabs show as >., trailing spaces as blocks


================================================================================
  COMMANDS TO REMEMBER
================================================================================

:Lazy           Plugin manager (update, clean, profile startup time)
:Mason          LSP/tool installer
:LspInfo        Check active LSP for current buffer
:ConformInfo    Check active formatter for current buffer
:checkhealth    Diagnose problems with your setup
:Trouble        Open diagnostics panel
:Oil            Open file explorer
:UndotreeToggle Open undo history

================================================================================
  FUN
================================================================================

<leader>mir   Make it rain (cellular automaton)
<leader>gol   Game of life (cellular automaton)

================================================================================
