-- =============== vRP Variables ================--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

-- =================== SQL CONNECT ===================--

vRP._prepare("creative/get_skill_level", "SELECT * FROM dz_skill WHERE user_id = @user")
vRP._prepare("creative/add_exp_mechanic",
    "UPDATE dz_skill SET mechanic_exp = mechanic_exp + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_lvl_mechanic",
    "UPDATE dz_skill SET mechanic_lvl = mechanic_lvl + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_exp_steal", "UPDATE dz_skill SET steal_exp = steal_exp + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_lvl_steal", "UPDATE dz_skill SET steal_lvl = steal_lvl + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_exp_athletics",
    "UPDATE dz_skill SET athletics_exp = athletics_exp + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_lvl_athletics",
    "UPDATE dz_skill SET athletics_lvl = athletics_lvl + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_exp_swimming",
    "UPDATE dz_skill SET swimming_exp = swimming_exp + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_lvl_swimming",
    "UPDATE dz_skill SET swimming_lvl = swimming_lvl + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_exp_strenght",
    "UPDATE dz_skill SET strenght_exp = strenght_exp + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_lvl_strenght",
    "UPDATE dz_skill SET strenght_lvl = strenght_lvl + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_exp_shooter",
    "UPDATE dz_skill SET shooter_exp = shooter_exp + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_lvl_shooter",
    "UPDATE dz_skill SET shooter_lvl = shooter_lvl + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_exp_lung", "UPDATE dz_skill SET lung_exp = lung_exp + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_lvl_lung", "UPDATE dz_skill SET lung_lvl = lung_lvl + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_exp_chemistry",
    "UPDATE dz_skill SET chemistry_exp = chemistry_exp + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_lvl_chemistry",
    "UPDATE dz_skill SET chemistry_lvl = chemistry_lvl + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_exp_agriculture",
    "UPDATE dz_skill SET agriculture_exp = agriculture_exp + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_lvl_agriculture",
    "UPDATE dz_skill SET agriculture_lvl = agriculture_lvl + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_exp_metallurgy",
    "UPDATE dz_skill SET metallurgy_exp = metallurgy_exp + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_lvl_metallurgy",
    "UPDATE dz_skill SET metallurgy_lvl = metallurgy_lvl + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_exp_sewing", "UPDATE dz_skill SET sewing_exp = sewing_exp + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_lvl_sewing", "UPDATE dz_skill SET sewing_lvl = sewing_lvl + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_exp_fishing",
    "UPDATE dz_skill SET fishing_exp = fishing_exp + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_lvl_fishing",
    "UPDATE dz_skill SET fishing_lvl = fishing_lvl + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_exp_mining", "UPDATE dz_skill SET mining_exp = mining_exp + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_lvl_mining", "UPDATE dz_skill SET mining_lvl = mining_lvl + @value WHERE user_id = @user_id")
vRP._prepare("creative/add_new_player", "INSERT INTO dz_skill (user_id) VALUES (@user_id)")
vRP._prepare("creative/set_level_mechanic", "UPDATE dz_skill SET mechanic_lvl = @lvl WHERE user_id = @user_id")
vRP._prepare("creative/set_level_steal", "UPDATE dz_skill SET steal_lvl = @lvl WHERE user_id = @user_id")
vRP._prepare("creative/set_level_athletics", "UPDATE dz_skill SET athletics_lvl = @lvl WHERE user_id = @user_id")
vRP._prepare("creative/set_level_swimming", "UPDATE dz_skill SET swimming_lvl = @lvl WHERE user_id = @user_id")
vRP._prepare("creative/set_level_strenght", "UPDATE dz_skill SET strenght_lvl = @lvl WHERE user_id = @user_id")
vRP._prepare("creative/set_level_shooter", "UPDATE dz_skill SET shooter_lvl = @lvl WHERE user_id = @user_id")
vRP._prepare("creative/set_level_lung", "UPDATE dz_skill SET lung_lvl = @lvl WHERE user_id = @user_id")
vRP._prepare("creative/set_level_chemistry", "UPDATE dz_skill SET chemistry_lvl = @lvl WHERE user_id = @user_id")
vRP._prepare("creative/set_level_agriculture", "UPDATE dz_skill SET agriculture_lvl = @lvl WHERE user_id = @user_id")
vRP._prepare("creative/set_level_metallurgy", "UPDATE dz_skill SET metallurgy_lvl = @lvl WHERE user_id = @user_id")
vRP._prepare("creative/set_level_sewing", "UPDATE dz_skill SET sewing_lvl = @lvl WHERE user_id = @user_id")
vRP._prepare("creative/set_level_fishing", "UPDATE dz_skill SET fishing_lvl = @lvl WHERE user_id = @user_id")
vRP._prepare("creative/set_level_mining", "UPDATE dz_skill SET mining_lvl = @lvl WHERE user_id = @user_id")

