local assets=
{ 
    Asset("ANIM", "anim/kidhat.zip"),
	
    Asset("ATLAS", "images/inventoryimages/kidhat.xml"),
    Asset("IMAGE", "images/inventoryimages/kidhat.tex"),
}


RegisterInventoryItemAtlas("images/inventoryimages/kidhat.xml","kidhat.tex")


local badge = nil

local holder = nil

local testfab = nil

local prefabs = 
{
}

-- local function OnBlocked(inst, data)
	-- inst.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour")
	-- badge.components.armor:TakeDamage(data)
-- end

local function onload(inst, data) 
	if data.PrevOwner then 
		-- print("Previous Owner found")
		-- print(data.PrevOwner.prefab)
		-- dumptable(data.PrevOwner,1,1)
	end
end

local function aura()
	return 1
end

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_hat", "kidhat", "swap_hat")
	
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end

	if inst.components.fueled then
		inst.components.fueled:StartConsuming()
	end

	-- inst:AddComponent("sanityaura")
	-- inst.components.sanityaura.max_distsq = TUNING.HATKID_AURASIZE
    -- inst.components.sanityaura.aura = -TUNING.HATKID_AURARATE
	-- inst.components.sanityaura.fallofffn = aura

	holder = owner

	-- inst.lab = SpawnPrefab("researchlab")
	-- inst.lab.Transform:SetScale(0, 0, 0)
	-- inst.lab.Physics:ClearCollisionMask()
	-- inst.lab.SoundEmitter:SetMute(true)

	-- inst.lab.entity:SetParent(inst.entity)

	-- inst.test = "asdf"

	-- if inst._test ~= nil then
	-- 	inst.test = inst._test:GetSaveRecord()
	-- end
	
	--Hat Badge Slot
	-- if inst.components.container ~= nil then
		-- inst.components.container:Open(owner)
	-- end
	-- print(owner.AnimState:GetSkinBuild())
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

	if inst.components.fueled then
		inst.components.fueled:StopConsuming()
	end

	-- inst:RemoveComponent("sanityaura")

	-- inst:DoTaskInTime(0, function(inst)
	-- 	inst.lab:Remove()
	-- end)
	
	
	-- if inst.components.container ~= nil then
        -- inst.components.container:Close()
    -- end
end
 

 
local function OnEmpty(inst)
	inst:DoTaskInTime(0, inst.Remove)
end

local function onDrop(inst)

end

-- local function OnLoad(inst, data)

-- end

local function OnSave(inst, data)
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
 
    inst:AddComponent("inspectable")

	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL)

    inst:AddComponent("inventoryitem")
    -- inst.components.inventoryitem.imagename = "kidhat"
    -- inst.components.inventoryitem.atlasname = "images/inventoryimages/kidhat.xml"
	inst.components.inventoryitem:SetOnDroppedFn(onDrop)
	 
    inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "hatkid"
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_TINY * 1.5
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

	if TUNING.KIDHAT_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled.fueltype = FUELTYPE.USAGE
		inst.components.fueled:InitializeFuelLevel( TUNING.KIDHAT_DURABILITY ) -- add tuning 2 hours 7200
		inst.components.fueled:SetDepletedFn(OnEmpty)
	end
	
	-- inst:AddComponent("insulator")
    -- inst.components.insulator:SetWinter()
    -- inst.components.insulator:SetInsulation(TUNING.INSULATION_TINY * TUNING.KIDHAT_INSULATION)
	
	-- inst:AddComponent("container")
    -- inst.components.container:WidgetSetup("hkr_badgeslot")
	-- inst.components.container.canbeopened = false
    -- inst:ListenForEvent("itemget", OnBadgeLoaded)
    -- inst:ListenForEvent("itemlose", OnBadgeUnloaded)
	
	-- inst:ListenForEvent("armordamaged", OnBlocked, inst)

	-- inst:DoPeriodicTask(0.1, function(inst)
	-- 	-- inst.AnimState:SetMultColour(1,1,1,1)
	-- 	print(inst.AnimState:GetMultColour())
	-- end)

	-- inst.OnLoad = onload
	-- inst.OnSave = OnSave
	
    return inst
end
return  Prefab("kidhat", fn, assets, prefabs)