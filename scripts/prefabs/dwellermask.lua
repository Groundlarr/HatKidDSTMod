-- Oh man this sure is a rat nest of code. 

local assets=
{ 
    Asset("ANIM", "anim/dwellermask.zip"),
	Asset("ANIM", "anim/dwellermask_on.zip"),

    Asset("ATLAS", "images/inventoryimages/dwellermask.xml"),
    Asset("IMAGE", "images/inventoryimages/dwellermask.tex"),
	
	-- Asset("IMAGE", resolvefilepath("images/cc/dwellervision.tex")),
	Asset("IMAGE", resolvefilepath("images/cc/nd.tex")),

	Asset("SOUNDPACKAGE", "sound/dwellermask.fev"),
    Asset("SOUND", "sound/dwellermask.fsb"),
}

RegisterInventoryItemAtlas("images/inventoryimages/dwellermask.xml","dwellermask.tex")

local prefabs = 
{

}

local DWELLERVISION_COLOURCUBES_3 =
{
	-- These new cubes are easier on the eyes, previous ones were very harsh green.

--  Playtesters actually missed the harsher green, but I think I'll go more faithful to the original with this one
    day = resolvefilepath("images/cc/nd.tex"),
    dusk = resolvefilepath("images/cc/nd.tex"),
    night = resolvefilepath("images/cc/nd.tex"),
    full_moon = resolvefilepath("images/cc/nd.tex"),
}

local tweentime = 0.1

local function dwellmaskclient(ent)

	-- Change the colour cube on the client to allow seeing in the dark client side.
	ent.components.playervision:ForceNightVision(true)
	ent.components.playervision:SetCustomCCTable(DWELLERVISION_COLOURCUBES_3)

	ent.AnimState:SetHaunted(true)
	
	-- Prevent the 5 second linger from taking nightvision away while in the aura
	if ent.NVLinger ~= nil then
		ent.NVLinger:Cancel()
	end
	
	-- The task below clears the nightvision, hopefully set in the config
	ent.NVLinger = ent:DoTaskInTime(4, function(ent)
		ent.components.playervision:ForceNightVision(false)
		ent.components.playervision:SetCustomCCTable(nil)
		ent.AnimState:SetHaunted(false)

		ent.NVLinger = nil
	end)
end

AddClientModRPCHandler("HatKidRPC", "dwellmaskclient", dwellmaskclient)

local function OnTweenDone(inst)
	
end

local function DwellerAbility(inst)
	-- print(inst:HasTag("inuse"))
	if inst:HasTag("dwelleractive") then
		-- About 5 times a second, DwellerAbility gets ran, if the dwellmask timer exists, then it continues the function.
		local owner = inst.components.inventoryitem:GetGrandOwner()

		if owner.components.sanity.current == 0 then
			inst.components.useableitem:StopUsingItem()
		end

		local pt = owner:GetPosition()
		local range = inst.Light:GetCalculatedRadius() 
		-- Use the radius of the light instead of setting one ourselves, that way it's visually consistent.
		--Light seems to use it's own radius system that's close but not quite in game units.

		local tags = { "player" }
		local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, range, nil, nil, tags)
		for _,ent in ipairs(targets) do
			if ent.components.playervision ~= nil then
			
				-- Apply colour cube for clients
				SendModRPCToClient(GetClientModRPC("HatKidRPC", "dwellmaskclient"), nil, ent)
				
				-- Apply night vision on server
				ent.components.playervision:ForceNightVision(true)
				ent.AnimState:SetHaunted(true)
				
				-- Prevent the linger from taking nightvision away while in the aura
				if ent.NVLinger ~= nil then
					ent.NVLinger:Cancel()
				end
				
				-- The task below clears the nightvision after a time
				ent.NVLinger = ent:DoTaskInTime(4, function(ent)
					ent.components.playervision:ForceNightVision(false)
					ent.NVLinger = nil
					ent.AnimState:SetHaunted(false)
				end)
			end
		end
	end
end


local function OnUse(inst)

	local owner = inst.components.inventoryitem:GetGrandOwner()
	
	if not inst.components.rechargeable:IsCharged() or owner.components.sanity.current < 5 then

		inst:DoTaskInTime(0, inst.components.useableitem:StopUsingItem()) -- Wait 1 frame or else things get weird
	
		owner.components.talker:Say(GetString(owner, "HAT_ONCOOLDOWN"))
		
	else
		-- If not in cooldown

		-- Tag
		inst:AddTag("dwelleractive")

		-- Light
		inst.Light:Enable(true)
		inst.components.lighttweener:StartTween(inst.Light, TUNING.DWELLERMASK_RADIUS, nil, nil, nil, tweentime, OnTweenDone)
		inst.net_light_roll:set(true)

		-- Texture
		owner.AnimState:OverrideSymbol("swap_hat", "dwellermask_on", "swap_hat")

		-- Sanity
		inst.components.equippable.dapperness = -TUNING.DAPPERNESS_LARGE
		owner.components.sanity:DoDelta(-3)
		
		-- Sound
		inst.SoundEmitter:PlaySound("dwellermask/sound/activate")
		inst.SoundEmitter:PlaySound("dwellermask/sound/loop", "dwellermaskloop")
	end
end

