local builtin = require("telescope.builtin")
local map = require("xiuxiu.map")

local function project_search()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end

map("n", "<leader>ff", builtin.find_files)
map("n", "<leader>fg", builtin.git_files)
map("n", "<leader>fs", project_search)
