return {
  -- HTML language server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {
          filetypes = { "html", "htmldjango", "eruby" },
          init_options = {
            provideFormatter = false, -- use prettier instead
          },
        },
      },
    },
  },

  -- HTML treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
      })
    end,
  },
}
