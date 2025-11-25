-- ~/.config/nvim/ftplugin/typescript.lua
-- TypeScript/JavaScript settings

-- Standard indentation
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

-- Run Node file
vim.keymap.set("n", "<leader>rn", "<cmd>!node %<cr>", { desc = "Run Node File", buffer = true })

-- Run with ts-node
vim.keymap.set("n", "<leader>rt", "<cmd>!ts-node %<cr>", { desc = "Run TypeScript File", buffer = true })

-- Start dev server (detects package.json scripts)
vim.keymap.set("n", "<leader>rd", "<cmd>TermExec cmd='npm run dev'<cr>", { desc = "Run Dev Server", buffer = true })

-- Run tests
vim.keymap.set("n", "<leader>rt", "<cmd>TermExec cmd='npm test'<cr>", { desc = "Run Tests", buffer = true })

-- Console.log shortcut
vim.keymap.set("n", "<leader>cl", "oconsole.log();<Esc>hi", { desc = "Insert console.log", buffer = true })
