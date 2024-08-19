local nmap = require("xiuxiu.map").nmap
local vmap = require("xiuxiu.map").vmap

-- Ex file manager
nmap("<leader>fv", vim.cmd.Ex, {})

-- Move selection
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

-- Yank to clipboard
nmap("<leader>y", "\"+y")
vmap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")