-- ================== Bind interface ==================--

src = {}
Tunnel.bindInterface("dz_skill", src)
vCLIENT = Tunnel.getInterface("dz_skill")

-- ==================== Functions ====================--

-- Get Levels
function src.getSkillsLevel(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1]
        else
            return ""
        end
    else
        return ""
    end
end

function src.getMechanicLevel(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].mechanic_lvl
        else
            return 1
        end
    else
        return 1
    end
end

function src.getStealLevel(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].steal_lvl
        else
            return 1
        end
    else
        return 1
    end
end

function src.getAthleticsLevel(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].athletics_lvl
        else
            return 1
        end
    else
        return 1
    end
end

function src.getSwimmingLevel(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].swimming_lvl
        else
            return 1
        end
    else
        return 1
    end
end

function src.getStrenghtLevel(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].strenght_lvl
        else
            return 1
        end
    else
        return 1
    end
end

function src.getShooterLevel(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].shooter_lvl
        else
            return 1
        end
    else
        return 1
    end
end

function src.getLungLevel(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].lung_lvl
        else
            return 1
        end
    else
        return 1
    end
end

function src.getChemistryLevel(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].chemistry_lvl
        else
            return 1
        end
    else
        return 1
    end
end

function src.getAgricultureLevel(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].agriculture_lvl
        else
            return 1
        end
    else
        return 1
    end
end

function src.getMetallurgyLevel(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].metallurgy_lvl
        else
            return 1
        end
    else
        return 1
    end
end

function src.getSewingLevel(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].sewing_lvl
        else
            return 1
        end
    else
        return 1
    end
end

function src.getFishingLevel(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].fishing_lvl
        else
            return 1
        end
    else
        return 1
    end
end

function src.getMiningLevel(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].mining_lvl
        else
            return 1
        end
    else
        return 1
    end
end

-- Get Exp
function src.getMechanicExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].mechanic_exp
        else
            return 1
        end
    else
        return 1
    end
end

function src.getStealExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].steal_exp
        else
            return 1
        end
    else
        return 1
    end
end

function src.getAthleticsExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].athletics_exp
        else
            return 1
        end
    else
        return 1
    end
end

function src.getSwimmingExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].swimming_exp
        else
            return 1
        end
    else
        return 1
    end
end

function src.getStrenghtExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].strenght_exp
        else
            return 1
        end
    else
        return 1
    end
end

function src.getShooterExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].shooter_exp
        else
            return 1
        end
    else
        return 1
    end
end

function src.getLungExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].lung_exp
        else
            return 1
        end
    else
        return 1
    end
end

function src.getChemistryExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].chemistry_exp
        else
            return 1
        end
    else
        return 1
    end
end

function src.getAgricultureExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].agriculture_exp
        else
            return 1
        end
    else
        return 1
    end
end

function src.getMetallurgyExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].metallurgy_exp
        else
            return 1
        end
    else
        return 1
    end
end

function src.getSewingExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].sewing_exp
        else
            return 1
        end
    else
        return 1
    end
end

function src.getFishingExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].fishing_exp
        else
            return 1
        end
    else
        return 1
    end
end

function src.getMiningExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return query[1].mining_exp
        else
            return 1
        end
    else
        return 1
    end
end

