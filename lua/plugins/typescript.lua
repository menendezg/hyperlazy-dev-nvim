return {
  -- LazyVim's TypeScript extra is already loaded in config/lazy.lua
  -- Additional TypeScript/JavaScript configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- ts_ls is the current name (tsserver was deprecated in nvim-lspconfig)
        ts_ls = {
          settings = {
            typescript = {
              preferences = {
                includePackageJsonAutoImports = "auto",
              },
              inlayHints = {
                includeInlayParameterNameHints = "literals",
                includeInlayVariableTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = true,
              },
            },
            javascript = {
              preferences = {
                includePackageJsonAutoImports = "auto",
              },
              inlayHints = {
                includeInlayParameterNameHints = "literals",
                includeInlayVariableTypeHints = false,
              },
            },
          },
        },
      },
    },
  },
}
