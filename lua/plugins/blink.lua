return {
  'saghen/blink.cmp',
  version = 'v0.*', -- 2026 stable
  dependencies = 'rafamadriz/friendly-snippets',
  opts = {
    keymap = { 
      preset = 'default', -- Classic C-n/C-p and C-y for accept
      ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },
    appearance = {
      use_nvim_cmp_as_default = true, -- Smooth transition for Catppuccin
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    signature = { enabled = true } -- Replaces manual signature help plugins
  }
}
