-- ~/.config/nvim/ftplugin/rust.lua
-- Rust-specific settings

-- Standard Rust indentation
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true

-- Cargo commands
vim.keymap.set("n", "<leader>cb", "<cmd>TermExec cmd='cargo build'<cr>", { desc = "Cargo Build", buffer = true })
vim.keymap.set("n", "<leader>cr", "<cmd>TermExec cmd='cargo run'<cr>", { desc = "Cargo Run", buffer = true })
vim.keymap.set("n", "<leader>ct", "<cmd>TermExec cmd='cargo test'<cr>", { desc = "Cargo Test", buffer = true })
vim.keymap.set("n", "<leader>cc", "<cmd>TermExec cmd='cargo check'<cr>", { desc = "Cargo Check", buffer = true })
vim.keymap.set("n", "<leader>cC", "<cmd>TermExec cmd='cargo clippy'<cr>", { desc = "Cargo Clippy", buffer = true })

-- Expand macro
vim.keymap.set("n", "<leader>cm", "<cmd>RustExpandMacro<cr>", { desc = "Expand Macro", buffer = true })
