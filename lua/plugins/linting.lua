return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "BufReadPost", "InsertLeave" },
    opts = {
      -- Per-filetype linter assignments
      linters_by_ft = {
        ruby = { "rubocop" },
        eruby = { "rubocop" },
        python = { "ruff" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        sh = { "shellcheck" },
        bash = { "shellcheck" },
      },
    },
    config = function(_, opts)
      local lint = require("lint")
      lint.linters_by_ft = opts.linters_by_ft

      -- Auto-lint on the events above
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        callback = function()
          -- Only lint if a linter is configured for this filetype
          local ft = vim.bo.filetype
          if opts.linters_by_ft[ft] then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
