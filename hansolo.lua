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

function nuiAction()
    menuEnabled = not menuEnabled
    if menuEnabled then
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "showMenu",
            mechanic_lvl = 1,
            mechanic_porcent = 1,
            steal_lvl = 1,
            steal_porcent = 1,
            athletics_lvl = 1,
            athletics_porcent = 1,
            swimming_lvl = 1,
            swimming_porcent = 1,
            strenght_lvl = 1,
            strenght_porcent = 1,
            shooter_lvl = 1,
            shooter_porcent = 1,
            lung_lvl = 1,
            lung_porcent = 1,
            chemistry_lvl = 1,
            chemistry_porcent = 1,
            agriculture_lvl = 1,
            agriculture_porcent = 1,
            metallurgy_lvl = 1,
            metallurgy_porcent = 1,
            sewing_lvl = 1,
            sewing_porcent = 1,
            fishing_lvl = 1,
            fishing_porcent = 1,
            mining_lvl = 1,
            mining_porcent = 1
        })
    else
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = "hideMenu"
        })
    end
end

--NUI Callback
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "fechar" then
		nuiAction()
	end
end)

-- ==================== Commands ====================--

RegisterCommand('skill', function() 
    nuiAction();
end)

-- ==================== Speed ====================--

Citizen.CreateThread(function()
    local ped = PlayerPedId()
    local id = vSERVER.getPlayerId()
    Citizen.Wait(2000)
    if vSERVER.checkSkillDb(id) then
        local level = vSERVER.getAthleticsLevel(id)
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
    end
end)

RegisterNetEvent("dz_skill:speedChance")
AddEventHandler("dz_skill:speedChance", function ()
    local ped = PlayerPedId()
    local id = vSERVER.getPlayerId()
    local level = vSERVER.getAthleticsLevel(id)
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

-- ==================== Swim ====================--

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    local ped = PlayerPedId()
    local id = vSERVER.getPlayerId()
    print(vSERVER.checkSkillDb(id))
    if vSERVER.checkSkillDb(id) then
    local level = vSERVER.getSwimmingLevel(id)
        if level == 2 then
            SetSwimMultiplierForPlayer(ped, 1.03)
        else
            if level == 3 then
                SetSwimMultiplierForPlayer(ped, 1.08)
            else
                if level == 4 then
                    SetSwimMultiplierForPlayer(ped, 1.12)
                else
                    if level == 5 then
                        SetSwimMultiplierForPlayer(ped, 1.15)
                    else
                        if level == 6 then
                            SetSwimMultiplierForPlayer(ped, 1.17)
                        else
                            if level == 7 then
                                SetSwimMultiplierForPlayer(ped, 1.18)
                            else
                                if level == 8 then
                                    SetSwimMultiplierForPlayer(ped, 1.19)
                                else
                                    if level == 9 then
                                        SetSwimMultiplierForPlayer(ped, 1.24)
                                    else
                                        if level == 10 then
                                            SetSwimMultiplierForPlayer(ped, 1.29)
                                        end
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

RegisterNetEvent("dz_skill:swimChance")
AddEventHandler("dz_skill:swimChance", function ()
    local ped = PlayerPedId()
    local id = vSERVER.getPlayerId()
    local level = vSERVER.getSwimmingLevel(id)
    if level == 2 then
        SetSwimMultiplierForPlayer(ped, 1.03)
    else
        if level == 3 then
            SetSwimMultiplierForPlayer(ped, 1.08)
        else
            if level == 4 then
                SetSwimMultiplierForPlayer(ped, 1.12)
            else
                if level == 5 then
                    SetSwimMultiplierForPlayer(ped, 1.15)
                else
                    if level == 6 then
                        SetSwimMultiplierForPlayer(ped, 1.17)
                    else
                        if level == 7 then
                            SetSwimMultiplierForPlayer(ped, 1.18)
                        else
                            if level == 8 then
                                SetSwimMultiplierForPlayer(ped, 1.19)
                            else
                                if level == 9 then
                                    SetSwimMultiplierForPlayer(ped, 1.24)
                                else
                                    if level == 10 then
                                        SetSwimMultiplierForPlayer(ped, 1.29)
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

-- =================== AddExp ===================--

Citizen.CreateThread(function ()
    local ped = PlayerPedId()
    local id = PlayerId()
    while true do
        if IsPedSwimming(ped) then
            print("swing")
            vSERVER.addSwimmingExp(id, 2)
        end
        if IsPedSwimmingUnderWater(ped) then
            print("swingunderwater")
            vSERVER.addLungExp(id, 2)
        end
        if IsPedRunning(ped) then
            print("runnin")
            vSERVER.addAthletcsExp(id, 1)
        end
        if IsPedInMeleeCombat(ped) then
            print("melee")
            vSERVER.addStrenghtExp(id, 2)
        end
        Citizen.Wait(5000)
    end
end)

