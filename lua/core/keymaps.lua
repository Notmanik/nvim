-- ~/.config/nvim/lua/core/keymaps.lua
-- Simple, memorable keybindings

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-------------------------------------------------------
-- ESSENTIAL KEYMAPS (No leader needed)
-------------------------------------------------------

-- Save file (like VS Code)
map("n", "<C-s>", "<cmd>w<cr>", opts)
map("i", "<C-s>", "<esc><cmd>w<cr>", opts)

-- Quit
map("n", "<C-q>", "<cmd>q<cr>", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)

-- Better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move lines up/down
map("n", "<A-j>", ":m .+1<cr>==", opts)
map("n", "<A-k>", ":m .-2<cr>==", opts)
map("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)

-- Stay in indent mode
map("v", "<Tab>", ">gv", opts)
map("v", "<S-Tab>", "<gv", opts)

-- Better paste (don't replace clipboard)
map("v", "p", '"_dP', opts)

-- Navigate buffers (Tab = next, Shift+Tab = prev)
map("n", "<Tab>", "<cmd>bnext<cr>", opts)
map("n", "<S-Tab>", "<cmd>bprevious<cr>", opts)

-- Close buffer
map("n", "<leader>x", "<cmd>bdelete<cr>", opts)
map("n", "<leader>X", "<cmd>bdelete!<cr>", opts)

-- Terminal toggle
map("n", "<C-\\>", "<cmd>ToggleTerm<cr>", opts)
map("t", "<C-\\>", "<cmd>ToggleTerm<cr>", opts)
map("t", "<Esc>", [[<C-\><C-n>]], opts)

-------------------------------------------------------
-- LEADER KEYMAPS (Organized by category)
-------------------------------------------------------

-- File Explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle File Explorer" })
map("n", "<leader>o", "<cmd>NvimTreeFocus<cr>", { desc = "Focus File Explorer" })

-- Find (Telescope)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find Text" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent Files" })
map("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find Word Under Cursor" })
map("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Find Commands" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find Keymaps" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })
map("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace Symbols" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
map("n", "<leader>fB", "<cmd>Telescope file_browser<cr>", { desc = "File Browser" })

-- LSP Actions
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format Code" })

-- Diagnostics
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic List" })

-- Git (Gitsigns)
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Git Blame" })
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview Hunk" })
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage Hunk" })
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo Stage" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset Hunk" })
map("n", "[g", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous Hunk" })
map("n", "]g", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next Hunk" })

-- Debug (F-keys like IntelliJ)
map("n", "<F5>", "<cmd>lua require('dap').continue()<cr>", { desc = "Debug: Continue" })
map("n", "<F9>", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Debug: Toggle Breakpoint" })
map("n", "<F10>", "<cmd>lua require('dap').step_over()<cr>", { desc = "Debug: Step Over" })
map("n", "<F11>", "<cmd>lua require('dap').step_into()<cr>", { desc = "Debug: Step Into" })
map("n", "<S-F11>", "<cmd>lua require('dap').step_out()<cr>", { desc = "Debug: Step Out" })
map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", { desc = "Continue" })
map("n", "<leader>dt", "<cmd>lua require('dap').terminate()<cr>", { desc = "Terminate" })
map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", { desc = "Toggle Debug UI" })

-- Test (Neotest)
map("n", "<leader>tr", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Run Test" })
map("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { desc = "Run File Tests" })
map("n", "<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", { desc = "Debug Test" })
map("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = "Toggle Summary" })
map("n", "<leader>to", "<cmd>lua require('neotest').output_panel.toggle()<cr>", { desc = "Toggle Output" })

-- Java-specific (only loaded for Java files)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    map("n", "<leader>jo", "<cmd>lua require('jdtls').organize_imports()<cr>", { desc = "Organize Imports", buffer = true })
    map("n", "<leader>jv", "<cmd>lua require('jdtls').extract_variable()<cr>", { desc = "Extract Variable", buffer = true })
    map("n", "<leader>jc", "<cmd>lua require('jdtls').extract_constant()<cr>", { desc = "Extract Constant", buffer = true })
    map("v", "<leader>jm", "<esc><cmd>lua require('jdtls').extract_method(true)<cr>", { desc = "Extract Method", buffer = true })
    map("n", "<leader>jt", "<cmd>lua require('jdtls').test_class()<cr>", { desc = "Test Class", buffer = true })
    map("n", "<leader>jn", "<cmd>lua require('jdtls').test_nearest_method()<cr>", { desc = "Test Method", buffer = true })
  end,
})

-- Trouble (Diagnostics panel)
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Trouble" })
map("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })

-- Quick utilities
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear Highlights" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Quit All" })

-- Package info (for package.json)
map("n", "<leader>ps", "<cmd>lua require('package-info').show()<cr>", { desc = "Show Package Info" })
map("n", "<leader>pu", "<cmd>lua require('package-info').update()<cr>", { desc = "Update Package" })
map("n", "<leader>pd", "<cmd>lua require('package-info').delete()<cr>", { desc = "Delete Package" })
map("n", "<leader>pi", "<cmd>lua require('package-info').install()<cr>", { desc = "Install Package" })
