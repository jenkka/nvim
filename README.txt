================================================================================
                        NEOVIM CONFIG QUICK REFERENCE
                              jcglez | 2026
================================================================================

LEGEND:  <leader> = Space    <localleader> = \    C- = Ctrl+


================================================================================
  CORE
================================================================================

Escape Insert Mode          C-c
Clear Search Highlight      <leader>h
Toggle Line Numbers         <leader>cp       (clean copy — strips number gutter)
Disable Mouse               Always off (vim.opt.mouse = "")

Color Column at 81          Visible reminder to keep lines short
Spell Check                 English (en_us), visible in comments and prose
Format on Save              Automatic via conform.nvim
Undo Persistence            Survives restarts (stored in stdpath/state/undo)
Cursor Restore on Open      nvim-lastplace remembers where you were


================================================================================
  FILE NAVIGATION
================================================================================

Find file by name           <leader>ff       (fzf-lua files)
Search inside files         <leader>fg       (fzf-lua live_grep)
Switch open buffers         <leader>fb       (fzf-lua buffers)
Open file explorer          -                (Oil.nvim — opens parent dir)

  Oil Tips:
    Press -  again          Go up one directory
    Press Enter             Open file or directory
    Edit filenames          Just type over them like a text buffer
    Delete a file           Delete the line, then :w
    Create a file           Add a new line with the filename, then :w
    Create a directory      Add a line ending with /, then :w
    Rename                  Edit the name inline, then :w


================================================================================
  WINDOWS & SPLITS
================================================================================

Navigate Left               C-h
Navigate Down               C-j
Navigate Up                 C-k
Navigate Right              C-l

  Split Tips:
    Open split              :sp (horizontal)  or  :vsp (vertical)
    Resize                  :resize N  or  :vertical resize N
    Close split             :q  or  C-w c
    Make splits equal       C-w =


================================================================================
  TEXT MANIPULATION
================================================================================

Move lines up/down          J / K            (Visual mode — auto re-indents)
Join line below             J                (Normal mode — cursor stays put)
Center on search jump       n / N            (Auto-centers screen after jump)

Copy to system clipboard    <leader>y        (Normal or Visual)
                            <leader>Y        (Whole line, Normal)
Paste without overwriting   <leader>p        (Visual — keeps your register)
Delete to void register     <leader>d        (Normal or Visual — no clipboard
                                              pollution)

  Tip: Use <leader>d + <leader>p together. Delete with <leader>d so your
  yank register stays clean, then <leader>p pastes what you actually yanked.

Disable Ex mode             Q = <nop>        (Prevents accidental Q press)


================================================================================
  FOLDING  (Treesitter-powered)
================================================================================

Open all folds              zR
Close all folds             zM
Toggle fold at cursor       za
Open fold at cursor         zo
Close fold at cursor        zc

  Folds open by default (foldlevel=99). Use zM to collapse everything,
  then zo/za to open what you need.


================================================================================
  LSP
================================================================================

Hover documentation         K
Go to definition            gd
Go to implementation        gi
Find references             gr
Rename symbol               <leader>rn
Code actions / quick fixes  <leader>ca
Show diagnostic float       <leader>e

  Installed LSPs (via Mason):
    lua_ls        Lua
    pyright       Python
    gopls         Go
    rust_analyzer Rust
    bashls        Bash/Shell

  Tips:
    gd into a function, then C-o to jump back.
    gr before renaming/deleting — see all usages first.
    <leader>ca on a red underline often offers auto-imports or fixes.


================================================================================
  COMPLETION  (blink.cmp)
================================================================================

Next suggestion             Tab  or  C-n
Previous suggestion         S-Tab  or  C-p
Accept suggestion           Enter  or  C-y
Dismiss popup               C-e
Signature help              Automatic when inside function arguments

  Sources: LSP > path > snippets > buffer
  Snippets from friendly-snippets are included.


================================================================================
  FORMATTING  (conform.nvim)
================================================================================

Format buffer manually      <leader>f
Format on save              Automatic (500ms timeout)

  Formatter map:
    Lua         stylua
    Python      ruff_fix -> ruff_format  (fix lint issues, then format)
    Go          goimports -> gofmt (imports first, then format)
    Rust        rustfmt
    Bash/Shell  shfmt
    JS/TS       prettier
    All others  trim_whitespace

  Run :ConformInfo to see what formatter is active for the current file.


================================================================================
  DIAGNOSTICS & ERRORS
================================================================================

Show error detail           <leader>e        (Float with full message)
Toggle diagnostics list     <leader>xx       (Trouble.nvim)

  Inside Trouble:
    q / Esc                 Close
    o                       Jump to item and close
    <CR>                    Jump to item, keep open

  Diagnostics appear inline via tiny-inline-diagnostic (modern style).


================================================================================
  UNDO HISTORY  (undotree)
================================================================================

Toggle undo tree            <leader>ut

  Persists between sessions. Navigate with j/k, press Enter to restore.
  Use this to recover code deleted hours or days ago.


================================================================================
  AI ASSISTANT  (CodeCompanion)
================================================================================

Toggle AI chat window       <leader>aa       (Normal or Visual)
Open AI action menu         <leader>ac       (Normal or Visual)
Add selection to chat       <leader>ad       (Visual)

  Inside the chat buffer:
    Send message            Enter (Normal) or C-s (Insert)
    Attach current buffer   Type  #buffer  in the chat
    Attach another file     Type  /  to open file picker
    Pin an attached file    Hover it and press gp

  Workflow:
    1. Select code -> <leader>ac for targeted actions (explain, refactor, etc.)
    2. <leader>ad to add context before asking complex questions.


================================================================================
  SEARCH TIPS
================================================================================

Incremental search          /  (results highlight as you type)
Search backward             ?
Next/previous match         n / N  (auto-centered)
Search word under cursor    *  (forward)  or  #  (backward)
Replace all                 :%s/old/new/gI<CR>

  hlsearch is off by default. Toggle with <leader>h when you want
  persistent highlights after a search.


================================================================================
  FZF-LUA TIPS
================================================================================

In any fzf-lua picker:
    Move up/down            C-n / C-p
    Open file               Enter
    Open in split           C-x (horizontal)  C-v (vertical)
    Open in tab             C-t
    Close picker            Esc

  In live_grep, filter by filetype:  searchterm -- -g '*.lua'


================================================================================
  GENERAL VIM TIPS
================================================================================

Jump back / forward         C-o / C-i
Last insert position        gi
Re-select last visual       gv
Jump to last edit           '.

:Lazy                       Manage plugins (update, clean, profile)
:Mason                      Install/update LSP servers and tools
:TSUpdate                   Update Treesitter parsers
:checkhealth                Diagnose broken integrations
:LspInfo                    See which LSP is attached


================================================================================
  FUN
================================================================================

Make it rain                <leader>mir
Game of Life                <leader>gol

================================================================================
