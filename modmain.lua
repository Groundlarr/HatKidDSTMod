--[[
  _    _           _         _  __  _       _       _____           _                       _              _
 | |  | |         | |       | |/ / (_)     | |     |  __ \         | |                     | |            | |
 | |__| |   __ _  | |_      | ' /   _    __| |     | |__) |   ___  | |   ___     __ _    __| |   ___    __| |
 |  __  |  / _` | | __|     |  <   | |  / _` |     |  _  /   / _ \ | |  / _ \   / _` |  / _` |  / _ \  / _` |
 | |  | | | (_| | | |_      | . \  | | | (_| |     | | \ \  |  __/ | | | (_) | | (_| | | (_| | |  __/ | (_| |
 |_|  |_|  \__,_|  \__|     |_|\_\ |_|  \__,_|     |_|  \_\  \___| |_|  \___/   \__,_|  \__,_|  \___|  \__,_|

  _                  _____   _              _
 | |                / ____| | |            | |
 | |__    _   _    | (___   | | __  _   _  | |   __ _   _ __   _ __
 | '_ \  | | | |    \___ \  | |/ / | | | | | |  / _` | | '__| | '__|
 | |_) | | |_| |    ____) | |   <  | |_| | | | | (_| | | |    | |
 |_.__/   \__, |   |_____/  |_|\_\  \__, | |_|  \__,_| |_|    |_|
           __/ |                     __/ |
          |___/                     |___/


	To be clear, I AM NOT GOOD AT CODING! However, I am good at using search engines, logic, and copy pasting.

	A lot of the stuff written in this mod is absolutely disgusting, but it WORKS, and that's what matters.

	If you are for whatever reason using part of my mod to learn something, or as an example, feel free, but also try to improve it,
	improving already existing code is a lot of what I did in this mod, be it code that was already in the mod, or snippets I "borrowed" from somewhere else.

	Also, if you're looking to help me with my mod in any way, be it textures or code, or you just wanna chat,  join my super secret private and epic discord https://discord.gg/ysJRjaVUmu
	and make sure to give me an @. I'm Skylarr#9203.
]]


-- Currently incompatible with Insight. sadly.

PrefabFiles = {
	"hatkid",
	"hatkid_none",

	--player skins
	-- "hatkid_copy", -- default clothes

	--hats
    "kidhat",
	"sprinthat",
	"brewinghat",
	"polarhat",
	"dwellermask",
	"timestophat",

	--hatbrellas
	"hatbrella",
	-- "hatbrella2",

	--open hatbrellas
	"hatbrellaopen",
	-- "hatbrella2open",

	--throwables
	"kidpotion",
	"kidpotion_throwable",

	--badges (not implemented)
	-- "hkr_badge_football",
	-- "hkr_badge_winter",

	--collectables (disabled)
	-- "pon",
	-- "pon_heart",
	-- "timepiece",

	-- Dweller Placeables
	-- "dwellerplatform",
	-- "dwellerplatform_player_collision",
	-- "dwellerplatform_item_collision",
	-- "dwellerplatform_item",

	--fx prefabs
	"brewinghat_explode",
	"polarhat_explode",
	"sprint_puff",
	-- "hkr_aoe",
	"hkr_icerange",
	"icecloud",
	"hatshatter",
	"hatshatter2",

	--misc
	-- "inv_pons",

	--testing (disable in final)
	"cooltarget", -- This is a dummytarget prefab, but it only regens health when it is low.
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/hatkid.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/hatkid.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/hatkid.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/hatkid.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/hatkid_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/hatkid_silho.xml" ),

	Asset( "IMAGE", "images/map_icons/hatkid.tex" ),
	Asset( "ATLAS", "images/map_icons/hatkid.xml" ),

	Asset( "IMAGE", "images/avatars/avatar_hatkid.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_hatkid.xml" ),

	Asset( "IMAGE", "images/avatars/avatar_ghost_hatkid.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_hatkid.xml" ),

	Asset( "IMAGE", "images/avatars/self_inspect_hatkid.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_hatkid.xml" ),

	-- Big names
	Asset( "IMAGE", "images/names_hatkid.tex" ),
    Asset( "ATLAS", "images/names_hatkid.xml" ),

	Asset( "IMAGE", "images/names_gold_hatkid.tex" ),
    Asset( "ATLAS", "images/names_gold_hatkid.xml" ),

	-- Crafting tabs
	Asset( "IMAGE", "images/gui/craftingtabicon.tex" ), -- Reused texture from Kid Hat, first swap image.
	Asset( "ATLAS", "images/gui/craftingtabicon.xml" ),

	Asset( "IMAGE", "images/gui/pontab.tex" ), -- Reused texture from Kid Hat, first swap image.
	Asset( "ATLAS", "images/gui/pontab.xml" ),

	-- Pon inventory
	Asset("ANIM", "anim/status_pons.zip"),
	Asset("ANIM", "anim/pons_icon.zip"),

	-- Skin bigportraits
    Asset( "IMAGE", "bigportraits/hatkid.tex" ), -- Base, not sure where this is used tbh.
    Asset( "ATLAS", "bigportraits/hatkid.xml" ),

	Asset( "IMAGE", "bigportraits/hatkid_none.tex" ), -- Default, texture is same as base.
    Asset( "ATLAS", "bigportraits/hatkid_none.xml" ),

    Asset( "IMAGE", "bigportraits/hatkid_cat.tex" ), -- Nyakuza
    Asset( "ATLAS", "bigportraits/hatkid_cat.xml" ),

	Asset( "IMAGE", "bigportraits/hatkid_detective.tex" ), -- Detective
    Asset( "ATLAS", "bigportraits/hatkid_detective.xml" ),
	
	-- For the dyes we don't have custom portraits, so we just point the atlas at the default portrait.
	-- This means we don't load a ton of duplicate textures theoretically, though I'm not sure how this works in memory
	-- At the very least it saves disk space
    Asset( "ATLAS", "bigportraits/hatkid_dye_niko.xml" ), --nightmargin is awesome i love oneshot
    Asset( "ATLAS", "bigportraits/hatkid_dye_toonlink.xml" ), -- toonlink is pretty cool tool, my smash main
    Asset( "ATLAS", "bigportraits/hatkid_dye_pinkdanger.xml" ), -- pink dye

    Asset( "ATLAS", "bigportraits/hatkid_timestop.xml" ), -- redundant bigportrait for time stop skin. This shouldn't display but it keeps the client log happy.


}



-- Constants
GLOBAL.ABILITY_LIGHTRAD = 0.9403 -- This value is how light units translate to in game units while using specific settings with lights. Make sure you know what you're doing with this if you use it, it's not always accurate.

-- End Constants

modimport("engine.lua") --Keyhandler engine

-- Imports to keep the keyhandler from working while typing into various things.
Load "chatinputscreen"
Load "consolescreen"
Load "textedit"

-- Add Hat Kid to css and minimap
AddModCharacter("hatkid", "FEMALE")
AddMinimapAtlas("images/map_icons/hatkid.xml")


----------------------------------
-- Skin Stuff --------------------
----------------------------------

-- CHARACTER skins section, NOT item skins
--Thanks hornet
local _G = GLOBAL
local PREFAB_SKINS = _G.PREFAB_SKINS
local PREFAB_SKINS_IDS = _G.PREFAB_SKINS_IDS
local SKIN_AFFINITY_INFO = GLOBAL.require("skin_affinity_info")

