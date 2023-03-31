local map = require("xiuxiu.map")

-- Split
map("n", "<leader>ws", function() vim.api.nvim_command("split") end)
map("n", "<leader>wv", function() vim.api.nvim_command("vsplit") end)

-- Goto window
map("n", "<leader>wh", function() vim.api.nvim_command("wincmd h") end)
map("n", "<leader>wj", function() vim.api.nvim_command("wincmd j") end)
map("n", "<leader>wk", function() vim.api.nvim_command("wincmd k") end)
map("n", "<leader>wl", function() vim.api.nvim_command("wincmd l") end)

-- Move window
map("n", "<leader>wH", function() vim.api.nvim_command("wincmd H") end)
map("n", "<leader>wJ", function() vim.api.nvim_command("wincmd J") end)
map("n", "<leader>wK", function() vim.api.nvim_command("wincmd K") end)
map("n", "<leader>wL", function() vim.api.nvim_command("wincmd L") end)

-- Resise
