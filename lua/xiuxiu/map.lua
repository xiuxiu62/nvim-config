local M = {}

function map(mode, key, map, opts)
    vim.keymap.set(mode, key, map, opts or {})
end

function M.nmap(key, map, opts)
    vim.keymap.set("n", key, map, opts or {})
end

function M.vmap(key, map, opts)
    vim.keymap.set("v", key, map, opts or {})
end

return M