local function OnStopUse(inst)

	-- Don't run the stop code if we got here without being activated first
	if not inst:HasTag("dwelleractive") then
		return
	end

	local owner = inst.components.inventoryitem:GetGrandOwner()

	-- Ending effects (revive players)
	local pt = owner:GetPosition()
	local range = inst.Light:GetCalculatedRadius() 
	local tags = { "playerghost" }
	local nags = { "reviving" }
	local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, range, nil, nags, tags)
	for _,ent in ipairs(targets) do
		-- if ent ~= owner then
			ent:PushEvent("respawnfromghost", { source = inst, user = owner })

			local function PostPenalty(ent)
				ent.components.sanity:DoDelta(ent.components.sanity.max * -0.2) -- Sanity 30% on respawn (norm 50%)
				ent:RemoveEventCallback("ms_respawnedfromghost", PostPenalty)
			end

			-- Apply dweller revive penalties
			ent.components.health:DeltaPenalty(TUNING.REVIVE_HEALTH_PENALTY) -- Max health -25%

			-- In order to apply stats differently than default, we have to do it AFTER the player respawns, and not during
			-- This is a sorta gross way to do this imo but I don't feel like hooking into a function that would do this correctly at the moment.
			ent:ListenForEvent("ms_respawnedfromghost", PostPenalty)

			-- Grant owner sanity
			owner.components.sanity:DoDelta(TUNING.REVIVE_OTHER_SANITY_BONUS / 4)
		-- end
	end
	
	-- Tags
	inst:RemoveTag("dwelleractive")

	-- Cooldown (prevents spam and sanity drain abuse)
	inst.components.rechargeable:Discharge(1)

	-- Light
	inst.components.lighttweener:StartTween(inst.Light, 0, nil, nil, nil, tweentime)
	inst.net_light_roll:set(false)
	
	-- Change texture
	owner.AnimState:OverrideSymbol("swap_hat", "dwellermask", "swap_hat")

	-- Sanity
	inst.components.equippable.dapperness = 0

	-- Sound
	inst.SoundEmitter:PlaySound("dwellermask/sound/deactivate")
	inst.SoundEmitter:KillSound("dwellermaskloop")
end

local function KeybindUse(inst)
	if inst:HasTag("inuse") then
		inst.components.useableitem:StopUsingItem()
	else
		inst.components.useableitem:StartUsingItem()
	end
end

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_hat", "dwellermask", "swap_hat")

	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")

	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
end
 
local function OnUnequip(inst, owner)
	if inst:HasTag("dwelleractive") then
		inst.components.useableitem:StopUsingItem()
	end

	owner.AnimState:Hide("HAT")
	owner.AnimState:Hide("HAT_HAIR")
	owner.AnimState:Show("HAIR_NOHAT")
	owner.AnimState:Show("HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
end

local function OnLightDirty(inst)
	inst.light_roll = inst.net_light_roll:value()
	
	if inst.light_roll == false then

		--off
		inst.AnimState:SetBank("dwellermask")
		inst.AnimState:SetBuild("dwellermask")
		inst.AnimState:PlayAnimation("idle")

		inst.components.lighttweener:StartTween(inst.Light, 0, nil, nil, nil, tweentime)
		
	else

		--on
		inst.AnimState:SetBank("dwellermask_on")
		inst.AnimState:SetBuild("dwellermask_on")
		inst.AnimState:PlayAnimation("idle")
		
		inst.components.lighttweener:StartTween(inst.Light, TUNING.DWELLERMASK_RADIUS, nil, nil, nil, tweentime, OnTweenDone)

	end
end

local function OnEmpty(inst)
	inst.components.useableitem:StopUsingItem() -- And we'll make sure to stop the dweller effect

	inst:DoTaskInTime(0.5, inst:Remove())
end

local function OnCharged(inst)
	inst.components.useableitem:StopUsingItem()
end

local function fn(Sim) 
    local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	inst.entity:AddLight()
	
	
    MakeInventoryPhysics(inst)

	inst.Light:SetFalloff(1)
	inst.Light:SetIntensity(0.99)
	inst.Light:SetRadius(0)
	inst.Light:SetColour(0/255, 255/255, 175/255)
	inst.Light:Enable(true)

	inst.Light:EnableClientModulation(true)

	inst.light_roll = 0
	inst.net_light_roll = net_bool(inst.GUID, "light_roll", "light_rolldirty" )


    inst:AddTag("hat")
	inst:AddTag("hatkidhat")

	inst:AddComponent("lighttweener")
	
    if not TheWorld.ismastersim then
		inst:ListenForEvent("light_rolldirty", OnLightDirty)
        return inst
    end
	
	inst.entity:SetPristine()
	
    inst.AnimState:SetBank("dwellermask")
    inst.AnimState:SetBuild("dwellermask")
    inst.AnimState:PlayAnimation("idle")
	
	MakeHauntableLaunch(inst)
	
	inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(OnUse)
    inst.components.useableitem:SetOnStopUseFn(OnStopUse)


    inst:AddComponent("timer")

    -- local function ontimerdone(inst)
	-- 	inst.components.useableitem:StopUsingItem()
	-- end

    -- inst:ListenForEvent("timerdone", ontimerdone)
 
	-- inst:AddComponent("waterproofer")
    -- inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL) 
	
    inst:AddComponent("inspectable")
	

	
    inst:AddComponent("inventoryitem")
	 
    inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "hatkid"
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("rechargeable")
	inst.components.rechargeable:SetOnChargedFn(OnCharged)

	if TUNING.DWELLERMASK_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled.fueltype = FUELTYPE.MAGIC
		inst.components.fueled:InitializeFuelLevel( TUNING.DWELLERMASK_DURABILITY ) -- add tuning 600
		-- inst.components.fueled:InitializeFuelLevel( 3 ) -- add tuning 600
		inst.components.fueled:SetDepletedFn(OnEmpty)
	end

	inst:ListenForEvent("AbilityKey", KeybindUse)
	
	inst:DoPeriodicTask(0, DwellerAbility, nil, inst)
	
    return inst
end

return  Prefab("dwellermask", fn, assets, prefabs)