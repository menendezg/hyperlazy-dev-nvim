return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Ruby
        "solargraph",
        "rubocop",
        "htmlbeautifier", -- For ERB formatting

        -- Python
        "pyright",
        "ruff",

        -- JavaScript/TypeScript
        "typescript-language-server",
        "prettier",
        "eslint_d",

        -- Tailwind CSS
        "tailwindcss-language-server",

        -- General
        "stylua", -- Lua formatter
        "shellcheck",
        "shfmt",
      },
    },
  },
}
