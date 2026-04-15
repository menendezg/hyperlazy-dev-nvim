return {
  -- Neotest: run tests inline inside Neovim
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- Test adapters
      "olimorris/neotest-rspec",       -- Ruby / Rails (RSpec)
      "nvim-neotest/neotest-python",   -- Python (pytest / unittest)
      "marilari88/neotest-vitest",     -- Vitest (modern JS/TS)
      "nvim-neotest/neotest-jest",     -- Jest (JS/TS)
    },
    opts = function()
      return {
        adapters = {
          require("neotest-rspec")({
            rspec_cmd = function()
              -- Use bundle exec if a Gemfile is present
              if vim.fn.filereadable("Gemfile") == 1 then
                return { "bundle", "exec", "rspec" }
              end
              return { "rspec" }
            end,
          }),
          require("neotest-python")({
            dap = { justMyCode = false },
            runner = "pytest",
            python = function()
              -- Use virtualenv python if available
              local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
              if venv ~= "" then
                local venv_python = vim.fn.getcwd() .. "/.venv/bin/python"
                if vim.fn.executable(venv_python) == 1 then
                  return venv_python
                end
              end
              return "python"
            end,
          }),
          require("neotest-vitest"),
          require("neotest-jest")({
            jestCommand = "npx jest",
          }),
        },
        status = { virtual_text = true },
        output = { open_on_run = true },
      }
    end,
    keys = {
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests" },
      { "<leader>tT", function() require("neotest").run.run(vim.fn.getcwd()) end,   desc = "Run all tests" },
      { "<leader>tr", function() require("neotest").run.run() end,                  desc = "Run nearest test" },
      { "<leader>ts", function() require("neotest").summary.toggle() end,           desc = "Toggle test summary" },
      { "<leader>to", function() require("neotest").output_panel.toggle() end,      desc = "Toggle test output" },
      { "<leader>tl", function() require("neotest").run.run_last() end,             desc = "Re-run last test" },
    },
  },
}
