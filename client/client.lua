local display = false

function ShowTextUI(key, text)
    SendNUIMessage({
        type = "ui",
        display = true,
        key = key,
        text = text
    })
    display = true
end

function HideTextUI()
    SendNUIMessage({
        type = "ui",
        display = false
    })
    display = false
end

exports("showUI", function(key, text)
    ShowTextUI(key, text)
end)

exports("hideUI", function()
    HideTextUI()
end)

RegisterNetEvent("sc_textUI:showUI", function(key, text)
    ShowTextUI(key, text)
end)

RegisterNetEvent("sc_textUI:hideUI", function()
    HideTextUI()
end)

