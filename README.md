# sc_textUI
A simple interaction UI for FiveM.
![Screenshot 2025-01-27 164230](https://github.com/user-attachments/assets/b6290534-9144-40bc-a8ba-c8d3e596c699)

## Usage

#### Show UI with text and key
```lua
exports.sc_textUI:showUI(key, message)

-- example

exports.sc_textUI:showUI("E", "Press to interact")
```

#### Hide UI
```lua
exports.sc_textUI:hideUI()
```

#### Example script
```lua
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if playerJob == 'police' then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, marker in ipairs(markers) do
                local distance = GetDistanceBetweenCoords(playerCoords, marker.x, marker.y, marker.z, true)

                if distance < 5.0 then
                    DrawMarker(1, marker.x, marker.y, marker.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 36, 144, 218, 0.8, false, true, 2, nil, nil, false)

                    if distance < 1.0 then
                        exports.sc_textUI:showUI("E", "Press to interact")

                        if IsControlJustPressed(0, 38) then
                            exports.sc_textUI:hideUI()
                            TriggerServerEvent('sc_lc:checkJobAndOpenMenu')
                        end
                    else
                        exports.sc_textUI:hideUI()
                    end
                end
            end
        end
    end
end)
```

## Installation
Clone or download this repository

Add sc_hud to your resources directory

Add this in your server.cfg :
```
ensure sc_textUI
```

» You want more? Come to my [Discord Server](https://discord.gg/Mqgewse3Yc)
