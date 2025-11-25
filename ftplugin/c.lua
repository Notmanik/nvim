-- ~/.config/nvim/ftplugin/c.lua
-- C/C++ settings

-- Standard C indentation
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true

-- Compile and run
vim.keymap.set("n", "<leader>cc", "<cmd>TermExec cmd='gcc % -o %< && ./%<'<cr>", { desc = "Compile & Run C", buffer = true })

-- Compile only
vim.keymap.set("n", "<leader>cb", "<cmd>TermExec cmd='gcc % -o %<'<cr>", { desc = "Compile C", buffer = true })

-- Run with make
vim.keymap.set("n", "<leader>cm", "<cmd>TermExec cmd='make'<cr>", { desc = "Run Make", buffer = true })
