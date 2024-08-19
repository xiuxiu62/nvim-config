local nmap = require("xiuxiu.map").nmap

-- Split
nmap("<leader>ws", function() vim.api.nvim_command("split") end)
nmap("<leader>wv", function() vim.api.nvim_command("vsplit") end)

-- Goto window
nmap("<leader>wh", function() vim.api.nvim_command("wincmd h") end)
nmap("<leader>wj", function() vim.api.nvim_command("wincmd j") end)
nmap("<leader>wk", function() vim.api.nvim_command("wincmd k") end)
nmap("<leader>wl", function() vim.api.nvim_command("wincmd l") end)

-- Move window
nmap("<leader>wH", function() vim.api.nvim_command("wincmd H") end)
nmap("<leader>wJ", function() vim.api.nvim_command("wincmd J") end)
nmap("<leader>wK", function() vim.api.nvim_command("wincmd K") end)
nmap("<leader>wL", function() vim.api.nvim_command("wincmd L") end)

-- Resise
