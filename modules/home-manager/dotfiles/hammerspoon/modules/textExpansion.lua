local textExpansion = {}

local snippetMappings = {
    [":date"] = os.date("%Y-%m-%d"),
    [":ka"]   = "Kamil",
    [":ra"]   = "Radziszewski",
    [":kr"]   = "Kamil Radziszewski",
    [":dkr"]  = "Dziękuję\nKamil Radziszewski",
}

local typedString = ""
textExpansion.eventtap = nil

textExpansion.start = function()
    textExpansion.eventtap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
        local key = event:getCharacters(true)
        if key == nil then return end

        if key == "\b" then -- Handle delete key
            typedString = typedString:sub(1, -2)
            return
        elseif #key == 1 then
            typedString = typedString .. key
        end

        print("Typed so far: " .. typedString)

        if snippetMappings[typedString] then
            print("Expanding: " .. snippetMappings[typedString])

            -- Temporarily disable the eventtap to prevent recursion
            textExpansion.eventtap:stop()

            -- Erase the typed snippet
            for i = 1, #typedString do
                hs.eventtap.keyStroke({}, "delete", 0)
            end

            -- Insert the expanded snippet
            hs.eventtap.keyStrokes(snippetMappings[typedString])

            -- Reset the buffer
            typedString = ""

            -- Re-enable the eventtap
            hs.timer.doAfter(0.05, function()
                textExpansion.eventtap:start()
            end)
        end
    end)

    textExpansion.eventtap:start()
    print("Text expansion started!")
end

return textExpansion
