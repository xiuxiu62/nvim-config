local lsp = require("lsp-zero")
local neodev = require("neodev")
local trouble = require("trouble")
local nmap = require("xiuxiu.map").nmap

lsp.preset("recommended")
lsp.ensure_installed({
    "tsserver",
    -- "prettier",
    "eslint",
    "lua_ls",
    "rust_analyzer",
    "clangd"
})
lsp.nvim_workspace()
neodev.setup()
trouble.setup({
    position = "right",             -- position of the list can be: bottom, top, left, right
    height = 10,                    -- height of the trouble list when position is top or bottom
    width = 50,                     -- width of the list when position is left or right
    icons = true,                   -- use devicons for filenames
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "",              -- icon used for open folds
    fold_closed = "",            -- icon used for closed folds
    group = true,                   -- group results by file
    padding = true,                 -- add an extra new line on top of the list
    action_keys = {
        -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q",                   -- close the list
        cancel = "<esc>",              -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r",                 -- manually refresh
        jump = { "<cr>", "<tab>" },    -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" },      -- open buffer in new split
        open_vsplit = { "<c-v>" },     -- open buffer in new vsplit
        open_tab = { "<c-t>" },        -- open buffer in new tab
        jump_close = { "o" },          -- jump to the diagnostic and close the list
        toggle_mode = "m",             -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P",          -- toggle auto_preview
        hover = "K",                   -- opens a small popup with the full multiline message
        preview = "p",                 -- preview the diagnostic location
        close_folds = { "zM", "zm" },  -- close all folds
        open_folds = { "zR", "zr" },   -- open all folds
        toggle_fold = { "zA", "za" },  -- toggle fold of current file
        previous = "k",                -- previous item
        next = "j"                     -- next item
    },
    indent_lines = true,               -- add an indent guide below the fold icons
    auto_open = false,                 -- automatically open the list when you have diagnostics
    auto_close = true,                 -- automatically close the list when you have no diagnostics
    auto_preview = true,               -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = true,                  -- automatically fold a file trouble list at creation
    auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
})

lsp.format_on_save({
    servers = {
        ["lua_ls"] = { "lua" },
        ["rust_analyzer"] = { "rust" },
        ["tsserver"] = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        ["clangd"] = { "c", "cpp" },
        ["cmake-language-server"] = { "cmake" },
        ["gopls"] = { "go" },
        ["pylsp"] = { "python" },
        ["terraform-ls"] = { "terraform" }
    }
})

do
    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    lsp.defaults.cmp_mappings({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<Tab>"] = nil,
        ["<S-Tab>"] = nil,
    })
end

---@diagnostic disable-next-line: unused-local
local function on_attach(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    local diagnostic_hook = function()
        vim.diagnostic.open_float(nil, {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'rounded',
            source = 'always',
            prefix = ' ',
            scope = 'cursor',
        })
    end

    nmap("gd", "<cmd>Telescope lsp_definitions<cr>", opts)
    nmap("gr", "<cmd>Telescope lsp_references<cr>", opts)
    nmap("gi", "<cmd>Telescope lsp_implementations<cr>", opts)

    nmap("<leader>r", function() vim.lsp.buf.rename() end, opts)
    nmap("<leader>a", function() vim.lsp.buf.code_action() end, opts)
    nmap("<leader>k", function() vim.lsp.buf.hover() end, opts)
    nmap("<leader>h", diagnostic_hook, opts)

    nmap("<leader>x", function() vim.api.nvim_command("TroubleToggle") end, opts)
end


lsp.on_attach(on_attach)
lsp.setup()
