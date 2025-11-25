-- ~/.config/nvim/ftplugin/python.lua
-- Python-specific settings for FastAPI development

-- PEP 8 indentation
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true
vim.opt_local.textwidth = 88 -- Black's line length

-- Folding
vim.opt_local.foldmethod = "indent"
vim.opt_local.foldlevel = 99

-- Run Python file
vim.keymap.set("n", "<leader>rp", "<cmd>!python3 %<cr>", { desc = "Run Python File", buffer = true })

-- Run with FastAPI
vim.keymap.set("n", "<leader>rf", "<cmd>TermExec cmd='uvicorn main:app --reload'<cr>", { desc = "Run FastAPI", buffer = true })

-- Format with Black
vim.keymap.set("n", "<leader>bf", "<cmd>!black %<cr>", { desc = "Format with Black", buffer = true })

-- Sort imports
vim.keymap.set("n", "<leader>si", "<cmd>!isort %<cr>", { desc = "Sort Imports", buffer = true })
