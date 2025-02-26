# sc_textUI
A simple UI for FiveM that works with all frameworks.

![Screenshot 2025-01-27 164230](https://github.com/user-attachments/assets/b6290534-9144-40bc-a8ba-c8d3e596c699)

> [!TIP]
> If you want to replace our textUI with the normal one from ESX, replace the code here: esx_textui/TextUI.lua

<details>
<summary>Code to replace:</summary>
<br>

## Old Code:
### esx_textui/TextUI.lua

```lua
Debug = ESX.GetConfig().EnableDebug
local isShowing = false
---@param message string
---@param typ string
local function TextUI(message, typ)
    isShowing = true
    SendNUIMessage({
        action = "show",
        message = message and message or "ESX-TextUI",
        type = type(typ) == "string" and typ or "info",
    })
end

local function HideUI()
    if not isShowing then
        return
    end
    isShowing = false
    SendNUIMessage({
        action = "hide",
    })
end

exports("TextUI", TextUI)
exports("HideUI", HideUI)
ESX.SecureNetEvent("ESX:TextUI", TextUI)
ESX.SecureNetEvent("ESX:HideUI", HideUI)

if Debug then
    RegisterCommand("textui:error", function()
        ESX.TextUI("i ~r~love~s~ donuts", "error")
    end, false)

    RegisterCommand("textui:success", function()
        ESX.TextUI("i ~g~love~s~ donuts", "success")
    end, false)

    RegisterCommand("textui:info", function()
        ESX.TextUI("i ~b~love~s~ donuts", "info")
    end, false)

    RegisterCommand("textui:hide", function()
        ESX.HideUI()
    end, false)
end
```

## New Code:
### esx_textui/TextUI.lua

```lua
Debug = ESX.GetConfig().EnableDebug
local isShowing = false

---@param message string
local function TextUI(message)
    isShowing = true
    local key, text = message:match("%[(%w)%]%s*(.*)")

    if not key then
        key = "default"
        text = message
    end

    exports.sc_textUI:showUI(key, text)
end

local function HideUI()
    if not isShowing then
        return
    end
    isShowing = false
    exports.sc_textUI:hideUI()
end

exports("TextUI", TextUI)
exports("HideUI", HideUI)
ESX.SecureNetEvent("ESX:TextUI", TextUI)
ESX.SecureNetEvent("ESX:HideUI", HideUI)

if Debug then
    RegisterCommand("textui:test", function()
        TextUI("Press [E] to use")
    end, false)

    RegisterCommand("textui:hide", function()
        HideUI()
    end, false)
end
```

</details>

## Usage client.lua

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

## Usage server.lua

#### Show UI with text and key
```lua
TriggerClientEvent("sc_textUI:showUI", playerId, key, message)

-- example

TriggerClientEvent("sc_textUI:showUI", playerId, "E", "Press to interact")
```

#### Hide UI
```lua
TriggerClientEvent("sc_textUI:hideUI", playerId)
```

#### Example script (client.lua)
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

Add sc_textUI to your resources directory

Add this in your server.cfg :
```
ensure sc_textUI
```

» You want more? Come to my [Discord Server](https://discord.gg/Mqgewse3Yc)
