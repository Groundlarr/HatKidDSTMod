local function OnPonVal(self, val)
    self.inst.replica.madhatter:SetVal(val)
end

local function OnPonMax(self, max)
    self.inst.replica.madhatter:SetMax(max)
end

-- For entities with health
-- And workable entities for now, as they share enough values
local function OnAttack(inst, data)
    local target = data.target
    if target and target:IsValid() and not target:HasTag("madhatter_loot") then

        if not target.components.lootdropper then
            target:AddComponent("lootdropper")
        end

        for i = 1, target.gpons or 0, 1 do
            target.components.lootdropper:AddChanceLoot("pon", 1)
        end

        for i = 1, target.cpons or 0, 1 do
            target.components.lootdropper:AddChanceLoot("pon", 0.5)
        end

        target:AddTag("madhatter_loot")
    end
end

-- For pickable entities
local function OnPick(inst, data)
    local target = data.object
    if target and target:IsValid() and not target:HasTag("madhatter_loot") then

        for i = 1, target.gpons or 0, 1 do
            SpawnPrefab("pon").Transform:SetPosition(inst.Transform:GetWorldPosition())
        end

        for i = 1, target.cpons or 0, 1 do
            if math.random(0, 1) == 1 then
                SpawnPrefab("pon").Transform:SetPosition(inst.Transform:GetWorldPosition())
            end
        end

        target:AddTag("madhatter_loot")
    end
end

local MadHatter = Class(function(self, inst)
    self.inst = inst

    self.max = 100
    self.val = 0

    self.chainPos = 0

    self.inst:AddTag("madhatter")

    self.inst:ListenForEvent("onattackother", OnAttack)
    self.inst:ListenForEvent("working", OnAttack)
    self.inst:ListenForEvent("picksomething", OnPick)
end,
nil, 
{
    max = OnPonMax,
    val = OnPonVal,
})

function MadHatter:OnRemoveFromEntity()
    self.inst:RemoveTag("madhatter")
end

function MadHatter:DoDelta(delta)
    if not type(delta) == "number" then return false end

    local old = self.val

    self:SetVal(self.val + delta)

    local actualDelta = self.val - old
    
    self.inst:PushEvent("pondelta", { delta = actualDelta, val = self.val, max = self.max })
    return actualDelta
end

function MadHatter:SetVal(val)
    local newval = math.clamp(val, 0, self.max)
    self.val = newval
end

function MadHatter:SetMax(max)
    local newmax = math.clamp(max, 0, 65535)
    self.max = newmax
end

function MadHatter:GetPercent()
    return self.val / self.max
end

function MadHatter:GetDebugString()
	return "Pons: " .. tostring(self.val) .. " / " .. tostring(self.max)
end

return MadHatter
