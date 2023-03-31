return function(mode, key, map, opts)
    vim.keymap.set(mode, key, map, opts or {})
end
