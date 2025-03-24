spoon.SpoonInstall:andUse("LeftRightHotkey", {
    start = true,
})

local mapping = {
    b = "Brave Browser",
    c = "Visual Studio Code",
    f = "Finder",
    g = "Signal",
    h = "ChatGPT",
    k = "Slack",
    l = "LibreWolf",
    m = "Proton Mail",
    n = "Simplenote",
    o = "Obsidian",
    r = "Safari",
    s = "Slack",
    t = "Ghostty",
    v = "Vivaldi"
}

local function mapKeyToApp(mappingTable)
    for letter, app in pairs(mappingTable) do
        spoon.LeftRightHotkey:bind({ "rcmd" }, letter, function()
            hs.application.launchOrFocus(app)
        end)
    end
end

mapKeyToApp(mapping)
