require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local servers = { "html", "cssls", "hls", "pyright", "gopls", "templ", "clangd" }
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
--
-- lspconfig.ruff.setup {
--   init_options = {
--     settings = {
--       -- Add any extra CLI arguments for Ruff here
--       args = {},
--     },
--   },
--   on_attach = function(client, bufnr)
--     client.server_capabilities.hoverProvider = false
--   end,
-- }
-- require("lspconfig").pyright.setup {
--   settings = {
--     pyright = {
--       -- Using Ruff's import organizer
--       disableOrganizeImports = true,
--     },
--     python = {
--       analysis = {
--         -- Ignore all files for analysis to exclusively use Ruff for linting
--         -- ignore = { "*" },
--       },
--     },
--   },
-- }
--
-- lspconfig.html.setup {
--   filetypes = { "html", "tmpl" },
--   cmd = { "vscode-html-language-server", "--stdio" },
--   init_options = {
--     configurationSection = { "html", "css", "javascript" },
--     embeddedLanguages = {
--       css = true,
--       javascript = true,
--       -- go = true,
--     },
--     provideFormatter = true,
--   },
--   settings = {
--     html = {
--       format = {
--         templating = true,
--         wrapLineLength = 120,
--         indentInnerHtml = true,
--       },
--       validate = {
--         scripts = true,
--         styles = true,
--         templating = true,
--       },
--     },
--   },
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- lspconfig.gopls.setup {
--   filetypes = { "go", "html", "tmpl" },
--   root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--   settings = {
--     gopls = {
--       templateExtensions = { "html", "tmpl", "gotmpl" },
--       analyses = {
--         templatecheck = true,
--         shadow = true,
--       },
--       hints = {
--         assignVariableTypes = true,
--         compositeLiteralFields = true,
--         constantValues = true,
--         parameterNames = true,
--         rangeVariableTypes = true,
--       },
--     },
--   },
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
