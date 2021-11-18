local assets=
{ 
    Asset("ANIM", "anim/brewinghat.zip"),
    Asset("ANIM", "anim/brewinghat_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/brewinghat.xml"),
    Asset("IMAGE", "images/inventoryimages/brewinghat.tex"),
}

local prefabs =
{
}

local prevequip = nil

local function equiprev(inst)
	local owner = inst.components.inventoryitem.owner

	if TUNING.FUNNYMODE then --Just a funny item teleportation mechanics we can do here.

		if prevequip then
			inst:DoTaskInTime(0, function(inst)
				owner.components.inventory:Equip(prevequip)
				prevequip = nil
			end)
		end

	else

		if prevequip and prevequip.components.inventoryitem and prevequip.components.inventoryitem.owner == owner then
			inst:DoTaskInTime(0, function(inst)
				owner.components.inventory:Equip(prevequip)
				prevequip = nil
			end)
		end

	end
end

local function OnEquip(inst, owner)
	-- If the equiper doesn't have the Hat Kid tag (which only hat kid has for now) then
	-- drop the item, and say a fail message.
	if owner:HasTag("player") and not owner:HasTag("hatkid") then
		inst:DoTaskInTime(0, function()
			owner.components.inventory:DropItem(inst)
			owner.components.talker:Say(GetString(player, "ACTIONFAIL_GENERIC"))
		end)
	end
	
	owner.AnimState:OverrideSymbol("swap_hat", "brewinghat", "swap_hat")		
	

	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
end
 
local function OnUnequip(inst, owner)

	owner.AnimState:Hide("HAT")
	owner.AnimState:Hide("HAIR_HAT")
	owner.AnimState:Show("HAIR_NOHAT")
	owner.AnimState:Show("HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
end
 
 
local function OnUse(inst)

	local owner = inst.components.inventoryitem.owner
	local rechargeable = inst.components.rechargeable
	
	if not rechargeable:IsCharged() then
	
		-- If in cooldown
		inst:DoTaskInTime(0, function(inst) -- Wait 1 frame or else things get weird
			inst.components.useableitem:StopUsingItem()
		end)
		
		--Cooldown line
		owner.components.talker:Say(GetString(owner, "HAT_ONCOOLDOWN"))
		
	else
		-- If not in cooldown
		prevequip = owner.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)

		owner.components.inventory:Equip(SpawnPrefab("kidpotion"))
		
		inst.components.useableitem:StopUsingItem()
	end
end

local function OnStopUse(inst)

	local owner = inst.components.inventoryitem.owner
	local rechargeable = inst.components.rechargeable
	
	if not rechargeable:IsCharged() then
		-- If in cooldown

	else
		-- If not in cooldown, or doing nothing, put it on cooldown!
		
		rechargeable:Discharge(TUNING.BREWINGHAT_COOLDOWN) -- Cooldown
	end
end

local function KeybindUse(inst)
	inst.components.useableitem:StartUsingItem()
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
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:SetPristine()
	
    inst.AnimState:SetBank("brewinghat")
    inst.AnimState:SetBuild("brewinghat")
    inst.AnimState:PlayAnimation("idle")
	
	MakeHauntableLaunch(inst)
 
    inst:AddComponent("inspectable")
    
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL) 
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "brewinghat"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/brewinghat.xml"
	
    inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

	inst:AddComponent("insulator")
    inst.components.insulator:SetSummer() 
    inst.components.insulator:SetInsulation(TUNING.INSULATION_SMALL)
	
	inst:AddComponent("rechargeable")
	
	inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(OnUse)
    inst.components.useableitem:SetOnStopUseFn(OnStopUse)
	
	inst:ListenForEvent("AbilityKey", KeybindUse)

	inst:ListenForEvent("prevequip", equiprev)

    return inst
end

-- AddModRPCHandler("HatKidRPC", "GetMousePos", BrewingHatAbility)

return  Prefab("brewinghat", fn, assets, prefabs)