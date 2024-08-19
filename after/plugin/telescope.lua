local builtin = require("telescope.builtin")
local nmap = require("xiuxiu.map").nmap

local function project_search()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end

nmap("<leader>ff", builtin.find_files)
nmap("<leader>fg", builtin.git_files)
nmap("<leader>fs", project_search)
