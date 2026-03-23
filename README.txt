================================================================================
                        NEOVIM CONFIG QUICK REFERENCE
                              jcglez | 2026
================================================================================

LEGEND:  <leader> = Space    <localleader> = \    C- = Ctrl+

Press <leader> and wait — which-key will show you all available keybinds.


================================================================================
  CONFIG STRUCTURE
================================================================================

init.lua                   Entry point — bootstraps lazy.nvim
lua/vim-options.lua        Core settings, keymaps, and options
lua/plugins/              One file per plugin (lazy.nvim auto-imports all)

To add a plugin: create a new file in lua/plugins/ returning a lazy spec.
To remove one: delete its file. Run :Lazy clean to remove leftover files.


================================================================================
  WORKFLOWS TO REMEMBER
================================================================================

FINDING STUFF
  <leader>ff  Find file by name
  <leader>fg  Grep across all files (add  -- -g '*.py'  to filter by type)
  <leader>fb  Switch between open buffers
  -           Browse files with Oil (edit filenames like a buffer, :w to apply)

READING CODE
  K           Hover docs on anything
  gd          Jump to definition (C-o to jump back)
  gr          Find all references (do this BEFORE renaming or deleting)
  <leader>xx  Toggle full diagnostics list (Trouble)
  <leader>e   Show error detail in a float

EDITING
  <leader>ca  Code actions / quick fixes on errors
  <leader>rn  Rename symbol across the project
  <leader>f   Format the current buffer
  <leader>ut  Undo tree — recover anything, even from days ago

VISUAL MODE
  J / K       Move selected lines up/down (auto re-indents)
  <leader>d   Delete without polluting your yank register
  <leader>p   Paste without overwriting what you just yanked

CLIPBOARD
  <leader>y   Yank to system clipboard
  <leader>Y   Yank whole line to system clipboard
  <leader>cp  Toggle copy mode (strips line numbers, signs, etc.)

AI ASSISTANT (CodeCompanion)
  <leader>aa  Toggle chat window
  <leader>ac  Action menu (explain, refactor, etc. — works on selections)
  <leader>ad  Add selected code to chat as context

FOLDING
  zR / zM     Open all / close all folds
  za          Toggle fold at cursor
  Folds are open by default. Use zM to collapse, then za to open what you need.


================================================================================
  TIPS & TRICKS
================================================================================

- n / N auto-center the screen after a search jump.
- J in normal mode joins the line below without moving your cursor.
- Q is disabled — no more accidental Ex mode.
- hlsearch is off by default. <leader>h toggles it on when you want it.
- Format-on-save is always running. :ConformInfo shows the active formatter.
- :checkhealth if something feels broken.
- :Lazy to manage plugins (update, clean, profile startup).
- :Mason to manage LSP servers and tools.

================================================================================
