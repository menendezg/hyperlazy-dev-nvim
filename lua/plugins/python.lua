return {
  -- LazyVim's Python extra is already loaded in config/lazy.lua
  -- Additional Python configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                -- Django support: include django stubs if installed
                extraPaths = {},
              },
            },
          },
        },
      },
    },
  },

  -- Django template treesitter + filetype detection
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "python",
        "htmldjango",
        "toml",
      })
    end,
  },

  -- Detect Django template files as htmldjango
  {
    "LazyVim/LazyVim",
    opts = {},
    init = function()
      vim.filetype.add({
        pattern = {
          [".*%.html"] = function(_, bufnr)
            local content = vim.api.nvim_buf_get_lines(bufnr, 0, 10, false)
            for _, line in ipairs(content) do
              if line:match("{%%") or line:match("{{") then
                return "htmldjango"
              end
            end
          end,
        },
      })
    end,
  },
}
