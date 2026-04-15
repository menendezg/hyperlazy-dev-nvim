return {
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = false, -- Disable global auto-format; use <leader>cf to format manually
      formatters_by_ft = {
        ruby = { "rubocop" },
        eruby = { "htmlbeautifier" }, -- For ERB files
        python = { "ruff_format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        htmldjango = { "prettier" }, -- Django templates
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        graphql = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        mdx = { "prettier" },
        lua = { "stylua" },
        sh = { "shfmt" },
        bash = { "shfmt" },
      },
    },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = { "n", "v" },
        desc = "Format buffer or selection",
      },
    },
  },
}
