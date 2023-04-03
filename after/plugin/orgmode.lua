local orgmode = require("orgmode")

orgmode.setup_ts_grammar()
orgmode.setup({
    org_agenda_files = { "~/documents/agenda/*" },
    org_default_notes_file = { "~/documents/notes/default.org" }
})
