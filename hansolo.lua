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
        local id = vSERVER.getPlayerId()
        local skill = vSERVER.getSkillsLevel()
        local mechanic_porcent = vSERVER.getMechanicNextLevelPorcent()
        local steal_porcent = vSERVER.getStealNextLevelPorcent()
        local athletics_porcent = vSERVER.getAthleticsNextLevelPorcent()
        local swimming_porcent = vSERVER.getSwimmingNextLevelPorcent()
        local strenght_porcent = vSERVER.getStrenghtNextLevelPorcent()
        local shooter_porcent = vSERVER.getShooterNextLevelPorcent()
        local lung_porcent = vSERVER.getLungNextLevelPorcent()
        local chemistry_porcent = vSERVER.getChemistryNextLevelPorcent()
        local agriculture_porcent = vSERVER.getAgricultureNextLevelPorcent()
        local metallurgy_porcent = vSERVER.getMetallurgyNextLevelPorcent()
        local sewing_porcent = vSERVER.getSewingNextLevelPorcent()
        local fishing_porcent = vSERVER.getFishingNextLevelPorcent()
        local mining_porcent = vSERVER.getMiningNextLevelPorcent()
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "showMenu",
            mechanic_lvl = skill.mechanic_lvl,
            mechanic_porcent = mechanic_porcent,
            steal_lvl = skill.steal_lvl,
            steal_porcent = steal_porcent,
            athletics_lvl = skill.athletics_lvl,
            athletics_porcent = athletics_porcent,
            swimming_lvl = skill.swimming_lvl,
            swimming_porcent = swimming_porcent,
            strenght_lvl = skill.strenght_lvl,
            strenght_porcent = strenght_porcent,
            shooter_lvl = skill.shooter_lvl,
            shooter_porcent = shooter_porcent,
            lung_lvl = skill.lung_lvl,
            lung_porcent = lung_porcent,
            chemistry_lvl = skill.chemistry_lvl,
            chemistry_porcent = chemistry_porcent,
            agriculture_lvl = skill.agriculture_lvl,
            agriculture_porcent = agriculture_porcent,
            metallurgy_lvl = skill.metallurgy_lvl,
            metallurgy_porcent = metallurgy_porcent,
            sewing_lvl = skill.sewing_lvl,
            sewing_porcent = sewing_porcent,
            fishing_lvl = skill.fishing_lvl,
            fishing_porcent = fishing_porcent,
            mining_lvl = skill.mining_lvl,
            mining_porcent = mining_porcent
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