modimport("skins_api") --Hornet: We import the file! If you named your file something else other than skins_api then youll want to rename this function to the name of the file

SKIN_AFFINITY_INFO.hatkid = {
	"hatkid_cat",
	"hatkid_detective",

	"hatkid_dye_niko",
	"hatkid_dye_toonlink",
	"hatkid_dye_pinkdanger",
}

--Hornet: The table of skins youre going to have, You can have as many skins as you want!

PREFAB_SKINS["hatkid"] = {
	--outfits
	"hatkid_none", 
	"hatkid_cat",
	"hatkid_detective",
	--"hatkid_raincoat", -- plan on adding eventually
	--"hatkid_snatcher", -- plan on adding eventually

	--dyes
	"hatkid_dye_niko",
	"hatkid_dye_toonlink",
	"hatkid_dye_pinkdanger",

} 

PREFAB_SKINS_IDS = {} --Make sure this is after you  change the PREFAB_SKINS["character"] table
for prefab,skins in pairs(PREFAB_SKINS) do
    PREFAB_SKINS_IDS[prefab] = {}
    for k,v in pairs(skins) do
      	  PREFAB_SKINS_IDS[prefab][v] = k
    end
end


AddSkinnableCharacter("hatkid") --Hornet: The character youd like to skin, make sure you use the prefab name. And MAKE sure you run this function AFTER you import the skins_api file

-- ITEM skins section, NOT CHARACTER SKINS
-- Thanks Cunning Fox

-- BROKEN as of the crafting menu update! 
-- modimport("scripts/libs/skins_api.lua")



-- Character ingredient hack
-- Apparently making new character ingredients is either not easy as I thought when I started,
-- or I overlooked some simple function or method that does this all for me. Either way, I've done this mess now,
-- and it works.


-- We start by adding pon as a global constant
GLOBAL.CHARACTER_INGREDIENT.PON = "pon"


-- Here we hook into a function that tells things our ingredient IS a character ingredient
local _IsCharacterIngredient = GLOBAL.IsCharacterIngredient

 -- We must replace IsCharacterIngredient, for some reason we can't add Pon to CHARACTER_INGREDIENT properly ourselves.
GLOBAL.IsCharacterIngredient = function(ingredienttype)
	if ingredienttype == "pon" then
		return ingredienttype ~= nil
	end

	local ret = _IsCharacterIngredient(ingredienttype)
	return ret
end


-- Here we replace some stuff in Builder so we can use pon properly in recipes
AddComponentPostInit("builder", function(self)
	-- Remove Ingredients
	local _RemoveIngredients = self.RemoveIngredients

	self.RemoveIngredients = function(self, ingredients, recname)
		local recipe = GLOBAL.AllRecipes[recname]

		if recipe then
			for k,v in pairs(recipe.character_ingredients) do
				if v.type == GLOBAL.CHARACTER_INGREDIENT.PON then
					-- print("-------------------------------------------------------------------------")
	
					-- print(self.inst.prefab)
					self.inst.pons = math.max(self.inst.pons - v.amount, 0)
					-- self.inst:PushEvent("")
				end
			end
		end
		local ret = _RemoveIngredients(self, ingredients, recname)
		return ret
	end



	-- Has Ingredients
	local _HasCharacterIngredient = self.HasCharacterIngredient

	self.HasCharacterIngredient = function(self, ingredient)
		if ingredient.type == GLOBAL.CHARACTER_INGREDIENT.PON then
			if self.inst.pons ~= nil then
				local current = math.ceil(self.inst.pons)
				return current >= ingredient.amount, current
			end
		end


		local ret = _HasCharacterIngredient(self, ingredient)
		return ret
	end
end)

AddClassPostConstruct("components/builder_replica", function(self)
	local _HasCharacterIngredient = self.HasCharacterIngredient

	self.HasCharacterIngredient = function(self, ingredient)
		if self.inst.components.builder ~= nil then
			return self.inst.components.builder:HasCharacterIngredient(ingredient)
		elseif self.classified ~= nil then
			-- print("local hook success")
			if ingredient.type == GLOBAL.CHARACTER_INGREDIENT.PON then
				-- print("-------------------------------------------------------------------------")
				local pons = self.inst.pons
				-- print(self.inst.prefab)
				if pons ~= nil then
					local current = math.ceil(pons)
					return current >= ingredient.amount, current
				end
			end  
		end	
		local ret = _HasCharacterIngredient(self, ingredient)
		return ret
	end
end)


AddClassPostConstruct("components/inventory_replica", function(self)
	local _GetNumSlotsreplica = self.GetNumSlots
	function self:GetNumSlots(...)
		if self.inst.components.inventory ~= nil then
			return self.inst.components.inventory:GetNumSlots()
		else
			return self.inst.maxslotsinv or _GetNumSlotsreplica(self, ...)
		end
	end	
end)

local _makereadonly = GLOBAL.makereadonly
function GLOBAL.makereadonly(t, k)
	if k == "maxslots" then
		return
	end
	
	_makereadonly(t, k)
end



--TUNING STUFF
TUNING.HATKID_ABILITYKEY = GetModConfigData("hatkid_polarhatkey")


--Character stat config
TUNING.HATKID_HEALTH = GetModConfigData("hatkidbasehp")
TUNING.HATKID_SANITY = GetModConfigData("hatkidbasesanity")
TUNING.HATKID_HUNGER = GetModConfigData("hatkidbasehunger")
TUNING.HATKIDRATE = GetModConfigData("hatkidrate")
TUNING.HATKIDDAMAGEDEALT = GetModConfigData("hatkiddamagedealt")
TUNING.HATKIDDAMAGETAKEN = GetModConfigData("hatkiddamagetaken")
TUNING.HATKIDSPEED = GetModConfigData("hatkidspeed")
TUNING.HATKIDNIGHTDRAIN = GetModConfigData("hatkidnightdrain")
TUNING.HATKIDSANITYDRAIN = GetModConfigData("hatkidsanitydrain")
TUNING.HATKIDSANITYMULT = GetModConfigData("hatkidsanitymult")
-- Other character stuff
TUNING.HATKIDSIZE = GetModConfigData("hatkidbasesize")
TUNING.HATKIDVOICE = GetModConfigData("hatkidvoice")




--Hatbrella stuff
TUNING.HATBRELLA_DURABILITY = GetModConfigData("hatbrelladurability")
TUNING.HATBRELLA_DAMAGE = GetModConfigData("hatbrelladamage")
TUNING.HATBRELLA_OPENDURABILITY = GetModConfigData("hatbrellaopendurability")
TUNING.HATBRELLA_WATERPROOFNESS = GetModConfigData("hatbrellaopenwaterproofness")

--Togglables
-- TUNING.ENABLE_PONS = GetModConfigData("enablepons")

--Kid Hat
TUNING.KIDHAT_DURABILITY = GetModConfigData("kidhatdurability")
TUNING.KIDHAT_SANITY = GetModConfigData("kidhatsanity")
TUNING.KIDHAT_WATERPROOFNESS = GetModConfigData("kidhatwaterproofness")

