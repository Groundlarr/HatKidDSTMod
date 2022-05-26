-- Old Simspeed method here, very glitchy https://pastebin.com/ErsU85Pp

local assets=
{ 
    Asset("ANIM", "anim/timestophat.zip"),

    Asset("ATLAS", "images/inventoryimages/timestophat.xml"),
    Asset("IMAGE", "images/inventoryimages/timestophat.tex"),
	
	Asset("SOUNDPACKAGE", "sound/timestophat.fev"),
    Asset("SOUND", "sound/timestophat.fsb"),
	
	Asset( "ANIM", "anim/hatkid_timestop.zip" ),
}

RegisterInventoryItemAtlas("images/inventoryimages/timestophat.xml","timestophat.tex")

local prefabs = 
{
}

local SHIELD_DURATION = 10 * FRAMES

local RESISTANCES =
{
    "_combat",
    "explosive",
    "quakedebris",
    "caveindebris",
    "trapdamage",
}

-------------------------------------------------------------------------------------------------------
local function SlowNear(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	local pt = owner:GetPosition()
	local range = 32  -- range of spell	
	local nags = { "character", "player" }
	local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, range, nil, nags, nil)
	for _,ent in ipairs(targets) do
			ent:AddTag("timeslowed")
			SetLocalTimeScale(nil, ent, TUNING.TIMESTOPHAT_TIMESCALE)
			if ent.slowed ~= nil then
				ent.slowed:Cancel()
			end
			
			-- The task below clears the TIME SLOW
			ent.slowed = ent:DoTaskInTime(.1, function(ent)
				ent:RemoveTag("timeslowed")
				SetLocalTimeScale(nil, ent, 1)
				ent.slowed = nil
			end)
	end
end

