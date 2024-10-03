local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff", "ruff_organize_imports", "ruff_fix", "ruff_format" },
    go = { "goimports", "gofmt" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
