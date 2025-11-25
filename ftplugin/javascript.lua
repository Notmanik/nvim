-- ~/.config/nvim/ftplugin/javascript.lua
-- JavaScript settings (same as TypeScript)

-- Standard indentation
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

-- Run Node file
vim.keymap.set("n", "<leader>rn", "<cmd>!node %<cr>", { desc = "Run Node File", buffer = true })

-- Start dev server
vim.keymap.set("n", "<leader>rd", "<cmd>TermExec cmd='npm run dev'<cr>", { desc = "Run Dev Server", buffer = true })

-- Console.log shortcut
vim.keymap.set("n", "<leader>cl", "oconsole.log();<Esc>hi", { desc = "Insert console.log", buffer = true })
