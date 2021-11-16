local assets=
{ 
    Asset("ANIM", "anim/kidhat_skin1.zip"),
    Asset("ANIM", "anim/kidhat_skin1_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/kidhat_skin1.xml"),
    Asset("IMAGE", "images/inventoryimages/kidhat_skin1.tex"),
}

local prefabs = 
{
}

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_hat", "kidhat_skin1", "swap_hat")
	
	if inst.components.fueled then
		inst.components.fueled:StartConsuming()
	end
	
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
end
 
local function OnUnequip(inst, owner)

	if inst.components.fueled then
		inst.components.fueled:StopConsuming()
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
 
 local function fn(Sim) 
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
 
    inst:AddTag("hat")
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:SetPristine()
	
    inst.AnimState:SetBank("kidhat_skin1")
    inst.AnimState:SetBuild("kidhat_skin1")
    inst.AnimState:PlayAnimation("idle")
	
	MakeHauntableLaunch(inst)
 
    inst:AddComponent("inspectable")
     
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL) 
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "kidhat_skin1"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/kidhat_skin1.xml"
	 
    inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_TINY * 3
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("insulator")
    inst.components.insulator:SetWinter()
    inst.components.insulator:SetInsulation(TUNING.INSULATION_MED * TUNING.KIDHAT_INSULATION)
	
 
    return inst
end

return  Prefab("kidhat_skin1", fn, assets, prefabs)