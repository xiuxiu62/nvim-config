local bufferline = require("bufferline")

vim.opt.termguicolors = true

bufferline.setup({
    options = {
        hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' }
        }
    }
})
