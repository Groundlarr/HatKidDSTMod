local assets=
{ 
    Asset("ANIM", "anim/polarhat.zip"),

    Asset("ATLAS", "images/inventoryimages/polarhat.xml"),
    Asset("IMAGE", "images/inventoryimages/polarhat.tex"),
}

RegisterInventoryItemAtlas("images/inventoryimages/polarhat.xml","polarhat.tex")

--Scratch the previous stuff, new idea
--I'm going to implement an ability key, probably LSHIFT by default, this will activate the Hat Ability, like slamming with ice hat, sprinting, throwing a potion with brewing hat, etc.
--Ice Hat ability will be a ground slam, knocking things away from Hat Kid and applying 3 layers of freeze, and possibly a little damage. However, this will be put on a cooldown of probably 15 seconds, we'll see.
-- (Several weeks later) Looking great, let's see if we can polish it up.

-- 5/11/22 After taking many breaks and stuff, this is NEEDS a rewrite. I didn't really know how stategraphs worked when I first made this, so I just did everything manually
-- because I thought it was easier. Boy was I wrong, and boy do I regret it. At least I can fix the rat's nest.

-- 5/14/22 Rewrite basically done! Made a stategraph and stuff, looking pretty good so far, a LOT cleaner than before.
-- Still a bit of a rat's nest, but it's a lot more readable now, so I'm happy for the moment.

local prefabs = 
{ 
	"hatshatter",
	"hatshatter2",
	"polarhat_explode",
}

local function polarhatclient(owner)
	owner:DoTaskInTime(0.1, function(owner)
		
		if owner.sg ~= nil then
			owner.components.locomotor:StopMoving()
			
			owner.AnimState:PlayAnimation("idle")
			owner.sg:GoToState("idle")
			
			
			owner.AnimState:OverrideSymbol("swap_frozen", "frozen", "frozen")
			owner.AnimState:PlayAnimation("frozen")
		
			if owner.components.playercontroller ~= nil then
				owner.components.playercontroller:EnableMapControls(false)
				owner.components.playercontroller:Enable(false)
			end
		end
	end)
end

AddClientModRPCHandler("HatKidRPC", "polarhatclient", polarhatclient)

