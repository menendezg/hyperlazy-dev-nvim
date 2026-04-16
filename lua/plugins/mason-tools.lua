return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Ruby
        "ruby-lsp",       -- Modern Ruby LSP (replaces solargraph)
        "solargraph",     -- Keep as fallback
        "rubocop",
        "htmlbeautifier", -- For ERB formatting

        -- Python
        "pyright",
        "ruff",

        -- JavaScript/TypeScript
        "typescript-language-server",
        "prettier",
        "eslint_d",

        -- HTML
        "html-lsp", -- HTML language server (vscode-langservers-extracted)

        -- CSS
        "css-lsp", -- cssls (vscode-langservers-extracted)
        "tailwindcss-language-server",

        -- General
        "stylua",      -- Lua formatter
        "shellcheck",
        "shfmt",
      },
    },
  },
}
