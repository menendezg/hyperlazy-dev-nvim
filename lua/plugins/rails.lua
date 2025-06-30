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

  -- Add Ruby LSP configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        solargraph = {
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

  -- Add Ruby treesitter support
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