--Sprint
TUNING.SPRINTHAT_DURABILITY = GetModConfigData("sprinthatdurability")
TUNING.SPRINTHAT_INSULATION = GetModConfigData("sprinthatinsulation")
TUNING.SPRINTHAT_SPEED_MULT = GetModConfigData("sprinthatspeedmult")
TUNING.SPRINTHAT_HUNGER_BURNRATE = GetModConfigData("sprinthathungerburnrate")
TUNING.SPRINTHAT_SFX = GetModConfigData("sprinthatsfx")
TUNING.SPRINTHAT_VFX = GetModConfigData("sprinthatvfx")

--Brewing
TUNING.BREWINGHAT_DURABILITY = GetModConfigData("brewdurability")
TUNING.BREWINGHAT_COOLDOWN = GetModConfigData("brewcooldown")
TUNING.BREWINGHAT_THRESHHOLD = GetModConfigData("brewthreshhold")
TUNING.BREWINGHAT_CHARGETIME = GetModConfigData("brewcharge")
TUNING.BREWINGHAT_SLOWDOWN  = GetModConfigData("brewslow")
TUNING.BREWINGHAT_DAMAGE = GetModConfigData("brewdamage")
TUNING.BREWINGHAT_RADIUS  = GetModConfigData("brewradius")


--Polar
TUNING.POLARHAT_DURABILITY = GetModConfigData("polardurability")
TUNING.POLARHAT_COOLDOWN = GetModConfigData("polarcooldown")
TUNING.POLARHAT_LEVEL = GetModConfigData("polarlevel")
TUNING.POLARHAT_TEMP = GetModConfigData("polartemp")
TUNING.POLARHAT_RADIUS = GetModConfigData("polarradius")


--Dweller
TUNING.DWELLERMASK_DURABILITY = GetModConfigData("dwellerfuelcapacity")
TUNING.DWELLERMASK_VALUE = GetModConfigData("dwellerfuelvalue")
TUNING.DWELLERMASK_COOLDOWN = GetModConfigData("dwellercooldown")
TUNING.DWELLERMASK_LINGER = GetModConfigData("dwellerlinger")
TUNING.DWELLERMASK_RADIUS = GetModConfigData("dwellerradius")
TUNING.DWELLERMASK_DAPPERNESS = GetModConfigData("dwellersanitydrain")
TUNING.DWELLERMASK_THRESHHOLD = GetModConfigData("dwellerthreshhold")

TUNING.DWELLERMASK_BLOCK_SANITY = GetModConfigData("dwellerblocksanity")
TUNING.DWELLERMASK_BLOCK_FUEL = GetModConfigData("dwellerblockfuel")
TUNING.DWELLERMASK_BLOCK_AMOUNT = GetModConfigData("dwellerblockamount")

TUNING.DWELLERMASK_REVIVE_PENALTIES = GetModConfigData("dwellerrevivepenalties")
TUNING.DWELLERMASK_REVIVE_REWARD = GetModConfigData("dwellerrevivereward")
TUNING.DWELLERMASK_REVIVE_FUEL = GetModConfigData("dwellerrevivefuel")

TUNING.DWELLERMASK_SFX = GetModConfigData("dwellersfx")
TUNING.DWELLERMASK_VFX = GetModConfigData("dwellervfx")

--Time Stop
TUNING.TIMESTOPHAT_DURABILITY = GetModConfigData("timestopdurability")
TUNING.TIMESTOPHAT_COOLDOWN = GetModConfigData("timestopcooldown")
TUNING.TIMESTOPHAT_DURATION = GetModConfigData("timestopactive")
TUNING.TIMESTOPHAT_TIMESCALE = GetModConfigData("timestopscale")

-- Pons and Badges
TUNING.PONS_MAX = GetModConfigData("ponsmax")

--funny mode
TUNING.FUNNYMODE = GetModConfigData("funnymode")


TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.HATKID = {"kidhat"}



