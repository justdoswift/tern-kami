--!strict

-- Install locally: a remote host must not change another machine's theme.
-- Tern removes this sheet on plugin disable, removal, or reload.
tern.css("theme", tern.fs.read("kami.css"))

-- Use the native settings API so terminal cells and cursor metrics follow the
-- font. CSS alone cannot safely change the terminal's measured grid.
local fonts = {
	font_family = "JetBrains Mono, Fira Code, SF Mono, Consolas, Monaco",
	font_family_bold = "",
	font_family_italic = "",
	font_family_bold_italic = "",
	code_font = "JetBrains Mono, Fira Code, SF Mono, Consolas, Monaco",
	ui_font = 'Charter, Georgia, TsangerJinKai02, "Source Han Serif SC", "Source Han Serif CN", "Noto Serif CJK SC", "Noto Serif SC", "Songti SC", Palatino, serif',
}
local snapshotKey = "font-preferences"

local function applyFonts(cx: WindowCx)
	local snapshot = tern.kv.get(snapshotKey)
	if not snapshot or not snapshot.active then
		local previous = {}
		for key in pairs(fonts) do
			previous[key] = cx.settings:get(key)
		end
		-- Save before changing preferences, including when set_many fails.
		tern.kv.set(snapshotKey, { active = true, previous = previous })
	end
	cx.settings:set_many(fonts)
end

local function restoreFonts(cx: WindowCx)
	local snapshot = tern.kv.get(snapshotKey)
	if not snapshot or not snapshot.active then
		return
	end
	local previous = {}
	for key, value in pairs(fonts) do
		-- A later manual choice belongs to the user, not this theme.
		if cx.settings:get(key) == value then
			previous[key] = snapshot.previous[key]
		end
	end
	if next(previous) then
		cx.settings:set_many(previous)
	end
	snapshot.active = false
	tern.kv.set(snapshotKey, snapshot)
end

tern.on("window_start", function(cx: WindowCx)
	-- Apply once per installation's retained plugin data, not on every reload.
	if tern.kv.get(snapshotKey) == nil then
		applyFonts(cx)
	end
end)

tern.command({
	id = "apply-fonts",
	title = "Apply Kami fonts / 应用 Kami 字体",
	run = function(cx: WindowCx)
		applyFonts(cx)
		cx:toast("info", "Kami fonts applied / 已应用 Kami 字体")
	end,
})

tern.command({
	id = "restore-fonts",
	title = "Restore previous fonts / 恢复原字体",
	available = function(_cx: WindowCx)
		local snapshot = tern.kv.get(snapshotKey)
		return snapshot ~= nil and snapshot.active == true
	end,
	run = function(cx: WindowCx)
		restoreFonts(cx)
		cx:toast("info", "Previous fonts restored; manual choices kept / 已恢复原字体，保留手动更改")
	end,
})
