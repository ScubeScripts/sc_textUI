local display = false

-- Funktion zum Anzeigen der TextUI
function ShowTextUI(key, text)
    SendNUIMessage({
        type = "ui",
        display = true,
        key = key,
        text = text
    })
    display = true
end

-- Funktion zum Verstecken der TextUI
function HideTextUI()
    SendNUIMessage({
        type = "ui",
        display = false
    })
    display = false
end

-- Export-Funktionen für andere Client-Skripte
exports("showUI", function(key, text)
    ShowTextUI(key, text)
end)

exports("hideUI", function()
    HideTextUI()
end)

-- Event, um die UI vom Server zu steuern
RegisterNetEvent("sc_textUI:showUI", function(key, text)
    ShowTextUI(key, text)
end)

RegisterNetEvent("sc_textUI:hideUI", function()
    HideTextUI()
end)

