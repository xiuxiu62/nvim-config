local map = require("xiuxiu.map")

-- Ex file manager
map("n", "<leader>fv", vim.cmd.Ex, {})

-- Move selection
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Yank to clipboard
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")
