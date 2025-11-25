-- ~/.config/nvim/ftplugin/cpp.lua
-- C++ settings

-- Standard C++ indentation
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true

-- Compile and run
vim.keymap.set("n", "<leader>cc", "<cmd>TermExec cmd='g++ -std=c++17 % -o %< && ./%<'<cr>", { desc = "Compile & Run C++", buffer = true })

-- Compile only
vim.keymap.set("n", "<leader>cb", "<cmd>TermExec cmd='g++ -std=c++17 % -o %<'<cr>", { desc = "Compile C++", buffer = true })

-- Run with make
vim.keymap.set("n", "<leader>cm", "<cmd>TermExec cmd='make'<cr>", { desc = "Run Make", buffer = true })
