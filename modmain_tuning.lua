local TUNING = GLOBAL.TUNING

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
TUNING.KIDHAT_INSULATION = GetModConfigData("kidhatinsulation")

--Sprint
TUNING.SPRINTHAT_DURABILITY = GetModConfigData("sprinthatdurability")
TUNING.SPRINTHAT_WATERPROOFNESS = GetModConfigData("sprinthatwaterproofness")
TUNING.SPRINTHAT_INSULATION = GetModConfigData("sprinthatinsulation")

TUNING.SPRINTHAT_SPEED_MULT = GetModConfigData("sprinthatspeedmult")
TUNING.SPRINTHAT_HUNGER_BURNRATE = GetModConfigData("sprinthathungerburnrate")
TUNING.SPRINTHAT_SFX = GetModConfigData("sprinthatsfx")
TUNING.SPRINTHAT_VFX = GetModConfigData("sprinthatvfx")

--Brewing
TUNING.BREWINGHAT_DURABILITY = GetModConfigData("brewdurability")
TUNING.BREWINGHAT_WATERPROOFNESS = GetModConfigData("brewwaterproofness")
TUNING.BREWINGHAT_INSULATION = GetModConfigData("brewinsulation")

TUNING.BREWINGHAT_COOLDOWN = GetModConfigData("brewcooldown")
TUNING.BREWINGHAT_THRESHHOLD = GetModConfigData("brewthreshhold")
TUNING.BREWINGHAT_CHARGETIME = GetModConfigData("brewcharge")
TUNING.BREWINGHAT_SLOWDOWN  = GetModConfigData("brewslow")
TUNING.BREWINGHAT_DAMAGE = GetModConfigData("brewdamage")
TUNING.BREWINGHAT_RADIUS  = GetModConfigData("brewradius")


--Polar
TUNING.POLARHAT_DURABILITY = GetModConfigData("polardurability")
TUNING.POLARHAT_WATERPROOFNESS = GetModConfigData("polarwaterproofness")
TUNING.POLARHAT_INSULATION = GetModConfigData("polarinsulation")

TUNING.POLARHAT_COOLDOWN = GetModConfigData("polarcooldown")
TUNING.POLARHAT_LEVEL = GetModConfigData("polarlevel")
TUNING.POLARHAT_TEMP = GetModConfigData("polartemp")
TUNING.POLARHAT_RADIUS = GetModConfigData("polarradius")


--Dweller
TUNING.DWELLERMASK_DURABILITY = GetModConfigData("dwellerfuelcapacity")
TUNING.DWELLERMASK_WATERPROOFNESS = GetModConfigData("dwellerwaterproofness")
TUNING.DWELLERMASK_INSULATION = GetModConfigData("dwellerinsulation")

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
TUNING.TIMESTOPHAT_WATERPROOFNESS = GetModConfigData("timestopwaterproofness")
TUNING.TIMESTOPHAT_INSULATION = GetModConfigData("timestopinsulation")

TUNING.TIMESTOPHAT_COOLDOWN = GetModConfigData("timestopcooldown")
TUNING.TIMESTOPHAT_DURATION = GetModConfigData("timestopactive")
TUNING.TIMESTOPHAT_TIMESCALE = GetModConfigData("timestopscale")

-- Pons and Badges
TUNING.PONS_MAX = GetModConfigData("ponsmax")

--funny mode
TUNING.FUNNYMODE = GetModConfigData("funnymode")


TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.HATKID = {"kidhat"}