-- ~/.config/nvim/lua/plugins/development.lua
-- Essential development tools

return {
  -- Package.json version display and updates
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = "json",
    config = function()
      require("package-info").setup({
        colors = {
          up_to_date = "#3C4048",
          outdated = "#d19a66",
        },
        icons = {
          enable = true,
          style = {
            up_to_date = "|  ",
            outdated = "|  ",
          },
        },
        autostart = true,
        hide_up_to_date = true,
        hide_unstable_versions = false,
      })
    end,
  },
  
  -- REST client for API testing (DISABLED - optional feature)
  -- Uncomment and install luarocks if you want REST testing
  -- {
  --   "rest-nvim/rest.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   ft = "http",
  --   config = function()
  --     require("rest-nvim").setup({
  --       result_split_horizontal = false,
  --       result_split_in_place = false,
  --       skip_ssl_verification = false,
  --       encode_url = true,
  --       highlight = {
  --         enabled = true,
  --         timeout = 150,
  --       },
  --       result = {
  --         show_url = true,
  --         show_http_info = true,
  --         show_headers = true,
  --         formatters = {
  --           json = "jq",
  --           html = function(body)
  --             return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
  --           end,
  --         },
  --       },
  --     })
  --   end,
  --   keys = {
  --     { "<leader>rr", "<Plug>RestNvim", desc = "Run REST request" },
  --     { "<leader>rp", "<Plug>RestNvimPreview", desc = "Preview REST request" },
  --     { "<leader>rl", "<Plug>RestNvimLast", desc = "Re-run last REST request" },
  --   },
  -- },
  
  -- Better git integration
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gwrite", "Gread" },
    keys = {
      { "<leader>gg", "<cmd>Git<cr>", desc = "Git Status" },
      { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git Diff" },
      { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git Commit" },
      { "<leader>gP", "<cmd>Git push<cr>", desc = "Git Push" },
      { "<leader>gl", "<cmd>Git pull<cr>", desc = "Git Pull" },
    },
  },
  
  -- Git conflict resolver (DISABLED - has deprecation warnings)
  -- Git conflicts can be resolved manually with vim-fugitive
  -- {
  --   "akinsho/git-conflict.nvim",
  --   version = "*",
  --   config = function()
  --     require("git-conflict").setup({
  --       default_mappings = true,
  --       default_commands = true,
  --       disable_diagnostics = false,
  --       highlights = {
  --         incoming = "DiffAdd",
  --         current = "DiffText",
  --       },
  --     })
  --   end,
  -- },
  
  -- Database client
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_win_position = "right"
      vim.g.db_ui_winwidth = 40
    end,
    keys = {
      { "<leader>D", "<cmd>DBUIToggle<cr>", desc = "Toggle Database UI" },
    },
  },
  
  -- Docker integration
  {
    "jamestthompson3/nvim-remote-containers",
    cmd = { "RemoteStart", "RemoteInfo", "RemoteStop" },
  },
  
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" },
    },
  },
  
  -- Colorizer for CSS colors
  {
    "norcalli/nvim-colorizer.lua",
    ft = { "css", "scss", "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
    config = function()
      require("colorizer").setup({
        "css",
        "scss",
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      }, {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
      })
    end,
  },
  
  -- Surround text objects
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  
  -- Multi-cursor
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
      }
    end,
  },
  
  -- Better code navigation
  {
    "pechorin/any-jump.vim",
    keys = {
      { "<leader>j", "<cmd>AnyJump<cr>", desc = "Jump to definition" },
      { "<leader>ab", "<cmd>AnyJumpBack<cr>", desc = "Jump back" },
    },
  },
}
