-- ~/.config/nvim/lua/plugins/python.lua
-- Python-specific tools for FastAPI development

return {
  -- Python debugger
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap_python = require("dap-python")
      -- Try to use debugpy from virtual environment or system
      local debugpy_path = vim.fn.exepath("python3") or vim.fn.exepath("python")
      if debugpy_path ~= "" then
        dap_python.setup(debugpy_path)
      end
      
      -- Keymaps for Python debugging
      vim.keymap.set("n", "<leader>dn", function()
        require("dap-python").test_method()
      end, { desc = "Debug Python Test Method" })
      
      vim.keymap.set("n", "<leader>df", function()
        require("dap-python").test_class()
      end, { desc = "Debug Python Test Class" })
    end,
  },
  
  -- Python testing
  {
    "nvim-neotest/neotest-python",
    dependencies = {
      "nvim-neotest/neotest",
    },
  },
  
  -- Virtual environment selector
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    ft = "python",
    branch = "regexp",
    config = function()
      require("venv-selector").setup({
        auto_refresh = true,
        search_venv_managers = true,
        search_workspace = true,
        search = true,
        dap_enabled = true,
      })
    end,
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Python Virtual Environment" },
      { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached Venv" },
    },
  },
  
  -- Python docstring generator
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("neogen").setup({
        enabled = true,
        languages = {
          python = {
            template = {
              annotation_convention = "google_docstrings",
            },
          },
        },
      })
    end,
    keys = {
      { "<leader>nf", "<cmd>Neogen func<cr>", desc = "Generate Function Docstring" },
      { "<leader>nc", "<cmd>Neogen class<cr>", desc = "Generate Class Docstring" },
    },
  },
}
