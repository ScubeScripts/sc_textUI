-- Funktion, um die UI für einen spezifischen Spieler zu zeigen
function ShowTextUIForPlayer(source, key, text)
    TriggerClientEvent("sc_textUI:showUI", source, key, text)
end

-- Funktion, um die UI für einen spezifischen Spieler zu verstecken
function HideTextUIForPlayer(source)
    TriggerClientEvent("sc_textUI:hideUI", source)
end
