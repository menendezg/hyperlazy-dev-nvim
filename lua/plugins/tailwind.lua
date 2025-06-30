return {
  -- Tailwind CSS LSP configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          -- Add ERB files to Tailwind CSS LSP
          filetypes = {
            "css",
            "scss",
            "sass",
            "html",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "svelte",
            "ruby",
            "eruby", -- This is key for ERB files
          },
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  -- For ERB files - matches class="..." and class: "..."
                  "class[=:]\\s*[\"']([^\"']*)[\"']",
                  -- For Ruby string interpolation
                  'class[=:]\\s*"([^"]*)"',
                  "class[=:]\\s*'([^']*)'",
                  -- For Rails helpers
                  'class:\\s*"([^"]*)"',
                  "class:\\s*'([^']*)'",
                },
              },
            },
          },
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern(
              "tailwind.config.js",
              "tailwind.config.ts",
              "tailwind.config.cjs",
              "tailwind.config.mjs",
              "postcss.config.js",
              "postcss.config.ts",
              "postcss.config.cjs",
              "postcss.config.mjs"
            )(fname) or util.find_git_ancestor(fname)
          end,
        },
      },
    },
  },

  -- Enhanced ERB support for Tailwind
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "embedded_template",
        "css",
      })
    end,
  },
}
