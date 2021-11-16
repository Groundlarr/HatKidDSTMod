local assets=
{ 
    Asset("ANIM", "anim/kidhat.zip"),
    Asset("ANIM", "anim/kidhat_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/kidhat.xml"),
    Asset("IMAGE", "images/inventoryimages/kidhat.tex"),
}

local prefabs = 
{
}

local function OnEquip(inst, owner)
	-- If the equiper doesn't have the Hat Kid tag (which only hat kid has for now) then
	-- drop the item, and say a fail message.
	if owner:HasTag("player") and not owner:HasTag("hatkid") then
		inst:DoTaskInTime(0, function()
			owner.components.inventory:DropItem(inst)
			owner.components.talker:Say(GetString(player, "ACTIONFAIL_GENERIC"))
		end)
	end
	
	owner.AnimState:OverrideSymbol("swap_hat", "kidhat", "swap_hat")
	
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
end
 
local function OnUnequip(inst, owner)

	owner.AnimState:Hide("HAT")
	owner.AnimState:Hide("HAT_HAIR")
	owner.AnimState:Show("HAIR_NOHAT")
	owner.AnimState:Show("HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
end
 
 local function fn(Sim) 
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()

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
	
    inst.AnimState:SetBank("kidhat")
    inst.AnimState:SetBuild("kidhat")
    inst.AnimState:PlayAnimation("idle")
	
	MakeHauntableLaunch(inst)

	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL) 

    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "kidhat"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/kidhat.xml"
	 
    inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_TINY * 3
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("insulator")
    inst.components.insulator:SetWinter() 
    inst.components.insulator:SetInsulation(TUNING.INSULATION_MED * TUNING.KIDHAT2_INSULATION)
	
 
    return inst
end

return  Prefab("kidhat2", fn, assets, prefabs)