-- Get Porcent
function src.getMechanicNextLevelPorcent(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return getPorcentForNextLevel(query[1].mechanic_exp)
        else
            return 1
        end
    else
        return 1
    end
end

function src.getStealNextLevelPorcent(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return getPorcentForNextLevel(query[1].steal_exp)
        else
            return 1
        end
    else
        return 1
    end
end

function src.getAthleticsNextLevelPorcent(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return getPorcentForNextLevel(query[1].athletics_exp)
        else
            return 1
        end
    else
        return 1
    end
end

function src.getSwimmingNextLevelPorcent(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return getPorcentForNextLevel(query[1].swimming_exp)
        else
            return 1
        end
    else
        return 1
    end
end

function src.getStrenghtNextLevelPorcent(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return getPorcentForNextLevel(query[1].strenght_exp)
        else
            return 1
        end
    else
        return 1
    end
end

function src.getShooterNextLevelPorcent(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return getPorcentForNextLevel(query[1].shooter_exp)
        else
            return 1
        end
    else
        return 1
    end
end

function src.getLungNextLevelPorcent(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return getPorcentForNextLevel(query[1].lung_exp)
        else
            return 1
        end
    else
        return 1
    end
end

function src.getChemistryNextLevelPorcent(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return getPorcentForNextLevel(query[1].chemistry_exp)
        else
            return 1
        end
    else
        return 1
    end
end

function src.getAgricultureNextLevelPorcent(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return getPorcentForNextLevel(query[1].agriculture_exp)
        else
            return 1
        end
    else
        return 1
    end
end

function src.getMetallurgyNextLevelPorcent(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return getPorcentForNextLevel(query[1].metallurgy_exp)
        else
            return 1
        end
    else
        return 1
    end
end

function src.getSewingNextLevelPorcent(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return getPorcentForNextLevel(query[1].sewing_exp)
        else
            return 1
        end
    else
        return 1
    end
end

function src.getFishingNextLevelPorcent(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return getPorcentForNextLevel(query[1].fishing_exp)
        else
            return 1
        end
    else
        return 1
    end
end

function src.getMiningNextLevelPorcent(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            return getPorcentForNextLevel(query[1].mining_exp)
        else
            return 1
        end
    else
        return 1
    end
end

-- Add Exp
function src.addMechanicExp(id, value)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            vRP.execute("creative/add_exp_mechanic", {
                value = exp,
                user_id = id
            })
            updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "mechanic", id)
            return 1
        else
            local add = addNewPlayer(id)
            if add then
                vRP.execute("creative/add_exp_mechanic", {
                    value = exp,
                    user_id = id
                })
                updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "mechanic", id)
                return 1
            end
        end
        return 0
    else
        return 0
    end
end

function src.addStealExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            vRP.execute("creative/add_exp_steal", {
                value = exp,
                user_id = id
            })
            updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "steal", id)
            return 1
        else
            local add = addNewPlayer(id)
            if add then
                vRP.execute("creative/add_exp_steal", {
                    value = exp,
                    user_id = id
                })
                updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "steal", id)
                return 1
            end
        end
        return 0
    else
        return 0
    end
end

function src.addAthleticsExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            vRP.execute("creative/add_exp_athletics", {
                value = exp,
                user_id = id
            })
            updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "athletics", id)
            return 1
        else
            local add = addNewPlayer(id)
            if add then
                vRP.execute("creative/add_exp_athletics", {
                    value = exp,
                    user_id = id
                })
                updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "athletics", id)
                return 1
            end
        end
        return 0
    else
        return 0
    end
end

function src.addSwimmingExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            vRP.execute("creative/add_exp_swimming", {
                value = exp,
                user_id = id
            })
            updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "swimming", id)
            return 1
        else
            local add = addNewPlayer(id)
            if add then
                vRP.execute("creative/add_exp_swimming", {
                    value = exp,
                    user_id = id
                })
                updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "swimming", id)
                return 1
            end
        end
        return 0
    else
        return 0
    end
end

function src.addStrenghtExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            vRP.execute("creative/add_exp_strenght", {
                value = exp,
                user_id = id
            })
            updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "strenght", id)
            return 1
        else
            local add = addNewPlayer(id)
            if add then
                vRP.execute("creative/add_exp_srenght", {
                    value = exp,
                    user_id = id
                })
                updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "strenght", id)
                return 1
            end
        end
        return 0
    else
        return 0
    end
end

function src.addShooterExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            vRP.execute("creative/add_exp_shooter", {
                value = exp,
                user_id = id
            })
            updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "shooter", id)
            return 1
        else
            local add = addNewPlayer(id)
            if add then
                vRP.execute("creative/add_exp_shooter", {
                    value = exp,
                    user_id = id
                })
                updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "shooter", id)
                return 1
            end
        end
        return 0
    else
        return 0
    end
end

function src.addLungExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            vRP.execute("creative/add_exp_lung", {
                value = exp,
                user_id = id
            })
            updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "lung", id)
            return 1
        else
            local add = addNewPlayer(id)
            if add then
                vRP.execute("creative/add_exp_lung", {
                    value = exp,
                    user_id = id
                })
                updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "lung", id)
                return 1
            end
        end
        return 0
    else
        return 0
    end
end

