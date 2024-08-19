local which_key = require("which-key")

which_key.add({
    {
        mode = "n",
        { "<leader>a",  desc = "code actions" },
        -- colorscheme
        { "<leader>c",  group = "colorscheme" },
        { "<leader>cf", desc = "fix" },
        -- file
        { "<leader>f",  group = "file" },
        { "<leader>ff", desc = "find" },
        { "<leader>fg", desc = "git" },
        { "<leader>fv", desc = "ex" },
        { "<leader>fs", desc = "search" },
        --
        { "<leader>h",  desc = "help" },
        { "<leader>k",  desc = "type" },
        { "<leader>r",  desc = "redesc" },
        { "<leader>u",  desc = "undotree" },
        -- window
        { "<leader>w",  group = "window" },
        { "<leader>wh", desc = "go left" },
        { "<leader>wj", desc = "go down" },
        { "<leader>wk", desc = "go up" },
        { "<leader>wl", desc = "go right" },
        { "<leader>wH", desc = "move left" },
        { "<leader>wJ", desc = "move down" },
        { "<leader>wK", desc = "move up" },
        { "<leader>wL", desc = "move right" },
        { "<leader>ws", desc = "split" },
        { "<leader>wv", desc = "vsplit" },
        --
        { "<leader>x",  desc = "toggle diagnostics" },
        { "<leader>y",  desc = "clipboard <- capture" },
        { "<leader>Y",  desc = "line -> clipboard" },
    },
    {
        mode = "v",
        { "<leader>y", desc = "selection -> clipboard" },
    }
})