local function OnUse(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()

	-- Idea is we pass the remaining slow time to the entity, then make a task that clears it after the time ends.
	-- In addition, add slowed entities to a table, and tell them to stop being slowed early, as needed.
	
	-- Can we activate?
	if not inst.components.rechargeable:IsCharged() and inst.components.rechargeable:GetRechargeTime() == TUNING.TIMESTOPHAT_COOLDOWN then -- If charging and the time is the cooldown
		-- If in cooldown
		inst:DoTaskInTime(0, function(inst) -- Wait 1 frame or else things get weird
			inst.components.useableitem:StopUsingItem()
		end)
		
		-- owner:PushEvent("hatcooldown")
		owner.components.talker:Say(GetString(owner, "HAT_ONCOOLDOWN"))
		
	else
		-- Duration timer
		inst.components.rechargeable:Discharge(TUNING.TIMESTOPHAT_DURATION)

		-- Fuel
		if inst.components.fueled then
			inst.components.fueled:StartConsuming()
		end

		local function OnTakeDamage(inst)
			-- owner.components.combat:GetAttacked(inst, 0)
			owner.sg:GoToState("hit")

			inst:RemoveComponent("armor")
		end

		-- inst:AddComponent("armor")
		-- inst.components.armor:InitIndestructible(1)
		-- inst.components.armor.ontakedamage = OnTakeDamage
		
		--Sounds
		inst.SoundEmitter:PlaySound("timestophat/sound/activate")
		inst.SoundEmitter:PlaySound("timestophat/sound/loop", "timestoploop")

		-- Skin, move to hatkid prefab based on event listeners, so we're able to be used by other characters
		owner.oldskin = owner.AnimState:GetBuild()
		SetSkinsOnAnim(owner.AnimState, "hatkid_timestop", "hatkid_timestop", owner.components.skinner:GetClothing(), nil, "hatkid_timestop")

		-- Slow time, remake with updatelooper plz
		inst.TimeSlow = inst:DoPeriodicTask(0, SlowNear, nil)
		
	end
end

local function OnStopUse(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	
	-- Should be used to cancel the effects of OnUse, since this 
	
	if not inst.components.rechargeable:IsCharged() and inst.components.rechargeable:GetRechargeTime() == TUNING.TIMESTOPHAT_COOLDOWN then
		-- Shouldn't ever happen
	else
		-- Cancel Time Slow
		if inst.TimeSlow then
			inst.TimeSlow:Cancel()
		end

		inst.components.rechargeable:Discharge(TUNING.TIMESTOPHAT_COOLDOWN)

		if inst.components.fueled then
			inst.components.fueled:StopConsuming()
		end

		if inst.components.armor then
			inst:RemoveComponent("armor")
		end
		
		--Sounds
		inst.SoundEmitter:PlaySound("timestophat/sound/deactivate")
		inst.SoundEmitter:KillSound("timestoploop")
		
		--Revert back to default skin (as above, move to hk prefab)
		local default = owner.oldskin or "hatkid"
		SetSkinsOnAnim(owner.AnimState, default, default, owner.components.skinner:GetClothing(), nil, default)
		
		-- Stop the duration timer, if it exists
		-- if inst.components.timer:TimerExists("timehat_duration") then
		-- 	inst.components.timer:StopTimer("timehat_duration")
		-- end
	end
end

-------------------------------------------------------------------------------------------------------------

local function KeybindUse(inst)
	if inst:HasTag("inuse") then
		inst.components.useableitem:StopUsingItem()
	else
		inst.components.useableitem:StartUsingItem()
	end 
end

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_hat", "timestophat", "swap_hat")
			
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
end
 
local function OnUnequip(inst, owner)
------------------------------------------------------
	-- if inst.components.timer:TimerExists("timehat_duration") then
	-- 	inst.components.useableitem:StopUsingItem()
	-- end
------------------------------------------------------

	owner.AnimState:Hide("HAT")
	owner.AnimState:Hide("HAT_HAIR")
	owner.AnimState:Show("HAIR_NOHAT")
	owner.AnimState:Show("HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
end

local function OnEmpty(inst)
	inst.components.useableitem:StopUsingItem() -- And we'll make sure to stop the dweller effect

	inst:DoTaskInTime(0, inst.Remove)
end
 
local function fn(Sim) 
    local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
 
    inst:AddTag("hat")
    inst:AddTag("hatkidhat")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst.AnimState:SetBank("timestophat")
    inst.AnimState:SetBuild("timestophat")
    inst.AnimState:PlayAnimation("idle")
	
	MakeHauntableLaunch(inst)

----------------------------------------------------------------
	inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(OnUse)
    inst.components.useableitem:SetOnStopUseFn(OnStopUse)


--     inst:AddComponent("timer")

--     local function ontimerdone()
-- 		inst.components.useableitem:StopUsingItem()
-- 	end

--     inst:ListenForEvent("timerdone", ontimerdone)
-- ----------------------------------------------------------------
 
    inst:AddComponent("inspectable")
	
	-- inst:AddComponent("waterproofer")
    -- inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL)
	
	inst:AddComponent("insulator")
    inst.components.insulator:SetSummer()
    inst.components.insulator:SetInsulation(TUNING.INSULATION_SMALL)
	
    inst:AddComponent("inventoryitem")
    -- inst.components.inventoryitem.imagename = "timestophat"
    -- inst.components.inventoryitem.atlasname = "images/inventoryimages/timestophat.xml"
	
    inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "hatkid"
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("rechargeable")

	if TUNING.TIMESTOPHAT_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled.fueltype = FUELTYPE.MAGIC
		inst.components.fueled:InitializeFuelLevel( TUNING.TIMESTOPHAT_DURABILITY ) -- add tuning 300
		inst.components.fueled:SetDepletedFn(OnEmpty)
	end
	
	-- inst:AddComponent("container")
    -- inst.components.container:WidgetSetup("hkr_badgeslot")
	-- inst.components.container.canbeopened = false
    -- inst:ListenForEvent("itemget", OnBadgeLoaded)
    -- inst:ListenForEvent("itemlose", OnBadgeUnloaded)
	
	inst:ListenForEvent("AbilityKey", KeybindUse)
 
    return inst
end

return  Prefab("common/inventory/timestophat", fn, assets, prefabs)