-- Reload config
hs.hotkey.bind({ "alt" }, "R", function()
    hs.reload()
end)
hs.alert.show("Hammerspoon config loaded")

-- SpoonInstall
hs.loadSpoon("SpoonInstall")

require("modules.leftRightHotkey")

spoon.LeftRightHotkey:bind({ "rcmd" }, 'x', function()
    hs.execute("~/.nix-profile/bin/code ~/.config/nix-darwin")
end)

-- LeftRightHotkey
-- spoon.SpoonInstall:andUse("LeftRightHotkey", {
--     start = true,
-- })

-- -- AppLauncher
-- local mapping = {
--     b = "Brave Browser",
--     c = "Visual Studio Code",
--     f = "Finder",
--     g = "Signal",
--     h = "ChatGPT",
--     l = "LibreWolf",
--     m = "Proton Mail",
--     n = "Simplenote",
--     o = "Obsidian",
--     s = "Slack",
--     t = "Ghostty",
--     v = "Vivaldi"
-- }
-- local function mapKeyToApp(mappingTable)
--     for letter, app in pairs(mappingTable) do
--         spoon.LeftRightHotkey:bind({ "rcmd" }, letter, function()
--             hs.application.launchOrFocus(app)
--         end)
--     end
-- end
-- mapKeyToApp(mapping)

-- spoon.LeftRightHotkey:bind({ "rcmd" }, "x",
--     function()
--         hs.execute("~/.nix-profile/bin/code ~/.config/nix-darwin")
--     end
-- )

-- spoon.LeftRightHotkey:bind({ "rcmd" }, "l",
--     function()
--         hs.alert.show("Right Command + l")
--     end
-- )
-- spoon.LeftRightHotkey:bind({ "rcmd" }, "g",
--     function()
--         hs.alert.show("Right Command + g")
--     end
-- )



-- spoon.SpoonInstall:andUse("AppLauncher", {
--     modifiers = { "cmd" },
--     hotkeys = {
--         c = "Calendar",
--         g = "Signal",
--         l = "LibreWolf",
--         --   d = "Discord",
--         --   f = "Firefox Developer Edition",
--         --   n = "Notes",
--         --   p = "1Password 7",
--         --   r = "Reeder",
--         t = "Ghostty",
--         v = "Visual Studio Code",
--         --   z = "Zoom.us",
--     }
-- })






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




-- -- Function to check if the right Command key is pressed
-- function isRightCmdPressed()
--     local modifiers = hs.eventtap.checkKeyboardModifiers()
--     return modifiers["rightcmd"]
-- end

-- -- Bind the hotkey for Command + R
-- hs.hotkey.bind({ "cmd" }, "r", function()
--     if isRightCmdPressed() then
--         hs.alert.show("OOOO!")
--     end
-- end)



--
-- s = hs.screen.mainScreen()
-- -- s:fullFrame()
-- hs.alert.show("Screen frame: " ..
-- s:fullFrame().x .. ", " .. s:fullFrame().y .. ", " .. s:fullFrame().w .. ", " .. s:fullFrame().h)
-- -- s:name()
-- hs.alert.show("Screen name: " .. s:name())

--
-- hs.screen.watcher.newWithActiveScreen(function()
--     local screens = hs.screen.allScreens()
--     local externalScreen = nil
--     local builtinScreen = hs.screen.primaryScreen()

--     -- Identify external screen
--     for _, screen in ipairs(screens) do
--         if screen ~= builtinScreen then
--             externalScreen = screen
--             break
--         end
--     end

--     -- If external monitor is connected
--     if externalScreen then
--         hs.alert.show("External monitor connected")
--         local vsCode = hs.application.find("Visual Studio Code")
--         hs.alert.show("VS Code found")
--         local ghostty = hs.application.find("Ghostty")
--         hs.alert.show("Ghostty found")
--         local brave = hs.application.find("Brave Browser")
--         hs.alert.show("Brave found")

--         -- VS Code: left 2/3 of external screen
--         if vsCode then
--             vsCode:mainWindow():moveToUnit({ x = 0, y = 0, w = 2 / 3, h = 1 }, externalScreen)
--         end

--         -- Ghostty: right 1/3 of external screen
--         if ghostty then
--             ghostty:mainWindow():moveToUnit({ x = 2 / 3, y = 0, w = 1 / 3, h = 1 }, externalScreen)
--         end

--         -- Brave: Fullscreen on builtin display
--         if brave then
--             brave:mainWindow():moveToScreen(builtinScreen)
--             brave:mainWindow():toggleFullScreen()
--         end
--     end
-- end):start()
