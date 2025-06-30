return {
  -- Import LazyVim's TypeScript extras
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- Additional TypeScript/JavaScript configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          settings = {
            typescript = {
              preferences = {
                includePackageJsonAutoImports = "auto",
              },
            },
            javascript = {
              preferences = {
                includePackageJsonAutoImports = "auto",
              },
            },
          },
        },
      },
    },
  },
}
