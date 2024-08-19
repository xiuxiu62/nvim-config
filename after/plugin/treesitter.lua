local config = require("nvim-treesitter.configs")
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

config.setup({
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "javascript", "lua", "org", "query", "rust", "typescript", "vim" },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    highlight = {
        enable = true,
        -- Required for spellcheck, some LaTex highlights and
        -- code block highlights that do not have ts grammar
        additional_vim_regex_highlighting = { 'org' },
    },
})

parser_config.move = {
    install_info = {
        url = "https://github.com/move-hub/tree-sitter-move.git", -- local path or git repo
        files = { "src/parser.c" },                               -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "master",                                        -- default branch in case of git repo if different from master
        generate_requires_npm = true,                             -- if stand-alone parser without npm dependencies
        requires_generate_from_grammar = true,                    -- if folder contains pre-generated src/parser.c
    },
    filetype = "move",                                            -- if filetype does not match the parser name
}
