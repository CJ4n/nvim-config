local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff", "ruff_organize_imports", "ruff_fix", "ruff_format" },
    gotmpl = { "prettier" },
    go = { 'gofumpt', 'goimports-reviser', 'golines' },
    html = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 300,
    lsp_fallback = true,
  },
}

return options
