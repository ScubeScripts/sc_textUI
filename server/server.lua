function ShowTextUIForPlayer(source, key, text)
    TriggerClientEvent("sc_textUI:showUI", source, key, text)
end

function HideTextUIForPlayer(source)
    TriggerClientEvent("sc_textUI:hideUI", source)
end
