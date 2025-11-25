-- ~/.config/nvim/lua/plugins/java.lua

return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      -- JDTLS will be configured in ftplugin/java.lua
      -- This is just to ensure the plugin is loaded
    end,
  },
  
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rcasia/neotest-java",
      "nvim-neotest/neotest-python",
      -- Jest/Vitest disabled due to deprecation warnings - use :terminal npm test instead
      -- "nvim-neotest/neotest-jest",
      -- "marilari88/neotest-vitest",
      "rouge8/neotest-rust",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-java")({
            ignore_wrapper = false,
          }),
          require("neotest-python")({
            dap = { justMyCode = false },
            args = { "--log-level", "DEBUG", "-vv" },
            runner = "pytest",
          }),
          -- Jest/Vitest commented out - use npm test in terminal instead
          -- require("neotest-jest")({
          --   jestCommand = "npm test --",
          --   jestConfigFile = "jest.config.js",
          --   env = { CI = true },
          --   cwd = function()
          --     return vim.fn.getcwd()
          --   end,
          -- }),
          -- require("neotest-vitest"),
          require("neotest-rust")({
            args = { "--no-capture" },
          }),
        },
        icons = {
          running = "",
          passed = "",
          failed = "",
          skipped = "",
        },
        floating = {
          border = "rounded",
        },
        quickfix = {
          enabled = true,
          open = false,
        },
      })
    end,
  },
}
