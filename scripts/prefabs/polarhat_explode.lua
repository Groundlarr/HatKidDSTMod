local assets =
{
    -- Asset("ANIM", "anim/brewinghat_explode.zip"),
    Asset("ANIM", "anim/structure_collapse_fx.zip"),
    Asset("ANIM", "anim/fx_boat_pop.zip"),
    Asset("ANIM", "anim/sleepcloud.zip"),
}

local function MakeExplosion(data)
    local function PlayExplodeAnim(proxy)
        local inst = CreateEntity()

        inst:AddTag("FX")
        --[[Non-networked entity]]
        -- inst.entity:AddNetwork()
        inst.entity:SetCanSleep(false)
        inst.persists = false

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddLight()

        inst.Transform:SetFromProxy(proxy.GUID)




        if not TheNet:IsDedicated() then
            --Delay one frame so that we are positioned properly before starting the effect
            --or in case we are about to be removed
            inst:DoTaskInTime(0, function(inst)
                -- inst.a.SoundEmitter:SetMute(true)
            end)
        end
		
		-- inst.Transform:SetScale(2, 2, 2)
        
        inst:AddComponent("colourtweener")
        inst:AddComponent("lighttweener")

        inst.entity:AddLight()
		inst.Light:Enable(true)
		inst.Light:SetRadius(ABILITY_LIGHTRAD * TUNING.POLARHAT_RADIUS)
		-- inst.Light:SetRadius(0.9403 * 6)
		inst.Light:SetIntensity(0.99)
		inst.Light:SetFalloff(1)
        inst.Light:SetColour(255/255, 255/255, 255/255)
        
        inst.AnimState:SetBank("collapse")
        inst.AnimState:SetBuild("structure_collapse_fx")
        inst.AnimState:PlayAnimation("collapse_large")
        inst.Transform:SetScale(0.85, 0.85, 0.85)
        -- inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
        inst.AnimState:SetFinalOffset(10)
		inst.AnimState:SetDeltaTimeMultiplier(1.5)
        inst.AnimState:SetMultColour(151/255, 255/255, 255/255, 1)
        inst.AnimState:SetAddColour(23/255, 33/255, 255/255, 1)


        inst.components.lighttweener:StartTween(inst.Light, nil, nil, nil, {0,0,0,0}, 0.5) -- Fade out over 0.5 seconds. Hit rage indicator

        -- This code only runs on the client, so no need to do any stupid net vars, god i hate them
        -- Fade between orange a purple

        -- inst.SoundEmitter:PlaySound("kidpotion/sound/explode")

        inst:ListenForEvent("animover", inst.Remove)
    end

    local function PlayPopAnim(proxy) -- POP ANIM ---------------------------------
        local inst = CreateEntity()

        inst:AddTag("FX")
        --[[Non-networked entity]]
        -- inst.entity:AddNetwork()
        inst.entity:SetCanSleep(false)
        inst.persists = false

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddLight()

        inst.Transform:SetFromProxy(proxy.GUID)
        
        inst.AnimState:SetBank("fx_boat_pop")
        inst.AnimState:SetBuild("fx_boat_pop")
        inst.AnimState:PlayAnimation("pop")
        -- inst.Transform:SetScale(0.8, 0.8, 0.8)
        -- inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
        -- inst.AnimState:SetFinalOffset(10)
		inst.AnimState:SetDeltaTimeMultiplier(0.75)
        inst.AnimState:SetMultColour(151/255, 255/255, 255/255, 1)
        inst.AnimState:SetScale(2, 2)
        -- inst.AnimState:SetAddColour(0, 0, 255/255, 1)

        inst:ListenForEvent("animover", inst.Remove)
    end

    local function PlayCloudAnim(proxy) -- CLOUD ANIM ---------------------------------
        local inst = CreateEntity()

        inst:AddTag("FX")
        --[[Non-networked entity]]
        -- inst.entity:AddNetwork()
        inst.entity:SetCanSleep(false)
        inst.persists = false

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddLight()

        inst.Transform:SetFromProxy(proxy.GUID)
        
        inst.AnimState:SetBank("sleepcloud")
        inst.AnimState:SetBuild("sleepcloud")
        inst.AnimState:PlayAnimation("sleepcloud_pre")

        inst.AnimState:HideSymbol("sleep_spore") -- Hides extra pollen
        inst.AnimState:HideSymbol("pollen")
        inst.AnimState:SetFinalOffset(8)

        inst.AnimState:SetDeltaTimeMultiplier(1.8)
        inst.AnimState:SetScale(2, 2)
        inst.AnimState:SetMultColour(151/255, 255/255, 255/255, 1)
        inst.AnimState:SetAddColour(0, 0, 255/255, 1)

        inst:ListenForEvent("animover", inst.Remove)
    end

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddNetwork()

        --Dedicated server does not need to spawn the local fx
        if not TheNet:IsDedicated() then
            --Delay one frame so that we are positioned properly before starting the effect
            --or in case we are about to be removed
            inst:DoTaskInTime(0, function(inst)
                PlayExplodeAnim(inst)
                PlayPopAnim(inst)
                PlayCloudAnim(inst)
            end)
        end

        inst.Transform:SetFourFaced()

        inst:AddTag("FX")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst.persists = false
        inst:DoTaskInTime(1, inst.Remove)

        return inst
    end

    return fn
end


return Prefab("polarhat_explode", MakeExplosion(), assets)