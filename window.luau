--!strict

-- Install locally: a remote host must not change another machine's theme.
-- Tern removes this sheet on plugin disable, removal, or reload.
tern.css("theme", tern.fs.read("kami.css"))