local function OnUse(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	
	if not inst.components.rechargeable:IsCharged()
	or inst.components.fueled.currentfuel < (90 * 4) then -- add tuning
		-- If cant use
		inst:DoTaskInTime(0, function(inst) -- Wait 1 frame or else things get weird
			inst.components.useableitem:StopUsingItem()
		end)
		
		owner.components.talker:Say(GetString(owner, "ACTIONFAIL_GENERIC"))
		
	else
		-- If can use
		if inst.components.fueled then
			inst.components.fueled:DoDelta(-90 * 4)
		end

		-- Cooldown
		inst.components.rechargeable:Discharge(TUNING.POLARHAT_COOLDOWN)
		
		-- Fakefreeze, rewritten somewhat more properly as a state
		owner.sg:GoToState("hat_frozen")

		-- Initial FX
		SpawnPrefab("polarhat_charge").Transform:SetPosition(owner.Transform:GetWorldPosition())
		SpawnPrefab("hatshatter").Transform:SetPosition(owner.Transform:GetWorldPosition())
		local two = SpawnPrefab("hatshatter")
		two.Transform:SetPosition(owner.Transform:GetWorldPosition())
		two.Transform:SetScale(1.25, 1.25, 1.25)

		-- After a delay, explode!
		owner:DoTaskInTime(20 * FRAMES, function(owner)
			inst.components.useableitem:StopUsingItem()

			-- Take sanity
			owner.components.sanity:DoDelta(-5) -- Add TUNING

			-- Explode FX
			SpawnPrefab("hatshatter2").Transform:SetPosition(owner.Transform:GetWorldPosition())
			SpawnPrefab("polarhat_explode").Transform:SetPosition(owner.Transform:GetWorldPosition())
			
			-- Camera Shake
			for i, v in ipairs(AllPlayers) do
				local distSq = v:GetDistanceSqToInst(owner)
				local k = math.max(0, math.min(1, distSq / 400))
				local intensity = k * 0.75 * (k - 2) + 0.75 --easing.outQuad(k, 1, -1, 1)
				if intensity > 0 then
					v:ShakeCamera(CAMERASHAKE.FULL, .7, .02, intensity / 2)
				end
			end
			
			-- Get entities in a radius around the explosion's center
			local pt = owner:GetPosition()
			local range = TUNING.POLARHAT_RADIUS
			-- local tags = { "monster", "hostile", "smallcreature", "insect", "animal", "largecreature", "character", "player" }
			local nags = { "CLASSIFED", "invisible", "playerghost" }
			local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, range, nil, nags, nil)	
			for _,ent in ipairs(targets) do

				-- Hitstun and damage
				if ent.components.combat and not ent:HasTag("player") then
					ent.components.combat:GetAttacked(owner, 18, inst)
				end

				-- Freeze things that need frozen
				if ent.components.freezable ~= nil then
					ent.components.freezable:AddColdness(TUNING.POLARHAT_LEVEL)
					ent.components.freezable:SpawnShatterFX()
				end

				-- Decrease character temperatures
				if ent.components.temperature ~= nil then
					-- If effecting the owner, modify temp directly to bypass polarhat insulation
					if ent == owner then
						ent.components.temperature:SetTemperature(ent.components.temperature.current + -TUNING.POLARHAT_TEMP + -(math.max(0, ent.components.temperature:GetCurrent() / 70 * 20)))
					else
						ent.components.temperature:DoDelta(-TUNING.POLARHAT_TEMP + -(math.max(0, ent.components.temperature:GetCurrent() / 70 * 20)))
					end
				end
			end
		end)
	end
end

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_hat", "polarhat", "swap_hat")
	
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
end
 
 
local function OnUnequip(inst, owner)
	owner.AnimState:ClearOverrideSymbol("swap_hat")

	owner.AnimState:Hide("HAT")
	owner.AnimState:Hide("HAT_HAIR")
	owner.AnimState:Show("HAIR_NOHAT")
	owner.AnimState:Show("HAIR")

	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
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

	inst.AnimState:SetBank("polarhat")
    inst.AnimState:SetBuild("polarhat")
    inst.AnimState:PlayAnimation("idle")
	
    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "med", 0.1, 0.6) -- Makes items float on water, rather than just sitting there.
 
    inst:AddTag("hat")
    inst:AddTag("hatkidhat")

	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	MakeHauntableLaunch(inst)
 
	inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(OnUse)

    inst:AddComponent("timer")
 
    inst:AddComponent("inspectable") 
	
    inst:AddComponent("inventoryitem")
	 
    inst:AddComponent("equippable")
	if TUNING.ITEMRESTRICTIONS then
		inst.components.equippable.restrictedtag = "hatkid"
	end
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	

	
	inst:AddComponent("rechargeable")

	if TUNING.POLARHAT_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled:InitializeFuelLevel( TUNING.POLARHAT_DURABILITY * 90 )
		inst.components.fueled.fueltype = "ICE" -- ice, 90
	end

	if TUNING.POLARHAT_INSULATION then 
		inst:AddComponent("insulator")
		inst.components.insulator:SetWinter()
		inst.components.insulator:SetInsulation(TUNING.POLARHAT_INSULATION)
	end

	if TUNING.POLARHAT_WATERPROOFNESS then
		inst:AddComponent("waterproofer")
		inst.components.waterproofer:SetEffectiveness(TUNING.POLARHAT_WATERPROOFNESS) 
	end

	inst:ListenForEvent("AbilityKey", KeybindUse)
	
    return inst
end

return  Prefab("polarhat", fn, assets, prefabs)