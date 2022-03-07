-- =============== vRP Variables ================--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

-- ================== Bind interface ==================--

src = {}
Tunnel.bindInterface("dz_skill", src)
vSERVER = Tunnel.getInterface("dz_skill")

-- ==================== Functions ====================--

-- Open Nui
local menuEnabled = false

function openMenu(name, status)
    menuEnabled = not menuEnabled
    if menuEnabled then
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "showMenu"
        })
    else
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = "hideMenu"
        })
    end
end

-- ==================== Commands ====================--

-- ==================== Speed ====================--

Citizen.CreateThread(function()
    local ped = PlayerPedId()
    local level = vSERVER.getAthleticsLevel(ped)
    if level == 2 then
        SetRunSprintMultiplierForPlayer(ped, 1.03)
    else
        if level == 3 then
            SetRunSprintMultiplierForPlayer(ped, 1.08)
        else
            if level == 4 then
                SetRunSprintMultiplierForPlayer(ped, 1.12)
            else
                if level == 5 then
                    SetRunSprintMultiplierForPlayer(ped, 1.15)
                else
                    if level == 6 then
                        SetRunSprintMultiplierForPlayer(ped, 1.17)
                    else
                        if level == 7 then
                            SetRunSprintMultiplierForPlayer(ped, 1.18)
                        else
                            if level == 8 then
                                SetRunSprintMultiplierForPlayer(ped, 1.19)
                            else
                                if level == 9 then
                                    SetRunSprintMultiplierForPlayer(ped, 1.24)
                                else
                                    if level == 10 then
                                        SetRunSprintMultiplierForPlayer(ped, 1.29)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

RegisterNetEvent("dz_skill:speedChance")
AddEventHandler("dz_skill:speedChance", function ()
    local ped = PlayerPedId()
    local level = vSERVER.getAthleticsLevel(ped)
    if level == 2 then
        SetRunSprintMultiplierForPlayer(ped, 1.03)
    else
        if level == 3 then
            SetRunSprintMultiplierForPlayer(ped, 1.08)
        else
            if level == 4 then
                SetRunSprintMultiplierForPlayer(ped, 1.12)
            else
                if level == 5 then
                    SetRunSprintMultiplierForPlayer(ped, 1.15)
                else
                    if level == 6 then
                        SetRunSprintMultiplierForPlayer(ped, 1.17)
                    else
                        if level == 7 then
                            SetRunSprintMultiplierForPlayer(ped, 1.18)
                        else
                            if level == 8 then
                                SetRunSprintMultiplierForPlayer(ped, 1.19)
                            else
                                if level == 9 then
                                    SetRunSprintMultiplierForPlayer(ped, 1.24)
                                else
                                    if level == 10 then
                                        SetRunSprintMultiplierForPlayer(ped, 1.29)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)