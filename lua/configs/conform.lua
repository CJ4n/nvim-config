local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff", "ruff_organize_imports", "ruff_fix", "ruff_format" },
    gotmpl = { "prettier" },
    tmpl = { "prettier" },
    go = { "gofumpt", "goimports-reviser", "golines" },
    html = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 300,
    lsp_fallback = true,
  },
  formatters = {
    prettier = {
      prepend_args = { "--config", vim.fn.expand "$HOME/.prettierrc" },
    },
  },
}

return options
