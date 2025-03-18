-- Reload config hotkey
hs.hotkey.bind({ "alt" }, "R", function()
    hs.reload()
end)
hs.alert.show("Hammerspoon config loaded")

-- SpoonInstall
hs.loadSpoon("SpoonInstall")

-- Spoon: LeftRightHotkey
require("modules.leftRightHotkey")

spoon.LeftRightHotkey:bind({ "rcmd" }, 'x', function()
    hs.execute("~/.nix-profile/bin/code ~/.config/nix-darwin")
end)

-- Spoon: ClipboardTool
spoon.SpoonInstall:andUse("ClipboardTool", {
    start = true,
    config = {
        hist_size = 500,
        paste_on_select = false,
        show_copied_alert = false
    },
    hotkeys = {
        toggle_clipboard = { { "cmd", "alt" }, "v" }
    }
})

-- Spoon: WindowHalfsAndThirds
local windowsHalfAndThirdsHotkeys = {
    left_half    = { { "ctrl", "alt" }, "Left" },
    right_half   = { { "ctrl", "alt" }, "Right" },
    top_half     = { { "ctrl", "alt" }, "Up" },
    bottom_half  = { { "ctrl", "alt" }, "Down" },
    third_left   = { { "ctrl", "cmd" }, "Left" },
    third_right  = { { "ctrl", "cmd" }, "Right" },
    third_up     = { { "ctrl", "cmd" }, "Up" },
    third_down   = { { "ctrl", "cmd" }, "Down" },
    top_left     = { { "ctrl", "alt" }, "l" },
    top_right    = { { "ctrl", "alt" }, "u" },
    bottom_left  = { { "ctrl", "alt" }, "n" },
    bottom_right = { { "ctrl", "alt" }, "e" },
    max_toggle   = { { "ctrl", "alt" }, "return" },
    max          = { { "ctrl", "alt", "cmd" }, "Up" },
    undo         = { { "alt", "cmd" }, "z" },
    center       = { { "ctrl", "alt" }, "c" },
    larger       = { { "ctrl", "alt", }, "=" },
    smaller      = { { "ctrl", "alt", }, "-" },
}
spoon.SpoonInstall:andUse("WindowHalfsAndThirds", { hotkeys = windowsHalfAndThirdsHotkeys })
