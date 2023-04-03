local which_key = require("which-key")

-- TODO: register at sites of mapping

-- Normal mode
which_key.register({
        a = { name = "code actions" },
        c = {
            name = "colorscheme",
            f = "fix",
        },
        f = {
            name = "file",
            f = "find",
            g = "git",
            v = "ex",
            s = "search",
        },
        h = { name = "help" },
        k = { name = "type" },
        o = {
            name = "org",
            a = "append",
            c = "capture",
        },
        r = { name = "rename" },
        u = { name = "undotree" },
        w = {
            name = "window",
            h = "go left",
            j = "go down",
            k = "go up",
            l = "go right",
            H = "move left",
            J = "move down",
            K = "move up",
            L = "move right",
            s = "split",
            v = "vsplit",
        },
        x = { name = "toggle diagnostics" },
        y = { name = "clipboard <- capture" },
        Y = { name = "line -> clipboard" },
    },
    {
        mode = "n",
        prefix = "<leader>",
    })

-- Visual mode
which_key.register({
    y = { name = "selection -> clipboard" },
}, {
    mode = "v",
    prefix = "<leader>",
})
