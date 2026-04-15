return {
  -- Ruby and Rails support
  {
    "tpope/vim-rails",
    ft = { "ruby", "eruby" },
  },
  {
    "tpope/vim-bundler",
    ft = { "ruby", "eruby" },
  },

  -- Ruby LSP configuration (ruby-lsp is the modern standard)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- ruby-lsp: modern Ruby LSP maintained by Shopify
        ruby_lsp = {
          enabled = true,
          init_options = {
            formatter = "rubocop",
            linters = { "rubocop" },
          },
        },
        -- solargraph: keep as fallback, disable if ruby-lsp is working
        solargraph = {
          enabled = false, -- disable to avoid duplicate diagnostics; set true if you prefer it
          settings = {
            solargraph = {
              diagnostics = true,
              completion = true,
              hover = true,
              formatting = true,
              symbols = true,
              definitions = true,
              rename = true,
              references = true,
              folding = true,
            },
          },
        },
      },
    },
  },

  -- Ruby treesitter support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ruby",
        "embedded_template", -- For ERB files
      })
    end,
  },
}
