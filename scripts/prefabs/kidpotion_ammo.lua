local function kidpotion_fn()
    local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("kidpotion")
    inst.AnimState:SetBuild("kidpotion")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("brewinghat_ammo")

    if not TheWorld.ismastersim then
        return inst
    end
 
    inst:AddComponent("inspectable")
 
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "kidpotion"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/kidpotion.xml"

	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM -- 10 can be in an item stack

    return inst
end
 
return Prefab("kidpotion_ammo", kidpotion_fn)