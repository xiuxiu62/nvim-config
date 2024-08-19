local nmap = require("xiuxiu.map").nmap

function ColorFix(color)
    color = color or "kanagawa-wave"
    vim.cmd.colorscheme(color)

    -- Fix transparency
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Run once at startup
ColorFix()

nmap("<leader>cf", function() vim.api.nvim_command("lua ColorFix()") end)
