================================================================================
                       MY NEOVIM SETUP GUIDE (2026 EDITION)
================================================================================

--- THE BASICS ---
Leader Key:                 Space
Local Leader:               \
Escape Insert Mode:         Ctrl + c
Clear Search Highlight:     <leader> + h
Toggle Line Numbers:        <leader> + cp  (Useful for copying clean text)

--- FILE NAVIGATION ---
Find a file by name:        <leader> + ff
Search inside files (Grep): <leader> + fg
Open File Explorer (Oil):   -  (Press - again to go up. Edit names like text)

--- WINDOW & SPLIT MANAGEMENT ---
Move Left:                  Ctrl + h
Move Down:                  Ctrl + j
Move Up:                    Ctrl + k
Move Right:                 Ctrl + l

--- TEXT MANIPULATION & CLIPBOARD ---
Move highlighted lines:     J or K (in Visual mode)
Join line below:            J (in Normal mode - keeps cursor in place)
Copy to system clipboard:   <leader> + y  (or <leader> + Y for whole line)
Paste without overwriting:  <leader> + p  (in Visual mode)
Delete to void register:    <leader> + d

--- AI WORKFLOW (CODECOMPANION & OLLAMA) ---
Toggle AI Chat Window:      <leader> + aa
Open AI Action Menu:        <leader> + ac (On highlighted code)
Add Code to Chat:           <leader> + ad (In Visual mode)
Send Message (Insert):      Ctrl + s
Send Message (Normal):      Enter
Attach Current File:        Type #buffer inside the chat
Attach Specific File:       Type / inside the chat to open file picker
Pin a File:                 Hover over attached file and press 'gp'

--- CODING & LSP ---
Next/Previous Item:         Tab / Shift+Tab (or Ctrl+n / Ctrl+p)
Accept Suggestion:          Enter (or Ctrl+y)
Hover Documentation:        K
Go to Definition:           gd
Go to Implementation:       gi
Find References:            gr
Rename Variable:            <leader> + rn
Code Actions (Quick Fixes): <leader> + ca
Format File:                <leader> + f

--- DIAGNOSTICS & ERRORS ---
Show Error Details:         <leader> + e
Open Project Error List:    <leader> + xx

--- HISTORY & FOLDING ---
Toggle Undo History Tree:   <leader> + ut
Open all code folds:        zR
Close all code folds:       zM
Toggle fold under cursor:   za

--- FUN STUFF ---
Make it rain:               <leader> + mir
Game of Life:               <leader> + gol
================================================================================