function src.addChemistryExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            vRP.execute("creative/add_exp_chemistry", {
                value = exp,
                user_id = id
            })
            updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "chemistry", id)
            return 1
        else
            local add = addNewPlayer(id)
            if add then
                vRP.execute("creative/add_exp_chemistry", {
                    value = exp,
                    user_id = id
                })
                updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "chemistry", id)
                return 1
            end
        end
        return 0
    else
        return 0
    end
end

function src.addAgricultureExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            vRP.execute("creative/add_exp_agriculture", {
                value = exp,
                user_id = id
            })
            updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "agriculture", id)
            return 1
        else
            local add = addNewPlayer(id)
            if add then
                vRP.execute("creative/add_exp_agriculture", {
                    value = exp,
                    user_id = id
                })
                updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "agriculture", id)
                return 1
            end
        end
        return 0
    else
        return 0
    end
end

function src.addMetallurgyExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            vRP.execute("creative/add_exp_metallurgy", {
                value = exp,
                user_id = id
            })
            updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "metallurgy", id)
            return 1
        else
            local add = addNewPlayer(id)
            if add then
                vRP.execute("creative/add_exp_metallurgy", {
                    value = exp,
                    user_id = id
                })
                updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "metallurgy", id)
                return 1
            end
        end
        return 0
    else
        return 0
    end
end

function src.addSewingExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            vRP.execute("creative/add_exp_sewing", {
                value = exp,
                user_id = id
            })
            updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "sewing", id)
            return 1
        else
            local add = addNewPlayer(id)
            if add then
                vRP.execute("creative/add_exp_sewing", {
                    value = exp,
                    user_id = id
                })
                updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "sewing", id)
                return 1
            end
        end
        return 0
    else
        return 0
    end
end

function src.addFishingExp(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            vRP.execute("creative/add_exp_fishing", {
                value = exp,
                user_id = id
            })
            updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "fishing", id)
            return 1
        else
            local add = addNewPlayer(id)
            if add then
                vRP.execute("creative/add_exp_fishing", {
                    value = exp,
                    user_id = id
                })
                updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "fishing", id)
                return 1
            end
        end
        return 0
    else
        return 0
    end
end

function src.addMiningExp(id, exp)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user = id
        })
        if query and query[1] and query[1].id > 0 then
            vRP.execute("creative/add_exp_mining", {
                value = exp,
                user_id = id
            })
            updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "mining", id)
            return 1
        else
            local add = addNewPlayer(id)
            if add then
                vRP.execute("creative/add_exp_mining", {
                    value = exp,
                    user_id = id
                })
                updateLevel(query[1].mechanic_lvl, query[1].mechanic_exp + exp, "mining", id)
                return 1
            end
        end
        return 0
    else
        return 0
    end
end

-- ================ Internal Functions ===============--

function checkLevel(exp)
    if exp then
        if exp >= 100 then
            if exp >= 300 then
                if exp >= 600 then
                    if exp >= 1000 then
                        if exp >= 1500 then
                            if exp >= 2100 then
                                if exp >= 2900 then
                                    if exp >= 3800 then
                                        if exp >= 5000 then
                                            return 10
                                        else
                                            return 9
                                        end
                                    else
                                        return 8
                                    end
                                else
                                    return 7
                                end
                            else
                                return 6
                            end
                        else
                            return 5
                        end
                    else
                        return 4
                    end
                else
                    return 3
                end
            else
                return 2
            end
        else
            return 1
        end
    end
    return 1
end