--[[
   _____                   __   _     _                        _____   _              __    __
  / ____|                 / _| | |   (_)                      / ____| | |            / _|  / _|
 | |       _ __    __ _  | |_  | |_   _   _ __     __ _      | (___   | |_   _   _  | |_  | |_
 | |      | '__|  / _` | |  _| | __| | | | '_ \   / _` |      \___ \  | __| | | | | |  _| |  _|
 | |____  | |    | (_| | | |   | |_  | | | | | | | (_| |      ____) | | |_  | |_| | | |   | |
  \_____| |_|     \__,_| |_|    \__| |_| |_| |_|  \__, |     |_____/   \__|  \__,_| |_|   |_|
                                                   __/ |
                                                  |___/
]]

AddCharacterRecipe("hatbrella",
	{ -- ingredients
		GLOBAL.Ingredient("silk", 1),	
		GLOBAL.Ingredient("twigs", 2),
		GLOBAL.Ingredient("goldnugget", 1),
	},
	GLOBAL.TECH.SCIENCE_ONE, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"WEAPONS",
		"RAIN",
		"SUMMER"
	}
)


AddCharacterRecipe("kidhat",
	{ -- ingredients
	GLOBAL.Ingredient("beefalowool", 4),
	GLOBAL.Ingredient("goldnugget", 1),
	},
	GLOBAL.TECH.NONE, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"CLOTHING"
	}
)


AddCharacterRecipe("sprinthat",
	{ -- ingredients
	GLOBAL.Ingredient("silk", 1),	
	GLOBAL.Ingredient("beefalowool", 4),
	GLOBAL.Ingredient("feather_robin", 2),
	},
	GLOBAL.TECH.SCIENCE_ONE, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"CLOTHING"
	}
)


AddCharacterRecipe("brewinghat",
	{ -- ingredients
		GLOBAL.Ingredient("silk", 3),
		GLOBAL.Ingredient("slurtleslime", 2),
		GLOBAL.Ingredient("purplegem", 1),
	},
	GLOBAL.TECH.MAGIC_TWO, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"WEAPONS",
		"TOOLS",
		"CLOTHING"
	}
)

AddCharacterRecipe("polarhat",
	{ -- ingredients
		GLOBAL.Ingredient("winterhat", 1),
		GLOBAL.Ingredient("ice", 2),
		GLOBAL.Ingredient("bluegem", 1),
	},
	GLOBAL.TECH.MAGIC_TWO, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"WINTER",
		"SUMMER",
		"CLOTHING"
	}
)

AddCharacterRecipe("dwellermask",
	{ -- ingredients
		GLOBAL.Ingredient("nightmarefuel", 4),
		GLOBAL.Ingredient("thulecite", 2),
		GLOBAL.Ingredient("greengem", 1)
	},
	GLOBAL.TECH.MAGIC_THREE, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"LIGHT",
		"RESTORATION",
		"ARMOUR",
		"CLOTHING"
	}
)

AddCharacterRecipe("timestophat",
	{ -- ingredients
		GLOBAL.Ingredient("silk", 4),	
		GLOBAL.Ingredient("moonglass", 3),
		GLOBAL.Ingredient("greengem", 1),
	},
	GLOBAL.TECH.MOON_ALTAR_TWO, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"CLOTHING"
	}
)

-- End crafting

-- Thanks Kzisor/Ysovuka for the Key Handling code.
-- Key Handling guide https://forums.kleientertainment.com/forums/topic/63754-tutorial-character-transformation/
local mod_option = "hatkid_polarhatkey"
local character = "HATKID"
GLOBAL.TUNING[GLOBAL.string.upper(character)] = {}
GLOBAL.TUNING[GLOBAL.string.upper(character)].KEY = GetModConfigData(mod_option) or 122

-- This is gross.
local function Ability(inst)
	local hat = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HEAD)
	if hat ~= nil then
		hat:PushEvent("AbilityKey")
	end
end


-- This adds the handler, which means that if the server gets told "AbilityDown",
-- it will call the function, AbilityDown, above, with the correct player information on the server side.
AddModRPCHandler("HatKidRPC", "AbilityKeyDown", Ability)

-- if TUNING.ENABLE_PONS then
-- 	AddClassPostConstruct("widgets/statusdisplays", function(self)
-- 		if self.owner:HasTag("hatkid") then
-- 			if self.ponbadge == nil then
-- 				local PonBadge      = require "widgets/ponbadge"

-- 				self.ponbadge = self:AddChild(PonBadge(self.owner))
				

-- 				-- Checks for combined status from the workshop. We should reposition if it's enabled.
-- 				local cs_enabled = GLOBAL.KnownModIndex:IsModEnabled("workshop-376333686")

-- 				if cs_enabled then -- if using cs
-- 					self.ponbadge:SetPosition(0, -52)
-- 				else -- If we're using vanilla hud
-- 					self.ponbadge:SetPosition(0, -130, 0)
-- 				end

-- 				self.ponbadge:SetPercent(self.owner.pons / TUNING.PONS_MAX, TUNING.PONS_MAX)
-- 				self.ponbadge:SetClickable(true)

-- 				self.owner:ListenForEvent("UpdatePons", function()
-- 					self.ponbadge:SetPercent(self.owner.pons / TUNING.PONS_MAX, TUNING.PONS_MAX)
-- 				end)
-- 			end
-- 		end
-- 	end)
-- end



--Item and character strings

GLOBAL.STRINGS.CHARACTER_SURVIVABILITY.hatkid = "Smol"


-- String declarations
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
---- Item skin strings ----
STRINGS.SKIN_NAMES.kidhat_dye_niko = "Margin of the Night"
STRINGS.SKIN_NAMES.kidhat_dye_toonlink = "The Forest Critter"
STRINGS.SKIN_NAMES.kidhat_dye_pinkdanger = "Cute `n Dangerous"

STRINGS.SKIN_NAMES.hatbrella_bowkid = "Bow Kid's Favorite"


---- Character skin strings ----
STRINGS.NAMES.HATKID = "Hat Kid"
STRINGS.CHARACTERS.HATKID = require "speech_hatkid" -- speech file

-- The character select screen lines
STRINGS.CHARACTER_TITLES.hatkid = "The Homesick Hatter"
STRINGS.CHARACTER_NAMES.hatkid = "Hat Kid"
STRINGS.CHARACTER_DESCRIPTIONS.hatkid = "*Knits cool hats\n*Is selfish and obsessive over them\n*Has a vulnerable mind\n*Considered extremely cute"
STRINGS.CHARACTER_QUOTES.hatkid = "\"Oh, hi there!\""

--Skin STRINGS

	--Outfits
STRINGS.SKIN_NAMES.hatkid_none = "Hat Kid"
STRINGS.SKIN_NAMES.hatkid_cat = "The Nyakuza"
STRINGS.SKIN_NAMES.hatkid_detective = "The Detective"
	--Dyes
STRINGS.SKIN_NAMES.hatkid_dye_niko = "Margin of the Night" --Oneshot
STRINGS.SKIN_NAMES.hatkid_dye_toonlink = "The Forest Critter" -- Wind Waker
STRINGS.SKIN_NAMES.hatkid_dye_pinkdanger = "Cute 'n Dangerous" -- Extremely Pink


STRINGS.SKIN_QUOTES.hatkid_none = "\"Oh, hi there!\"" -- Redundant, mostly here for organization's sake. I believe the game uses the default quote with no skin selected, not this one.
STRINGS.SKIN_DESCRIPTIONS.hatkid_none = "A royal purple and gold outfit, best fit for a cute adventurer. Complete with a cape and a giant, very necessary zipper."

STRINGS.SKIN_QUOTES.hatkid_cat = "\"Cat crime!\""
STRINGS.SKIN_DESCRIPTIONS.hatkid_cat = "A cat themed varsity outfit, complete with mask and tail, which also may or may not be directly tied to countless illegal acts."

STRINGS.SKIN_QUOTES.hatkid_detective = "\"MYURDER!\""
STRINGS.SKIN_DESCRIPTIONS.hatkid_detective = "A detective outfit, worn by only the most mature of detectives!"

STRINGS.SKIN_QUOTES.hatkid_dye_niko = "\"Oh, hi there!\""
STRINGS.SKIN_DESCRIPTIONS.hatkid_dye_niko = "An outfit that you oddly associate with cats and lightbulbs."

STRINGS.SKIN_QUOTES.hatkid_dye_toonlink = "\"Oh, hi there!\""
STRINGS.SKIN_DESCRIPTIONS.hatkid_dye_toonlink = "Why would you ever want to wake up the wind? How would you even do that?"

STRINGS.SKIN_QUOTES.hatkid_dye_pinkdanger = "\"Oh, hi there!\""
STRINGS.SKIN_DESCRIPTIONS.hatkid_dye_pinkdanger = "An outfit with lethal amounts of lightish red."


STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATKID =
{
	GENERIC = "It's Hat Kid!",
	ATTACKER = "I hope she didn't mean to do that.",
	MURDERER = "A murder? On MY owl express?",
	REVIVER = "She must like ghosts.",
	GHOST = "We should help the poor kid.",
	FIRESTARTER = "Should she have matches?",
}

STRINGS.CHARACTERS.HATKID.DESCRIBE.HATKID =
{
	GENERIC = "Oh hi there!",
	ATTACKER = "I don't like her.",
	MURDERER = "MYURDER!",
	REVIVER = "Nice job, me.",
	GHOST = "How am I dead?",
	FIRESTARTER = "Oh come on! We're better than this!",
}


-- Item names
STRINGS.NAMES.KIDHAT = "Kid's Hat"
	-- STRINGS.NAMES.KIDHAT_CAT = STRINGS.NAMES.KIDHAT -- Does not exist
	STRINGS.NAMES.KIDHAT_DETECTIVE = "Detective's Cap"
	STRINGS.NAMES.KIDHAT_DYE_NIKO = STRINGS.NAMES.KIDHAT
	STRINGS.NAMES.KIDHAT_DYE_TOONLINK = STRINGS.NAMES.KIDHAT
	STRINGS.NAMES.KIDHAT_DYE_PINKDANGER = STRINGS.NAMES.KIDHAT

STRINGS.NAMES.SPRINTHAT = "Sprint Hat"
STRINGS.NAMES.BREWINGHAT = "Brewing Hat"
STRINGS.NAMES.POLARHAT = "Ice Hat"
STRINGS.NAMES.DWELLERMASK = "Dweller's Mask"
STRINGS.NAMES.TIMESTOPHAT = "Time Stop Hat"

STRINGS.NAMES.HATBRELLA = "Blue Umbrella"
	STRINGS.NAMES.HATBRELLA_BOWKID = "Pink Umbrella"

STRINGS.NAMES.HATBRELLAOPEN = "Open Blue Umbrella"
	STRINGS.NAMES.HATBRELLAOPEN_BOWKID = "Open Pink Umbrella"

STRINGS.NAMES.KIDPOTION_THROWABLE = "Mad Concoction"
STRINGS.NAMES.KIDPOTION = "Brewing Concoction"

--Recipe Descriptions
STRINGS.RECIPE_DESC.KIDHAT = "Your pride and joy."
STRINGS.RECIPE_DESC.SPRINTHAT = "This hat looks ready to sprint!"
STRINGS.RECIPE_DESC.BREWINGHAT = "Cook up mad concoctions!"
STRINGS.RECIPE_DESC.POLARHAT = "It's so cold!"
STRINGS.RECIPE_DESC.DWELLERMASK = "See the world through a Dweller's eyes!"
STRINGS.RECIPE_DESC.TIMESTOPHAT = "Death is inevitable. Your time is valuable."

STRINGS.RECIPE_DESC.HATBRELLA = "Diplomacy didn't work, time for action."

-- temporary
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KIDPOTION_THROWABLE = "Throwing these will be fun!"


--Describe strings, by order of css screen, but Hat Kid first.
-- generic is wilson, as well as any other undefined characters (eg. modded, future dlc's)

-- Hat Kid
STRINGS.CHARACTERS.HATKID.DESCRIBE.KIDHAT = "What a good hat."
STRINGS.CHARACTERS.HATKID.DESCRIBE.SPRINTHAT = "Gotta go fast, right?"
STRINGS.CHARACTERS.HATKID.DESCRIBE.BREWINGHAT = "It's spooky!"
STRINGS.CHARACTERS.HATKID.DESCRIBE.POLARHAT = "This hat is chill."
STRINGS.CHARACTERS.HATKID.DESCRIBE.DWELLERMASK = "This has changed just a little bit"
STRINGS.CHARACTERS.HATKID.DESCRIBE.TIMESTOPHAT = "Totally not overpowered!"
STRINGS.CHARACTERS.HATKID.DESCRIBE.HATBRELLA = "It has a good swing."
STRINGS.CHARACTERS.HATKID.DESCRIBE.HATBRELLAOPEN = "Good for rain, I guess."

-- Wilson/Generic
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KIDHAT = "It's a short and stout tophat."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SPRINTHAT = "It's a tennis cap with wings on it."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BREWINGHAT = "It's some sort of witch hat."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.POLARHAT = "A hat with ears."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DWELLERMASK = "It somehow acts as a light."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TIMESTOPHAT = "A stylish rubber band."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATBRELLA = "It's jammed shut."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATBRELLAOPEN = "What a cute umbrella."

-- Willow
STRINGS.CHARACTERS.WILLOW.DESCRIBE.KIDHAT = "A top hat and a lighter, a perfect combination."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.SPRINTHAT = "You could start a fire going that fast!"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.BREWINGHAT = "Potions are just another way to start fires!"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.POLARHAT = "Boo to this hat."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.DWELLERMASK = "Has science gone too far?"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.TIMESTOPHAT = "Can't touch this!"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.HATBRELLA = "I don't like the color."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.HATBRELLAOPEN = "I don't like the color."

-- Wolfgang
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.KIDHAT = "Is tiny hat, but still good!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.SPRINTHAT = "Hat is fast!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.BREWINGHAT = "Wolfgang is not scared of hat."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.POLARHAT = "Hat would make good ice cube!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.DWELLERMASK = "Mask light up Wolfgang"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.TIMESTOPHAT = "Hit Wolfgang! That is right... You can't."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.HATBRELLA = "The rain hurts my mighty skin."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.HATBRELLAOPEN = "The rain hurts my mighty skin."

-- Wendy
STRINGS.CHARACTERS.WENDY.DESCRIBE.KIDHAT = "A piece of finery to help forget the inescapable wild."
STRINGS.CHARACTERS.WENDY.DESCRIBE.SPRINTHAT = "It will still come, no matter how fast you run."
STRINGS.CHARACTERS.WENDY.DESCRIBE.BREWINGHAT = "It is as festive as it is lavender."
STRINGS.CHARACTERS.WENDY.DESCRIBE.POLARHAT = "A familiar chilling embrace."
STRINGS.CHARACTERS.WENDY.DESCRIBE.DWELLERMASK = "It's oozing."
STRINGS.CHARACTERS.WENDY.DESCRIBE.TIMESTOPHAT = "Death is inevitable, but this'll help."
STRINGS.CHARACTERS.WENDY.DESCRIBE.HATBRELLA = "The clouds weep."
STRINGS.CHARACTERS.WENDY.DESCRIBE.HATBRELLAOPEN = "The clouds weep."

-- WX78
STRINGS.CHARACTERS.WX78.DESCRIBE.KIDHAT = "INFERIOR TOP HAT"
STRINGS.CHARACTERS.WX78.DESCRIBE.SPRINTHAT = "FAST HEADWEAR MOVING AT EXTREMELY HIGH SPEED"
STRINGS.CHARACTERS.WX78.DESCRIBE.BREWINGHAT = "IT IS OUTDATED HARDWARE"
STRINGS.CHARACTERS.WX78.DESCRIBE.POLARHAT = "A GREAT EXTERNAL HEATSINK"
STRINGS.CHARACTERS.WX78.DESCRIBE.DWELLERMASK = "MASK DEFIES LOGIC"
STRINGS.CHARACTERS.WX78.DESCRIBE.TIMESTOPHAT = "IT CAN HIDE HUMAN MISTAKES"
STRINGS.CHARACTERS.WX78.DESCRIBE.HATBRELLA = "THIS WONT KEEP ME RUST FREE."
STRINGS.CHARACTERS.WX78.DESCRIBE.HATBRELLAOPEN = "THIS WILL KEEP ME RUST FREE."

-- Wickerbottom
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.KIDHAT = "How bourgeois."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.SPRINTHAT = "It makes me feel young again."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.BREWINGHAT = "This hat appears to be imbued with a magic power."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.POLARHAT = "This hat appears to suck out energy from anything it touches."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.DWELLERMASK = "I can almost sense it beckoning to something."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.TIMESTOPHAT = "This hat appears to put it's wearers in a different plane."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.HATBRELLA = "A simple apparatus for keeping dry."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.HATBRELLAOPEN = "A simple apparatus for keeping dry."

-- Woodie
STRINGS.CHARACTERS.WOODIE.DESCRIBE.KIDHAT = "It's the right amount of fancy."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.SPRINTHAT = "Looks like those birds were good for something after all."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.BREWINGHAT = "That hat's giving me the creeps."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.POLARHAT = "Now I can keep a cool head."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.DWELLERMASK = "Now I can keep a cool head."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.TIMESTOPHAT = "Looks like a watch for your head."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.HATBRELLA = "This will keep my beard dry, eh?"
STRINGS.CHARACTERS.WOODIE.DESCRIBE.HATBRELLAOPEN = "This will keep my beard dry, eh?"

-- Maxwell (Waxwell)
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.KIDHAT = "Some fine haberdashery."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.SPRINTHAT = "This hat holds an indescribable power."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.BREWINGHAT = "A hat befitting of a novice alchemist."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.POLARHAT = "It's frosted around the sides."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.DWELLERMASK = "It speaks with the shadow."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.TIMESTOPHAT = "It's above time to a disrespectful degree."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.HATBRELLA = "So hard to find a straightened around here."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.HATBRELLAOPEN = "So hard to find a straightened around here."

-- Wigfrid (Wathgrithr)
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.KIDHAT = "It can't even fit me!"
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.SPRINTHAT = "The feathers fill me with energy!"
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.BREWINGHAT = "I prefer unicorns over potions."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.POLARHAT = "The power of the teddy bear is a frigid one."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.DWELLERMASK = "A mask of dark powers."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.TIMESTOPHAT = "It could turn anyone into an artful dodger."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.HATBRELLA = "This is an otherworldly umbrella."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.HATBRELLAOPEN = "This is an otherworldly umbrella."

-- Webber
STRINGS.CHARACTERS.WEBBER.DESCRIBE.KIDHAT = "Like father used to wear."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.SPRINTHAT = "Weeeee!"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.BREWINGHAT = "That's a fancy traffic cone!"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.POLARHAT = "I guess it's nice."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.DWELLERMASK = "Did you hear something?"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.TIMESTOPHAT = "Is this for time traveling?"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.HATBRELLA = "This should keep some of the rain off of us."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.HATBRELLAOPEN = "This should keep some of the rain off of us."

-- Winona
STRINGS.CHARACTERS.WINONA.DESCRIBE.KIDHAT = "How bourgeoisie."
STRINGS.CHARACTERS.WINONA.DESCRIBE.SPRINTHAT = "That's quite the pair of feathers."
STRINGS.CHARACTERS.WINONA.DESCRIBE.BREWINGHAT = "You don't suppose there's toxic chemicals in this hat, is there?"
STRINGS.CHARACTERS.WINONA.DESCRIBE.POLARHAT = "Now I don't have to take any breaks to cool off."
STRINGS.CHARACTERS.WINONA.DESCRIBE.DWELLERMASK = "It's, uh, a mask."
STRINGS.CHARACTERS.WINONA.DESCRIBE.TIMESTOPHAT = "Smells like concentrated caffeine."
STRINGS.CHARACTERS.WINONA.DESCRIBE.HATBRELLA = "It serves its purpose."
STRINGS.CHARACTERS.WINONA.DESCRIBE.HATBRELLAOPEN = "It serves its purpose."

-- Start DLC
-- Warly
STRINGS.CHARACTERS.WARLY.DESCRIBE.KIDHAT = "It's not my style."
STRINGS.CHARACTERS.WARLY.DESCRIBE.SPRINTHAT = "You could forage at lightning speeds with a hat like that."
STRINGS.CHARACTERS.WARLY.DESCRIBE.BREWINGHAT = "This hat'd go great with my spices!"
STRINGS.CHARACTERS.WARLY.DESCRIBE.POLARHAT = "It gives me chills!"
STRINGS.CHARACTERS.WARLY.DESCRIBE.DWELLERMASK = "I must be crazy to fool around with this."
STRINGS.CHARACTERS.WARLY.DESCRIBE.TIMESTOPHAT = "Time waits for no one, except the person wearing this."
STRINGS.CHARACTERS.WARLY.DESCRIBE.HATBRELLA = "I will try to remember not to open indoors."
STRINGS.CHARACTERS.WARLY.DESCRIBE.HATBRELLAOPEN = "I will try to remember not to open indoors."


-- Wortox
STRINGS.CHARACTERS.WORTOX.DESCRIBE.KIDHAT = "Would you look at that, it's a hat!"
STRINGS.CHARACTERS.WORTOX.DESCRIBE.SPRINTHAT = "Feathers and horns go well together."
STRINGS.CHARACTERS.WORTOX.DESCRIBE.BREWINGHAT = "I hope the chemicals don't get into my horns."
STRINGS.CHARACTERS.WORTOX.DESCRIBE.POLARHAT = "This hat's pretty 'cool'."
STRINGS.CHARACTERS.WORTOX.DESCRIBE.DWELLERMASK = "Visions! Specters! I can see it all!"
STRINGS.CHARACTERS.WORTOX.DESCRIBE.TIMESTOPHAT = "Seems a little scary. I like it."
STRINGS.CHARACTERS.WORTOX.DESCRIBE.HATBRELLA = "No soggy imps on this fine day!"
STRINGS.CHARACTERS.WORTOX.DESCRIBE.HATBRELLAOPEN = "No soggy imps on this fine day!"

-- Wormwood
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.KIDHAT = "Hat."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.SPRINTHAT = "Fast hat."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.BREWINGHAT = "Hurty hat."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.POLARHAT = "Cold hat."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.DWELLERMASK = "Greeeeeen."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.TIMESTOPHAT = "Clock hat"
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.HATBRELLA = "Pain Bringer"
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.HATBRELLAOPEN = "Rain Taker"

-- Wurt
STRINGS.CHARACTERS.WURT.DESCRIBE.KIDHAT = "Nice hat."
STRINGS.CHARACTERS.WURT.DESCRIBE.SPRINTHAT = "Make girl go fast."
STRINGS.CHARACTERS.WURT.DESCRIBE.BREWINGHAT = "GLORPT! I don't wanna explode!"
STRINGS.CHARACTERS.WURT.DESCRIBE.POLARHAT = "Very cold, florp."
STRINGS.CHARACTERS.WURT.DESCRIBE.DWELLERMASK = "We see at night with scary mask."
STRINGS.CHARACTERS.WURT.DESCRIBE.TIMESTOPHAT = "Won't slow ME down, florp."
STRINGS.CHARACTERS.WURT.DESCRIBE.HATBRELLA = "Umbrella is closed."
STRINGS.CHARACTERS.WURT.DESCRIBE.HATBRELLAOPEN = "No more wet!"

-- Walter
STRINGS.CHARACTERS.WALTER.DESCRIBE.KIDHAT = "A respectable hat for a respectable kid!"
STRINGS.CHARACTERS.WALTER.DESCRIBE.SPRINTHAT = "Woah! That's gotta make you go fast, Hat Kid!"
STRINGS.CHARACTERS.WALTER.DESCRIBE.BREWINGHAT = "Seems dangerous, I think I'll leave it alone."
STRINGS.CHARACTERS.WALTER.DESCRIBE.POLARHAT = "Not my style, like I care anyway."
STRINGS.CHARACTERS.WALTER.DESCRIBE.DWELLERMASK = "Oooooo! I love scary stuff!"
STRINGS.CHARACTERS.WALTER.DESCRIBE.TIMESTOPHAT = "As long as it doesn't slow down Woby."
STRINGS.CHARACTERS.WALTER.DESCRIBE.HATBRELLA = "What a small umbrella."
STRINGS.CHARACTERS.WALTER.DESCRIBE.HATBRELLAOPEN = "Does that thing work well?"

-- Wanda
STRINGS.CHARACTERS.WANDA.DESCRIBE.KIDHAT = "A tiny little hat for a homesick hatter."
STRINGS.CHARACTERS.WANDA.DESCRIBE.SPRINTHAT = "The less time spent running, the better."
STRINGS.CHARACTERS.WANDA.DESCRIBE.BREWINGHAT = "Such destruction."
STRINGS.CHARACTERS.WANDA.DESCRIBE.POLARHAT = "Looks cold."
STRINGS.CHARACTERS.WANDA.DESCRIBE.DWELLERMASK = "Not this time."
STRINGS.CHARACTERS.WANDA.DESCRIBE.TIMESTOPHAT = "I'd love to try THAT out!"
STRINGS.CHARACTERS.WANDA.DESCRIBE.HATBRELLA = "Seems small, but it must hurt."
STRINGS.CHARACTERS.WANDA.DESCRIBE.HATBRELLAOPEN = "Time and umbrellas?"

-- Post inits
local afs_enabled = GLOBAL.KnownModIndex:IsModEnabled("workshop-2736043172") or GLOBAL.KnownModIndex:IsModEnabled("AutoFuelSlotDSTMod")

-- Check to make sure my other mod that does all this patching as well isn't present
-- Could cause issues if both try and patch the same code in similar ways



if not afs_enabled then
	-- Code in here is stolen from my mod Item Auto-Fuel Slots. I gave myself permission, don't worry!
	AddPrefabPostInit("lightbulb", function(inst)
		inst:AddTag("cavefuel")
	end)
	
	AddPrefabPostInit("slurtleslime", function(inst)
		inst:AddTag("cavefuel")
	end)
	
	AddPrefabPostInit("fireflies", function(inst)
		inst:AddTag("cavefuel")
	end)
	
	AddPrefabPostInit("nightmarefuel", function(inst)
		inst:AddTag("nightmarefuel")
	end)
	
	AddPrefabPostInit("wormlight", function(inst)
		inst:AddTag("wormfuel")
	end)
	
	AddPrefabPostInit("wormlight_lesser", function(inst)
		inst:AddTag("wormfuel")
	end)

	AddClassPostConstruct("screens/playerhud", function(self)
		-- Hook into playerhud:OpenContainer to get a head slot variant of a hand_inv container working correctly
		local _OpenContainer = self.OpenContainer
		local ContainerWidget = GLOBAL.require("widgets/containerwidget")
	
	
		self.OpenContainer = function(self, container, side)
	
			-- local OpenContainerWidget copy pasted from playerhud.lua, with one small change.
			local function OpenContainerWidget(self, container, side)
				local containerwidget = ContainerWidget(self.owner)
				local parent = side and self.controls.containerroot_side
				-- or (container.replica.container ~= nil and container.replica.container.type == "hand_inv") and self.controls.inv.hand_inv
				or (container.replica.container ~= nil and container.replica.container.type == "head_inv") and self.controls.inv.head_inv
				or (container.replica.container ~= nil and container.replica.container.type == "body_inv") and self.controls.inv.body_inv
				or (container.replica.container ~= nil and container.replica.container.type == "amulet_inv") and self.controls.inv.amulet_inv -- not in vanilla, added by other mods
				or self.controls.containerroot
	
				parent:AddChild(containerwidget)
			
				containerwidget:MoveToBack()
				containerwidget:Open(container, self.owner)
				self.controls.containers[container] = containerwidget
			end
	
	
			if container ~= nil and 
			((container.replica.container.type == "head_inv" and self.controls.inv.head_inv) or 
			(container.replica.container.type == "body_inv" and self.controls.inv.body_inv) or
			(container.replica.container.type == "amulet_inv" and self.controls.inv.amulet_inv)) then -- not in vanilla, added by other mods
				-- If we're using the head_inv slot, override the normal function so we're placed correctly.
				local ret = OpenContainerWidget(self, container, side)
				return ret
			else
				-- Otherwise, run the normal one.
				-- No need to check if container is nil, the original function does that for us.
				local ret = _OpenContainer(self, container, side)
				return ret
			end
		end
	end)
	
	AddClassPostConstruct("widgets/inventorybar", function(self)
		local Widget = GLOBAL.require "widgets/widget"
	
		local widgetscale = 1.5
	
		-- hand_inv added by the vanilla game
		self.hand_inv:SetScale(widgetscale, widgetscale)
	
		self.head_inv = self.root:AddChild(Widget("head_inv"))
		self.head_inv:SetScale(widgetscale, widgetscale)
	
		self.body_inv = self.root:AddChild(Widget("body_inv"))
		self.body_inv:SetScale(widgetscale, widgetscale)
	
		self.amulet_inv = self.root:AddChild(Widget("amulet_inv"))
		self.amulet_inv:SetScale(widgetscale, widgetscale)
		
		local _rebuild = self.Rebuild
	
		self.HeadInv = function(self)
	
			local function RebuildLayout(self, inventory, overflow, do_integrated_backpack, do_self_inspect)
				local W = 68
				local SEP = 12
				local INTERSEP = 28
	
				local num_slots = inventory:GetNumSlots()
				local num_equip = #self.equipslotinfo
				local num_buttons = do_self_inspect and 1 or 0
				local num_slotintersep = math.ceil(num_slots / 5)
				local num_equipintersep = num_buttons > 0 and 1 or 0
				local total_w = (num_slots + num_equip + num_buttons) * W + (num_slots + num_equip + num_buttons - num_slotintersep - num_equipintersep - 1) * SEP + (num_slotintersep + num_equipintersep) * INTERSEP
			
				local x = (W - total_w) * .5 + num_slots * W + (num_slots - num_slotintersep) * SEP + num_slotintersep * INTERSEP
				for k, v in ipairs(self.equipslotinfo) do
	
					if v.slot == GLOBAL.EQUIPSLOTS.HEAD then
						self.head_inv:SetPosition(x, do_integrated_backpack and 80 or 40, 0)
						self.head_inv:MoveToBack()
					end
	
					if v.slot == GLOBAL.EQUIPSLOTS.BODY then
						self.body_inv:SetPosition(x, do_integrated_backpack and 80 or 40, 0)
						self.body_inv:MoveToBack()
					end
	
					if GLOBAL.EQUIPSLOTS.NECK ~= nil and v.slot == GLOBAL.EQUIPSLOTS.NECK then -- added for compatiblity with equipslot mods. hopefully they call their slot this.
						self.amulet_inv:SetPosition(x, do_integrated_backpack and 80 or 40, 0)
						self.amulet_inv:MoveToBack()
					end
			
					x = x + W + SEP
				end
			end
	
			-- end layout rebuild
	
			if self.cursor ~= nil then
				self.cursor:Kill()
				self.cursor = nil
			end
		
			if self.toprow ~= nil then
				self.toprow:Kill()
				self.inspectcontrol = nil
			end
		
			if self.bottomrow ~= nil then
				self.bottomrow:Kill()
			end
	
		
			self.inv = {}
			self.equip = {}
			self.backpackinv = {}
		
			local controller_attached = GLOBAL.TheInput:ControllerAttached()
			self.controller_build = controller_attached
			self.integrated_backpack = controller_attached or GLOBAL.Profile:GetIntegratedBackpack()
		
			local inventory = self.owner.replica.inventory
		
			local overflow = inventory:GetOverflowContainer()
			overflow = (overflow ~= nil and overflow:IsOpenedBy(self.owner)) and overflow or nil
		
			local do_integrated_backpack = overflow ~= nil and self.integrated_backpack
			local do_self_inspect = not (self.controller_build or GLOBAL.GetGameModeProperty("no_avatar_popup"))
		
			RebuildLayout(self, inventory, overflow, do_integrated_backpack, do_self_inspect)
		
			self:SelectDefaultSlot()
			self.current_list = self.inv
			self:UpdateCursor()
		
			self.rebuild_pending = nil
			self.rebuild_snapping = nil
		end
	
	
	
		self.Rebuild = function(self)
			self.HeadInv(self)
	
			_rebuild(self)
		end
	end)
end

-- I would have put this directly in the prefab but I just stole code from my other mod and I'm too lazy to do this properly

if TUNING.DWELLERMASK_DURABILITY then
	AddPrefabPostInit("dwellermask", function(inst)
		local function OnTick(inst)
			if inst.components.container and inst.components.container:GetItemInSlot(1) then
				local owner = inst.components.inventoryitem:GetGrandOwner()

				local fueltogive = TUNING.DWELLERMASK_VALUE / inst.components.container:GetItemInSlot(1).components.fuel.fuelvalue
				local currentfuel = inst.components.fueled.currentfuel
				local maxfuel = inst.components.fueled.maxfuel

				if (maxfuel - currentfuel) > fueltogive then
					local fuelitem = inst.components.container:GetItemInSlot(1).components.stackable:Get(1)
					inst.components.fueled:TakeFuelItem(fuelitem, owner)
				end
			end
		end

		local function OnEquip(inst, data)
			local owner = data.owner
			if inst.components.container ~= nil then
				inst.components.container:Open(owner)
			end
		end

		local function OnUnequip(inst, data)
			local owner = data.owner
			if inst.components.container ~= nil then
				inst.components.container:Close(owner)
			end
		end
		
		-- Start Container stuff ---------
		local containers = GLOBAL.require("containers")
		params = containers.params

		params.dwellermask_inv =
		{
			widget =
			{
				slotpos =
				{
					GLOBAL.Vector3(0,   32 + 4,  0),
				},
				animbank = "ui_cookpot_1x2",
				animbuild = "ui_cookpot_1x2",
				pos = GLOBAL.Vector3(0, 15, 0),
			},
			usespecificslotsforitems = true,
			type = "head_inv",
		}
		
		function params.dwellermask_inv.itemtestfn(container, item, slot)
			return item:HasTag("nightmarefuel") -- Tag added by this mod, not in vanilla.
		end
		-- End Container -------
		

		if not GLOBAL.TheWorld.ismastersim then
			inst.OnEntityReplicated = function(inst) 
				inst.replica.container:WidgetSetup("dwellermask_inv") 
			end

			return
		end

		inst:AddComponent("container")
		inst.components.container:WidgetSetup("dwellermask_inv")
		inst.components.container.canbeopened = false

		inst.tick = inst:DoPeriodicTask(1, OnTick)

		inst:ListenForEvent("equipped", OnEquip)
		inst:ListenForEvent("unequipped", OnUnequip)
		inst:ListenForEvent("itemget", OnTick)
	end)
end

if TUNING.BREWINGHAT_DURABILITY then
	AddPrefabPostInit("brewinghat", function(inst)
		local function OnTick(inst)
			if inst.components.container and inst.components.container:GetItemInSlot(1) then
				local owner = inst.components.inventoryitem:GetGrandOwner()

				local fueltogive = 1 / inst.components.container:GetItemInSlot(1).components.fuel.fuelvalue
				local currentfuel = inst.components.fueled.currentfuel
				local maxfuel = inst.components.fueled.maxfuel

				if (maxfuel - currentfuel) > fueltogive then
					local fuelitem = inst.components.container:GetItemInSlot(1).components.stackable:Get(1)
					inst.components.fueled:TakeFuelItem(fuelitem, owner)
				end
			end
		end

		local function OnEquip(inst, data)
			local owner = data.owner
			if inst.components.container ~= nil then
				inst.components.container:Open(owner)
			end
		end

		local function OnUnequip(inst, data)
			local owner = data.owner
			if inst.components.container ~= nil then
				inst.components.container:Close(owner)
			end
		end
		
		-- Start Container stuff ---------
		local containers = GLOBAL.require("containers")
		params = containers.params

		params.brewinghat_inv =
		{
			widget =
			{
				slotpos =
				{
					GLOBAL.Vector3(0,   32 + 4,  0),
				},
				animbank = "ui_cookpot_1x2",
				animbuild = "ui_cookpot_1x2",
				pos = GLOBAL.Vector3(0, 15, 0),
			},
			usespecificslotsforitems = true,
			type = "head_inv",
		}
		
		function params.brewinghat_inv.itemtestfn(container, item, slot)
			return item.prefab == "slurtleslime" -- Tag added by this mod, not in vanilla.
		end
		-- End Container -------
		

		if not GLOBAL.TheWorld.ismastersim then
			inst.OnEntityReplicated = function(inst) 
				inst.replica.container:WidgetSetup("brewinghat_inv") 
			end

			return
		end

		inst:AddComponent("container")
		inst.components.container:WidgetSetup("brewinghat_inv")
		inst.components.container.canbeopened = false

		inst.tick = inst:DoPeriodicTask(1, OnTick)

		inst:ListenForEvent("equipped", OnEquip)
		inst:ListenForEvent("unequipped", OnUnequip)
		inst:ListenForEvent("itemget", OnTick)
	end)
end

-- We need to make an entire pseudo-frozen state specifically for using the ice hat, as we don't want to go to the hit state after being unfrozen, we don't want extra sounds, and we want to show the hud.
AddStategraphState("wilson",
State{
	name = "hat_frozen",
	tags = { "busy", "frozen", "nopredict", "nodangle" },

	onenter = function(inst)
		if inst.components.pinnable ~= nil and inst.components.pinnable:IsStuck() then
			inst.components.pinnable:Unstick()
		end

		-- Pseudo ForceStopHeavyLifting, since we're not actually in the sgwilson file, we can't access the local function for this.
		if inst.components.inventory:IsHeavyLifting() then
			inst.components.inventory:DropItem(
			inst.components.inventory:Unequip(GLOBAL.EQUIPSLOTS.BODY), true, true)
		end

		inst.components.locomotor:Stop()
		inst:ClearBufferedAction()

		inst.components.colouradder:PushColour("polarhat", 82 / 255, 115 / 255, 124 / 255, 0)

		inst.AnimState:OverrideSymbol("swap_frozen", "frozen", "frozen")
		inst.AnimState:PlayAnimation("frozen")

		inst.SoundEmitter:PlaySound("icestomp/sound/activate")

		inst:AddTag("alwaysblock")

		-- Just in case this somehow bugs out, force the player back to idle after 3 seconds, so they aren't stuck in place.
		-- Why did I name it jicle?
		inst.jicle = inst:DoTaskInTime(3, function(inst)
			inst.sg:GoToState("idle")
		end)
	end,

	events =
	{
		EventHandler("unequip", function(inst, data)
			if data.eslot == GLOBAL.EQUIPSLOTS.HEAD then
				inst.sg:GoToState("idle", true)
				inst.jicle:Cancel()
				inst.jicle = nil
			end
		end),
		EventHandler("doexplode", function(inst, data)
			inst.sg:GoToState("idle", true)
			inst.jicle:Cancel()
			inst.jicle = nil
		end),
	},

	onexit = function(inst)
		inst.AnimState:ClearOverrideSymbol("swap_frozen")
		inst.components.colouradder:PopColour("polarhat")
		inst:RemoveTag("alwaysblock")
	end,
}
)