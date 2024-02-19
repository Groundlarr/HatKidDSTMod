local prefabs = {}

-- Hat Kid skins

table.insert(prefabs, CreatePrefabSkin("hatkid_none", {
	assets = {
		Asset("ANIM", "anim/hatkid.zip"),
		Asset("ANIM", "anim/ghost_hatkid_build.zip"),
	},
	skins = {
		normal_skin = "hatkid",
		ghost_skin = "ghost_hatkid_build",
	},

	base_prefab = "hatkid",
	build_name_override = "hatkid",

	type = "base",
	rarity = "Character",

	skin_tags = { "BASE", "HATKID"},
}))

local hatskins = {
	-- Launch
	"ms_hatkid_cat",
	"ms_hatkid_detective",
	"ms_hatkid_dye_bowkid",
	"ms_hatkid_dye_groovy",
	"ms_hatkid_dye_lunar",
	"ms_hatkid_dye_niko",
	"ms_hatkid_dye_pinkdanger",
	"ms_hatkid_dye_sans",
	"ms_hatkid_dye_toonlink",
	"ms_hatkid_dye_oliver",
}

for k,v in ipairs(hatskins) do

	table.insert(prefabs, CreatePrefabSkin(v, {
		assets = {
			Asset("ANIM", "anim/" .. v .. ".zip"),
			Asset("ANIM", "anim/ghost_hatkid_build.zip"),
		},
		skins = {
			normal_skin = v,
			ghost_skin = "ghost_hatkid_build",
		},

		base_prefab = "hatkid",
		build_name_override = v,

		type = "base",
		rarity = "ModMade",

		skin_tags = { "BASE", "HATKID" },
	}))
end

-- Kid Hat skins

local kidhatskins = {
	"ms_kidhat_dye_bowkid",
	"ms_kidhat_dye_groovy",
	"ms_kidhat_dye_lunar",
	"ms_kidhat_dye_niko",
	"ms_kidhat_dye_pinkdanger",
	"ms_kidhat_dye_sans",
	"ms_kidhat_dye_toonlink",
	"ms_kidhat_dye_oliver",
}

for k, v in ipairs(kidhatskins) do
	table.insert(prefabs, CreatePrefabSkin(v, { --The ID of our skin
		assets = { --Our assets
			Asset( "ANIM", "anim/" .. v .. ".zip"),

			Asset("ATLAS", "images/inventoryimages/" .. v .. ".xml"),
			Asset("IMAGE", "images/inventoryimages/" .. v .. ".tex"),
		},
		base_prefab = "kidhat", --The prefab of the item/structure we're adding a skin for
		build_name_override = v,

		type = "item", --We are now creating a modded item/structure! Thus our skin's type is "item" (Note: there aren't different types for modded "structures", to the game there is no difference between skinning an item, a structure, or even a mob! (Yes you could create mob skins if you wanted!)
		rarity = "ModMade",

		skin_tags = {"KIDHAT"}, --Skin tags, you should add a tag matching the original prefab of the item/structure we're adding a skin for in full capitalization
	}))

	-- RegisterInventoryItemAtlas("images/inventoryimages/" .. v .. ".xml",v .. ".tex")
end

kidhat_init_fn = function(inst, build_name)
    basic_init_fn(inst, build_name, "kidhat" )
end

kidhat_clear_fn = function(inst)
    basic_clear_fn(inst, "kidhat" )
end

return unpack(prefabs)