function getPorcentForNextLevel(exp)
    local level = checkLevel(exp)
    if level == 1 then
        local porcent = (exp * 100) / 100
        if porcent > 100 then
            return 100
        else
            local retorno = math.ceil(porcent)
            if retorno == 100 then
                return 99
            else
                return retorno
            end
        end
    else
        if level == 2 then
            local porcent = ((exp - 100) * 100) / (300 - 100)
            if porcent > 100 then
                return 100
            else
                local retorno = math.ceil(porcent)
                if retorno == 100 then
                    return 99
                else
                    return retorno
                end
            end
        else
            if level == 3 then
                local porcent = ((exp - 300) * 100) / (600 - 300)
                if porcent > 100 then
                    return 100
                else
                    local retorno = math.ceil(porcent)
                    if retorno == 100 then
                        return 99
                    else
                        return retorno
                    end
                end
            else
                if level == 4 then
                    local porcent = ((exp - 600) * 100) / (1000 - 600)
                    if porcent > 100 then
                        return 100
                    else
                        local retorno = math.ceil(porcent)
                        if retorno == 100 then
                            return 99
                        else
                            return retorno
                        end
                    end
                else
                    if level == 5 then
                        local porcent = ((exp - 1000) * 100) / (1500 - 1000)
                        if porcent > 100 then
                            return 100
                        else
                            local retorno = math.ceil(porcent)
                            if retorno == 100 then
                                return 99
                            else
                                return retorno
                            end
                        end
                    else
                        if level == 6 then
                            local porcent = ((exp - 1500) * 100) / (2100 - 1500)
                            if porcent > 100 then
                                return 100
                            else
                                local retorno = math.ceil(porcent)
                                if retorno == 100 then
                                    return 99
                                else
                                    return retorno
                                end
                            end
                        else
                            if level == 7 then
                                local porcent = ((exp - 2100) * 100) / (2900 - 2100)
                                if porcent > 100 then
                                    return 100
                                else
                                    local retorno = math.ceil(porcent)
                                    if retorno == 100 then
                                        return 99
                                    else
                                        return retorno
                                    end
                                end
                            else
                                if level == 8 then
                                    local porcent = ((exp - 2900) * 100) / (3800 - 2900)
                                    if porcent > 100 then
                                        return 100
                                    else
                                        local retorno = math.ceil(porcent)
                                        if retorno == 100 then
                                            return 99
                                        else
                                            return retorno
                                        end
                                    end
                                else
                                    if level == 9 then
                                        local porcent = ((exp - 3800) * 100) / (5000 - 3800)
                                        if porcent > 100 then
                                            return 100
                                        else
                                            local retorno = math.ceil(porcent)
                                            if retorno == 100 then
                                                return 99
                                            else
                                                return retorno
                                            end
                                        end
                                    else
                                        return 100
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

function addNewPlayer(id)
    if id then
        local query = vRP.execute("creative/get_skill_level", {
            user_id = id
        })
        if query and query[1] and query[1].id > 0 then
            return true
        else
            vRP.execute("creative/add_new_player", {
                user_id = id
            })
            return true
        end
    end
    return false
end

function updateLevel(currentLevel, exp, skill, id)
    local level = checkLevel(exp)
    if currentLevel < level then
        -- Update level in database
        if skill == "mechanic" then
            vRP.execute("creativ/set_level_mechanic", {
                lvl = lvel,
                user_id = id
            })
            return true
        end
        if skill == "steal" then
            vRP.execute("creativ/set_level_steal", {
                lvl = lvel,
                user_id = id
            })
            return true
        end
        if skill == "athletics" then
            vRP.execute("creativ/set_level_athletics", {
                lvl = lvel,
                user_id = id
            })
            return true
        end
        if skill == "swimming" then
            vRP.execute("creativ/set_level_swimming", {
                lvl = lvel,
                user_id = id
            })
            return true
        end
        if skill == "strenght" then
            vRP.execute("creativ/set_level_strenght", {
                lvl = lvel,
                user_id = id
            })
            return true
        end
        if skill == "shooter" then
            vRP.execute("creativ/set_level_shooter", {
                lvl = lvel,
                user_id = id
            })
            return true
        end
        if skill == "lung" then
            vRP.execute("creativ/set_level_lung", {
                lvl = lvel,
                user_id = id
            })
            return true
        end
        if skill == "chemistry" then
            vRP.execute("creativ/set_level_chemistry", {
                lvl = lvel,
                user_id = id
            })
            return true
        end
        if skill == "agriculture" then
            vRP.execute("creativ/set_level_agriculture", {
                lvl = lvel,
                user_id = id
            })
            return true
        end
        if skill == "metallurgy" then
            vRP.execute("creativ/set_level_metallurgy", {
                lvl = lvel,
                user_id = id
            })
            return true
        end
        if skill == "sewing" then
            vRP.execute("creativ/set_level_sewing", {
                lvl = lvel,
                user_id = id
            })
            return true
        end
        if skill == "fishing" then
            vRP.execute("creativ/set_level_fishing", {
                lvl = lvel,
                user_id = id
            })
            return true
        end
        if skill == "mining" then
            vRP.execute("creativ/set_level_mining", {
                lvl = lvel,
                user_id = id
            })
            return true
        end
        return false;
    end
end

-- Up to 2 need = 100Exp
-- Up to 3 need = 300Exp / 200
-- Up to 4 need = 600Exp / 300
-- Up to 5 need = 1000Exp / 400
-- Up to 6 need = 1500Exp / 500
-- Up to 7 need = 2100Exp / 600
-- Up to 8 need = 2900Exp / 800
-- Up to 9 need = 38000Exp / 900
-- Up to 10 need = 5000Exp / 1200
