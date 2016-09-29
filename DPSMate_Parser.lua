-- Notes
-- "Smbd reflects..." (Thorns etc.)
-- (%s%(%a-%))
-- /script local t = {}; for a,b,c,d in string.gfind("You hit Peter Hallow for 184.", "You (%a%a?)\it (.+) for (%d+)%.%s?(.*)") do t[1]=a;t[2]=b;t[3]=c;t[4]=d end; DPSMate:SendMessage(t[3]); DPSMate:SendMessage(t[4])
-- CHAT_MSG_SPELL_FAILED_LOCALPLAYER -> Examples: You fail to cast Heal: Interrupted. You fail to perform Bear Form: Not enough mana
-- SPELLCAST_INTERRUPTED

BINDING_HEADER_DPSMATE = "DPSMate"
BINDING_NAME_DPSMATE_REPORT = DPSMate.L["togglereportframe"]
BINDING_NAME_DPSMATE_TOGGLE = DPSMate.L["toggleframes"]
BINDING_NAME_DPSMATE_RESET = DPSMate.L["resetdpsmate"]

-- Global Variables
DPSMate.Parser.procs = {
	-- General
	[GetSpellInfo(25891)] = true, -- Earthstrike
	[GetSpellInfo(16322)] = true, -- Juju Flurry
	[GetSpellInfo(20007)] = true, -- Holy Strength
	[GetSpellInfo(23271)] = true, -- Ephemeral Power
	[GetSpellInfo(27675)] = true, -- Chromatic Infusion
	[GetSpellInfo(24590)] = true, -- Brittle Armor
	[GetSpellInfo(24659)] = true, -- Unstable Power
	[GetSpellInfo(28204)] = true, -- Ascendance
	[GetSpellInfo(28779)] = true, -- Essence of Sapphiron
	[GetSpellInfo(15601)] = true, -- Hand of Justice
	[GetSpellInfo(12815)] = true, -- Sword Specialization
	[GetSpellInfo(21153)] = true, -- Bonereaver's Edge
	[GetSpellInfo(16551)] = true, -- Felstriker
	[GetSpellInfo(22850)] = true, -- Sanctuary
	[GetSpellInfo(15494)] = true, -- Fury of Forgewright
	[GetSpellInfo(24255)] = true, -- Primal Blessing
	[GetSpellInfo(21186)] = true, -- Spinal Reaper
	[GetSpellInfo(22008)] = true, -- Netherwind Focus
	[GetSpellInfo(23548)] = true, -- Parry
	[GetSpellInfo(23719)] = true, -- Untamed Fury
	[GetSpellInfo(28862)] = true, -- The Eye of Diminution
	[GetSpellInfo(28866)] = true, -- Kiss of the Spider
	[GetSpellInfo(28773)] = true, -- Glyph of Deflection
	[GetSpellInfo(28780)] = true, -- The Eye of the Dead
	[GetSpellInfo(28777)] = true, -- Slayer's Crest
	[GetSpellInfo(26480)] = true, -- Badge of the Swarmguard
	[GetSpellInfo(26400)] = true, -- Arcane Shroud
	[GetSpellInfo(26470)] = true, -- Persistent Shield
	[GetSpellInfo(29604)] = true, -- Jom Gabbar
	[GetSpellInfo(29506)] = true, -- The Burrower's Shell
	[GetSpellInfo(12787)] = true, -- Thrash
	[GetSpellInfo(6615)] = true, -- Free Action
	[GetSpellInfo(24364)] = true, -- Living Free Action
	[GetSpellInfo(11359)] = true, -- Restoration
	[GetSpellInfo(17498)] = true, -- Speed
	[GetSpellInfo(3169)] = true, -- Invulnerability
	[GetSpellInfo(23688)] = true, -- Aura of the Blue Dragon
	[GetSpellInfo(23060)] = true, -- Battle Squawk
	[GetSpellInfo(24352)] = true, -- Devilsaur Fury
	[GetSpellInfo(3149)] = true, -- Furious Howl
	[GetSpellInfo(17534)] = true, -- Healing Potion
	[GetSpellInfo(22732)] = true, -- Major Rejuvenation Potion
	[GetSpellInfo(11903)] = true, -- Restore Mana
	[GetSpellInfo(15822)] = true, -- Dreamless Sleep
	
	-- Rogue
	[GetSpellInfo(43547)] = true, -- Slice and Dice
	[GetSpellInfo(13877)] = true, -- Blade Flurry
	[GetSpellInfo(2983)] = true, -- Sprint
	[GetSpellInfo(13750)] = true, -- Adrenaline Rush
	[GetSpellInfo(11329)] = true, -- Vanish
	[GetSpellInfo(14181)] = true, -- Relentless Strikes Effect
	[GetSpellInfo(14161)] = true, -- Ruthlessness
	[GetSpellInfo(27788)] = true, -- Rogue Armor Energize
	[GetSpellInfo(8065)] = true, -- Invigorate
	[GetSpellInfo(28813)] = true, -- Head Rush
	[GetSpellInfo(23726)] = true, -- Venomous Totem
	[GetSpellInfo(15087)] = true, -- Evasion
	[GetSpellInfo(9512)] = true, -- Restore Energy
	[GetSpellInfo(14148)] = true, -- Remorseless Attacks
	[GetSpellInfo(35546)] = true, -- Combat Potency
	[GetSpellInfo(14179)] = true, -- Relentless Strikes
	
	-- Mage
	[GetSpellInfo(12042)] = true, -- Arcane Power
	[GetSpellInfo(11129)] = true, -- Combustion
	[GetSpellInfo(23723)] = true, -- Mind Quickening
	[GetSpellInfo(26128)] = true, -- Enigma Resist Bonus
	[GetSpellInfo(26127)] = true, -- Enigma Blizzard Bonus
	[GetSpellInfo(28764)] = true, -- Adaptive Warding
	[GetSpellInfo(28762)] = true, -- Not There
	[GetSpellInfo(12472)] = true, -- Cold Snap
	[GetSpellInfo(12043)] = true, -- Presence of Mind
	[GetSpellInfo(11958)] = true, -- Ice Block
	
	-- Priest
	[GetSpellInfo(10060)] = true, -- Power Infusion
	[GetSpellInfo(26169)] = true, -- Oracle Healing Bonus
	[GetSpellInfo(28804)] = true, -- Epiphany
	[GetSpellInfo(23780)] = true, -- Aegis of Preservation
	[GetSpellInfo(15363)] = true, -- Inspiration
	[GetSpellInfo(27818)] = true, -- Blessed Recovery
	[GetSpellInfo(14743)] = true, -- Focused Casting
	[GetSpellInfo(15338)] = true, -- Spirit Tap
	
	-- Druid
	[GetSpellInfo(26107)] = true, -- Symbols of Unending Life Finisher Bonus
	[GetSpellInfo(23724)] = true, -- Metamorphosis Rune
	[GetSpellInfo(12536)] = true, -- Clearcasting
	[GetSpellInfo(16886)] = true, -- Nature's Grace
	
	-- Paladin
	[GetSpellInfo(26975)] = true, -- Battlegear of Eternal Justice
	[GetSpellInfo(23733)] = true, -- Blinding Light
	[GetSpellInfo(20216)] = true, -- Divine Favor
	[GetSpellInfo(13874)] = true, -- Divine Shield
	--[GetSpellInfo(20137)] = true, -- Redoubt
	[GetSpellInfo(9800)] = true, -- Holy Shield
	[GetSpellInfo(8602)] = true, -- Vengeance
	[GetSpellInfo(1044)] = true, -- Blessing of Freedom
	--[GetSpellInfo(20729)] = true, -- Blessing of Sacrifice
	[GetSpellInfo(1022)] = true, -- Blessing of Protection
	
	-- Shaman
	[GetSpellInfo(26121)] = true, -- Stormcaller's Wrath
	[GetSpellInfo(23734)] = true, -- Nature Aligned
	[GetSpellInfo(16166)] = true, -- Elemental Mastery
	[GetSpellInfo(10486)] = true, -- Windfury Weapon
	--[GetSpellInfo(10613)] = true, -- Windfury Totem
	[GetSpellInfo(17116)] = true, -- Nature's Swiftness
	[GetSpellInfo(16240)] = true, -- Ancestral Healing
	[GetSpellInfo(21169)] = true, -- Reincarnation
	[GetSpellInfo(25504)] = true, -- WF Attack
	[GetSpellInfo(2008)] = true, -- Ancestral Spirit
	
	-- Warlock
	[GetSpellInfo(28839)] = true, -- Vampirism
	[GetSpellInfo(18095)] = true, -- Nightfall
	[GetSpellInfo(19028)] = true, -- Soul Link
	
	-- Warrior
	[GetSpellInfo(28846)] = true, -- Cheat Death
	[GetSpellInfo(23783)] = true, -- Gift of Life
	[GetSpellInfo(2687)] = true, -- Bloodrage
	[GetSpellInfo(12974)] = true, -- Flurry
	[GetSpellInfo(12880)] = true, -- Enrage
	[GetSpellInfo(12723)] = true, -- Sweeping Strikes
	[GetSpellInfo(12328)] = true, -- Death Wish
	[GetSpellInfo(13847)] = true, -- Recklessness
	[GetSpellInfo(17528)] = true, -- Mighty Rage
	[GetSpellInfo(6613)] = true, -- Great Rage
	[GetSpellInfo(9174)] = true, -- Rage
	[GetSpellInfo(18499)] = true, -- Berserker Rage
	[GetSpellInfo(15062)] = true, -- Shield Wall
	[GetSpellInfo(20230)] = true, -- Retaliation
	[GetSpellInfo(24427)] = true, -- Diamond Flask
	[GetSpellInfo(12169)] = true, -- Shield Block
	[GetSpellInfo(12976)] = true, -- Last Stand
	
	-- Hunter
	[GetSpellInfo(23721)] = true, -- Arcane Infused
	[GetSpellInfo(6150)] = true, -- Quick Shots
	[GetSpellInfo(3045)] = true, -- Rapid Fire
	
	-- Boss debuffs
	[GetSpellInfo(19703)] = true, -- Lucifron's Curse
	[GetSpellInfo(19716)] = true, -- Gehennas' Curse
	[GetSpellInfo(19408)] = true, -- Panic
	[GetSpellInfo(20475)] = true, -- Living Bomb
	[GetSpellInfo(23170)] = true, -- Brood Affliction: Bronze
	[GetSpellInfo(18431)] = true, -- Bellowing Roar
	[GetSpellInfo(12542)] = true, -- Fear
	[GetSpellInfo(1121)] = true, -- Entangle
	[GetSpellInfo(26476)] = true, -- Digestive Acid
	[GetSpellInfo(28786)] = true, -- Locust Swarm
	[GetSpellInfo(28622)] = true, -- Web Wrap
	[GetSpellInfo(28169)] = true, -- Mutating Injection
	[GetSpellInfo(14100)] = true, -- Terrifying Roar
	
	-- New boss debuffs
	[GetSpellInfo(8147)] = true, -- Thunderclap
	[GetSpellInfo(33661)] = true, -- Crush Armor
	[GetSpellInfo(32686)] = true, -- Earthquake
	[GetSpellInfo(39837)] = true, -- Impaling Spine
	[GetSpellInfo(38235)] = true, -- Water Tomb
	[GetSpellInfo(38441)] = true, -- Cataclysmic Bolt
	[GetSpellInfo(38304)] = true, -- Earthbind Totem
	[GetSpellInfo(38357)] = true, -- Tidal Surge
	[GetSpellInfo(37730)] = true, -- Tidal Wave
	[GetSpellInfo(38258)] = true, -- Panic
	[GetSpellInfo(29833)] = true, -- Intangible Presence
	[GetSpellInfo(38907)] = true, -- Berserker Charge
	[GetSpellInfo(2094)] = true, -- Blind
	[GetSpellInfo(11285)] = true, -- Gouge
	[GetSpellInfo(8715)] = true, -- Terrifying Howl
	[GetSpellInfo(30756)] = true, -- Little Red Riding Hood
	[GetSpellInfo(30761)] = true, -- Wide Swipe
	[GetSpellInfo(31013)] = true, -- Frightened Scream
	[GetSpellInfo(31015)] = true, -- Annoying Yipping
	[GetSpellInfo(31046)] = true, -- Brain Bash
	[GetSpellInfo(29538)] = true, -- Cyclone
	[GetSpellInfo(30889)] = true, -- Powerful Attraction
	[GetSpellInfo(30815)] = true, -- Backward Lunge
	[GetSpellInfo(29512)] = true, -- Holy Ground
	[GetSpellInfo(20066)] = true, -- Repentance
	[GetSpellInfo(30115)] = true, -- Sacrifice
	[GetSpellInfo(2139)] = true, -- Counterspell
	[GetSpellInfo(29951)] = true, -- Blizzard
	[GetSpellInfo(31741)] = true, -- Slow
	[GetSpellInfo(12826)] = true, -- Polymorph
	[GetSpellInfo(11963)] = true, -- Enfeeble
	[GetSpellInfo(39095)] = true, -- Amplify Damage
	[GetSpellInfo(30130)] = true, -- Distracting Ash
	[GetSpellInfo(34267)] = true, -- Tail Sweep
	[GetSpellInfo(6789)] = true, -- Death Coil
	[GetSpellInfo(36297)] = true, -- Reverberation
	[GetSpellInfo(33525)] = true, -- Ground Slam
	[GetSpellInfo(33652)] = true, -- Stoned
	--[GetSpellInfo(30576)] = true, -- Quake
	[GetSpellInfo(44032)] = true, -- Mind Exhaustion
	[GetSpellInfo(36887)] = true, -- Deafening Roar
	[GetSpellInfo(44008)] = true, -- Static Disruption
	[GetSpellInfo(6982)] = true, -- Gust of Wind
	[GetSpellInfo(43437)] = true, -- Paralyzed
	[GetSpellInfo(19631)] = true, -- Melt Armor
	[GetSpellInfo(8988)] = true, -- Silence
	[GetSpellInfo(37029)] = true, -- Remote Toy
	[GetSpellInfo(36834)] = true, -- Arcane Disruption
	[GetSpellInfo(605)] = true, -- Mind Control
	[GetSpellInfo(35969)] = true, -- Gravity Lapse
	[GetSpellInfo(35879)] = true, -- Nether Vapor
	[GetSpellInfo(31306)] = true, -- Carrion Swarm
	[GetSpellInfo(1090)] = true, -- Sleep
	[GetSpellInfo(1122)] = true, -- Inferno
	[GetSpellInfo(27758)] = true, -- War Stomp
	[GetSpellInfo(31344)] = true, -- Howl of Azgalor
	[GetSpellInfo(31347)] = true, -- Doom
	[GetSpellInfo(32014)] = true, -- Air Burst
	[GetSpellInfo(23410)] = true, -- Wild Magic
	[GetSpellInfo(45150)] = true, -- Meteor Slash
	[GetSpellInfo(4282)] = true, -- Stomp
	[GetSpellInfo(45866)] = true, -- Corrosion
	[GetSpellInfo(45855)] = true, -- Gas Nova
	[GetSpellInfo(45662)] = true, -- Encapsulate
	[GetSpellInfo(45717)] = true, -- Fog of Corruption
	[GetSpellInfo(45347)] = true, -- Dark Touched
	[GetSpellInfo(45271)] = true, -- Dark Strike
	[GetSpellInfo(45230)] = true, -- Pyrogenics
	[GetSpellInfo(45348)] = true, -- Flame Touched
	[GetSpellInfo(46269)] = true, -- Darkness
	[GetSpellInfo(46161)] = true, -- Void Blast
	[GetSpellInfo(45642)] = true, -- Fire Bloom
	[GetSpellInfo(45885)] = true, -- Shadow Spike
	
	-- New to be added to special snowflaks
	[GetSpellInfo(27521)] = true, -- Mana Restore
	[GetSpellInfo(34460)] = true, -- Ferocious Inperation
	[GetSpellInfo(33370)] = true, -- Spell Haste
	[GetSpellInfo(28093)] = true, -- Lightning Speed
	[GetSpellInfo(37515)] = true, -- Blade Turning
	[GetSpellInfo(29801)] = true, -- Rampage
	
	[GetSpellInfo(39626)] = true, -- "Earthen Elixir" => true, 
	[GetSpellInfo(28515)] = true, -- "Ironshield Potion" => true,
	[GetSpellInfo(20925)] = true, -- "Holy Shield" => true,
	[GetSpellInfo(20127)] = true, -- "Redoubt" => true,
	[GetSpellInfo(33206)] = true, -- "Pain Supression" => true,
	[GetSpellInfo(35476)] = true, -- "Drums of Battle" => true,
	[GetSpellInfo(35474)] = true, -- "Drums of Panic" => true,
	[GetSpellInfo(35478)] = true, -- "Drums of Restoration" => true,
	[GetSpellInfo(35477)] = true, -- "Drums of Speed" => true,
	[GetSpellInfo(35475)] = true, -- "Drums of War" => true,
	[GetSpellInfo(38954)] = true, -- "Fel Strength Elixir" => true,
	[GetSpellInfo(39628)] = true, -- "Elixir of Ironskin" => true,
	[GetSpellInfo(39627)] = true, -- "Elixir of Draenic Wisdom" => true,
	[GetSpellInfo(33726)] = true, -- "Elixir of Mastery" => true,
	[GetSpellInfo(33721)] = true, -- "Adept's Elixir" => true,
	[GetSpellInfo(33720)] = true, -- "Onslaught Elixir" => true,
	[GetSpellInfo(13533)] = true, -- "Haste" => true,
	[GetSpellInfo(28506)] = true, -- "Potion of Heroes" => true,
	[GetSpellInfo(28508)] = true, -- "Destruction" => true,
	[GetSpellInfo(32601)] = true, -- "Surprise Attacks" => true,
	[GetSpellInfo(45273)] = true, -- "Shadowstep" => true,
	[GetSpellInfo(34471)] = true, -- "The Beast Within" => true,
	[GetSpellInfo(31842)] = true, -- "Divine Illumination" => true,
	[GetSpellInfo(30823)] = true, -- "Shamanistic Rage" => true,
}

DPSMate.Parser.BuffExceptions = {
	[GetSpellInfo(15494)] = true, -- Fury of Forgewright
	[GetSpellInfo(23581)] = true, -- Bloodfang
}

DPSMate.Parser.OtherExceptions = {
	[GetSpellInfo(17528)] = true, -- Mighty Rage
	[GetSpellInfo(2687)] = true, -- Bloodrage
	[GetSpellInfo(20007)] = true, -- Holy Strength
	[GetSpellInfo(15822)] = true, -- Dreamless Sleep
	[GetSpellInfo(28839)] = true, -- Vampirism
}
DPSMate.Parser.DmgProcs = {
	-- General
	[GetSpellInfo(20004)] = true, -- Life Steal
	[GetSpellInfo(21992)] = true, -- Thunderfury
	[GetSpellInfo(23581)] = true, -- Bloodfang
	[GetSpellInfo(10373)] = true, -- Fatal Wound
	[GetSpellInfo(25669)] = true, -- Decapitate
	[GetSpellInfo(21151)] = true, -- Gutgore Ripper
	--[GetSpellInfo(11765)] = true, -- Firebolt
	[GetSpellInfo(7140)] = true, -- Expose Weakness
	[GetSpellInfo(12528)] = true, -- Silence
	[GetSpellInfo(12486)] = true, -- Chilled
	[GetSpellInfo(26108)] = true, -- Glimpse of Madness
	[GetSpellInfo(21978)] = true, -- Engulfing Shadows
	[GetSpellInfo(28772)] = true, -- Elemental Vulnerability
	[GetSpellInfo(5926)] = true, -- Holy Power
	[GetSpellInfo(28815)] = true, -- Revealed Flaw
	[GetSpellInfo(28827)] = true, -- Totemic Power
	[GetSpellInfo(29164)] = true, -- Stygian Grasp
	[GetSpellInfo(29151)] = true, -- Electric Discharge
	[GetSpellInfo(18958)] = true, -- Flame Lash
	[GetSpellInfo(23605)] = true, -- Spell Vulnerability
	[GetSpellInfo(16614)] = true, -- Lightning Strike
}
DPSMate.Parser.TargetParty = {}
DPSMate.Parser.RCD = {
	[GetSpellInfo(15062)] = true, -- Shield Wall
	[GetSpellInfo(13847)] = true, -- Recklessness
	[GetSpellInfo(20230)] = true, -- Retaliation
	[GetSpellInfo(12976)] = true, -- Last Stand
	[GetSpellInfo(29166)] = true, -- Innervate
	[GetSpellInfo(13874)] = true, -- Divine Shield
	[GetSpellInfo(1022)] = true, -- Blessing of Protection
	[GetSpellInfo(23783)] = true, -- Gift of Life
	[GetSpellInfo(10322)] = true, -- Redemption
	[GetSpellInfo(20484)] = true, -- Rebirth
	[GetSpellInfo(2006)] = true, -- Resurrection
	[GetSpellInfo(21169)] = true, -- Reincarnation
	[GetSpellInfo(2008)] = true, -- Ancestral Spirit
	[GetSpellInfo(20765)] = true, -- Soulstone Resurrection
	
	-- Casted on ?
	[GetSpellInfo(34477)] = true, -- Missdirection
	[GetSpellInfo(6346)] = true, -- Fearward
}
DPSMate.Parser.FailDT = {
	-- PRE TBC
	[GetSpellInfo(11990)] = true, -- Rain of Fire
	[GetSpellInfo(19630)] = true, -- Cone of Fire
	[GetSpellInfo(20474)] = true, -- Lava Bomb
	[GetSpellInfo(20527)] = true, -- Eruption
	[GetSpellInfo(19798)] = true, -- Earthquake
	[GetSpellInfo(19780)] = true, -- Hand of Ragnaros
	[GetSpellInfo(20566)] = true, -- Wrath of Ragnaros
	[GetSpellInfo(19428)] = true, -- Conflagration
	[GetSpellInfo(11876)] = true, -- War Stomp
	[GetSpellInfo(19397)] = true, -- Incinerate
	[GetSpellInfo(8245)] = true, -- Corrosive Acid
	[GetSpellInfo(23189)] = true, -- Frost Burn
	[GetSpellInfo(23316)] = true, -- Ignite Flesh
	[GetSpellInfo(23312)] = true, -- Time Lapse
	[GetSpellInfo(9633)] = true, -- Whirlwind
	[GetSpellInfo(12766)] = true, -- Poison Cloud
	[GetSpellInfo(25672)] = true, -- Arcane Eruption
	[GetSpellInfo(10093)] = true, -- Harsh Winds
	[GetSpellInfo(26656)] = true, -- Sand Trap
	[GetSpellInfo(568)] = true, -- Arcane Burst
	[GetSpellInfo(32950)] = true, -- Eye Beam
	[GetSpellInfo(26029)] = true, -- Dark Glare
	[GetSpellInfo(29660)] = true, -- Negative Charge
	[GetSpellInfo(29659)] = true, -- Positive Charge
	[GetSpellInfo(28863)] = true, -- Void Zone
	[GetSpellInfo(3256)] = true, -- Plague Cloud
	[GetSpellInfo(10)] = true, -- Blizzard
	[GetSpellInfo(21098)] = true, -- Chill
	[GetSpellInfo(21099)] = true, -- Frost Breath
	[GetSpellInfo(27820)] = true, -- Mana Detonation
	[GetSpellInfo(27810)] = true, -- Shadow Fissure
	
}
DPSMate.Parser.FailDB = {
	-- PRE TBC
	[GetSpellInfo(22247)] = true, -- Suppression Aura
	[GetSpellInfo(18431)] = true, -- Bellowing Roar
}

--[[ CCBREAKER REWORK!
Maybe as dispell for certain effects:
Shapeshifting for Druids: 
Moonkin http://db.hellground.net/?spell=24858
Dire Bear http://db.hellground.net/?spell=9634
Bear http://db.hellground.net/?spell=5487
Cat http://db.hellground.net/?spell=768
Travel http://db.hellground.net/?spell=783
Aquatic http://db.hellground.net/?spell=1066
Flight http://db.hellground.net/?spell=33943
Swift Flight http://db.hellground.net/?spell=40120
Tree of Life http://db.hellground.net/?spell=33891
--]]

DPSMate.Parser.CC = {
	[GetSpellInfo(2070)] = 40, -- Sap
	[GetSpellInfo(12540)] = 5, -- Gouge
	[GetSpellInfo(12098)] = 30, -- Sleep
	[GetSpellInfo(118)] = 35, -- Polymorph
	[GetSpellInfo(22274)] = 35, -- Greater Polymorph
	[GetSpellInfo(228)] = 35, -- Polymorph: Chicken
	[GetSpellInfo(28272)] = 35, -- Polymorph: Pig
	[GetSpellInfo(851)] = 35, -- Polymorph: Sheep
	[GetSpellInfo(21060)] = 8, -- Blind
	[GetSpellInfo(14309)] = 15, -- Freezing Trap Effect
	[GetSpellInfo(5246)] = 5, -- Intimidating Shout
	[GetSpellInfo(19503)] = 3, -- Scatter Shot
	[GetSpellInfo(19386)] = 10, -- Wyvern Sting
	[GetSpellInfo(20407)] = 5, -- Seduction
	[GetSpellInfo(20066)] = 5, -- Repentance
	[GetSpellInfo(11444)] = 40, -- Shackle Undead
	[GetSpellInfo(13327)] = 25, -- Reckless Charge
	
	-- New
	[GetSpellInfo(18658)] = 30, -- Hibernate
	[GetSpellInfo(26989)] = 18, -- Entangling Roots
	[GetSpellInfo(5782)] = 8, -- Fear
	[GetSpellInfo(8122)] = 6, -- Psychic Scream
}

DPSMate.Parser.Dispels = {
	[GetSpellInfo(15729)] = true, -- Remove Curse
	[GetSpellInfo(4987)] = true, -- Cleanse
	[GetSpellInfo(475)] = true, -- Remove Lesser Curse
	[GetSpellInfo(1152)] = true, -- Purify
	[GetSpellInfo(21076)] = true, -- Dispel Magic
	[GetSpellInfo(14253)] = true, -- Abolish Poison
	[GetSpellInfo(552)] = true, -- Abolish Disease
	[GetSpellInfo(20428)] = true, -- Devour Magic
	[GetSpellInfo(528)] = true, -- Cure Disease
	--[GetSpellInfo(8166)] = true, -- Poison Cleansing Totem
	[GetSpellInfo(8947)] = true, -- Cure Poison
	[GetSpellInfo(8170)] = true, -- Disease Cleansing Totem
	[GetSpellInfo(370)] = true, -- Purge
	[GetSpellInfo(23787)] = true, -- Powerful Anti-Venom
	[GetSpellInfo(11359)] = true, -- Restoration
	[GetSpellInfo(17550)] = true, -- Purification
	[GetSpellInfo(17572)] = true, -- Purification Potion
	[GetSpellInfo(11522)] = true, -- Restorative Potion
	[GetSpellInfo(39897)] = true, -- Mass Dispel -- Does it work?
	[GetSpellInfo(30449)] = true, -- Spellsteal
}
DPSMate.Parser.DeCurse = {
	[GetSpellInfo(15729)] = true, -- Remove Curse
	[GetSpellInfo(475)] = true, -- Remove Lesser Curse
	[GetSpellInfo(11359)] = true, -- Restoration
	[GetSpellInfo(17550)] = true, -- Purification
	[GetSpellInfo(17572)] = true, -- Purification Potion
}
DPSMate.Parser.DeMagic = {
	[GetSpellInfo(21076)] = true, -- Dispel Magic
	[GetSpellInfo(20428)] = true, -- Devour Magic
	[GetSpellInfo(370)] = true, -- Purge
	[GetSpellInfo(11359)] = true, -- Restoration
	[GetSpellInfo(39897)] = true, -- Mass Dispel
	[GetSpellInfo(30449)] = true, -- Spellsteal
}
DPSMate.Parser.DeDisease = {
	[GetSpellInfo(1152)] = true, -- Purify
	[GetSpellInfo(552)] = true, -- Abolish Disease
	[GetSpellInfo(528)] = true, -- Cure Disease
	[GetSpellInfo(8170)] = true, -- Disease Cleansing Totem
	[GetSpellInfo(11359)] = true, -- Restoration
	[GetSpellInfo(17550)] = true, -- Purification
	[GetSpellInfo(17572)] = true, -- Purification Potion
}
DPSMate.Parser.DePoison = {
	[GetSpellInfo(14253)] = true, -- Abolish Poison
	[GetSpellInfo(1152)] = true, -- Purify
	--[GetSpellInfo(8166)] = true, -- Poison Cleansing Totem
	[GetSpellInfo(8947)] = true, -- Cure Poison
	[GetSpellInfo(23787)] = true, -- Powerful Anti-Venom
	[GetSpellInfo(11359)] = true, -- Restoration
	[GetSpellInfo(17550)] = true, -- Purification
	[GetSpellInfo(17572)] = true, -- Purification Potion
}
DPSMate.Parser.DebuffTypes = {}
DPSMate.Parser.HotDispels = {
	[GetSpellInfo(14253)] = true, -- Abolish Poison
	[GetSpellInfo(552)] = true, -- Abolish Disease
	[GetSpellInfo(11359)] = true, -- Restoration
}

DPSMate.Parser.Kicks = {
	[GetSpellInfo(12528)] = true, -- Silence
	[GetSpellInfo(12540)] = true, -- Gouge
	[GetSpellInfo(408)] = true, -- Kidney Shot
	[GetSpellInfo(14902)] = true, -- Cheap Shot
	[GetSpellInfo(19503)] = true, -- Scatter Shot
	--[GetSpellInfo(19415)] = true, -- Improved Concussive Shot
	[GetSpellInfo(19386)] = true, -- Wyvern Sting
	[GetSpellInfo(19577)] = true, -- Intimidation
	[GetSpellInfo(7922)] = true, -- Charge Stun
	[GetSpellInfo(20615)] = true, -- Intercept Stun
	[GetSpellInfo(12809)] = true, -- Concussion Blow
	[GetSpellInfo(16979)] = true, -- Feral Charge
	[GetSpellInfo(19675)] = true, -- Feral Charge Effect
	[GetSpellInfo(5211)] = true, -- Bash
	[GetSpellInfo(9005)] = true, -- Pounce
	--[GetSpellInfo(12360)] = true, -- Impact
	[GetSpellInfo(20066)] = true, -- Repentance
	[GetSpellInfo(853)] = true, -- Hammer of Justice
	[GetSpellInfo(18096)] = true, -- Pyroclasm
	[GetSpellInfo(6789)] = true, -- Death Coil
	--[GetSpellInfo(15326)] = true, -- Blackout
	--[GetSpellInfo(835)] = true, -- Tidal Charm
	[GetSpellInfo(13327)] = true, -- Reckless Charge
	
	-- New
	[GetSpellInfo(28730)] = true, -- Arcane Torrent
	[GetSpellInfo(16924)] = true, -- Celestial Focus
	[GetSpellInfo(20549)] = true, -- War Stomp
}
DPSMate.Parser.player = UnitName("player")
DPSMate.Parser.playerclass = nil
DPSMate.Parser.SubGroups = {}

-- Local Variables
local Execute = {}
local _,playerclass = UnitClass("player")
local DB = DPSMate.DB
local _G = getfenv(0)
local string_find = string.find
local strgfind = string.gmatch
local UL = UnitLevel
local t = {}
local UnitName = UnitName
local spellSchoolToString = {
	[1] = "physical",
	[2] = "holy",
	[3] = "holy",
	[4] = "fire",
	[5] = "fire",
	[6] = "fire",
	[8] = "nature",
	[9] = "nature",
	[10] = "nature",
	[12] = "fire",
	[16] = "frost",
	[17] = "frost",
	[18] = "frost",
	[20] = "frost",
	[24] = "frost",
	[32] = "shadow",
	[33] = "shadow",
	[34] = "shadow",
	[36] = "shadow",
	[40] = "shadow",
	[48] = "shadow",
	[64] = "arcane",
	[65] = "arcane",
	[66] = "arcane",
	[68] = "fire",
	[72] = "arcane",
	[80] = "frost",
	[96] = "shadow",
	
	-- I know that this is wrong
	[28] = "fire",
	[124] = "fire",
	[126] = "fire",
	[127] = "fire",
}
local strupper = string.upper
local strsub = string.sub
local strlower = string.lower
local tinsert = table.insert
local tnbr = tonumber
local FixCaps = function(capsstr)
	return strupper(strsub(capsstr,1,1))..strlower(strsub(capsstr,2))
end
local overheal = 0
local GetTime = GetTime
local SuccessfulCasts = {}
local GetSpellSource = function(spellName, dstName)
	local owner, secPrio = dstName
	for c, v in pairs(SuccessfulCasts) do
		if v then
			if (GetTime()-v[1])>2 then
				SuccessfulCasts[c]=nil
			else
				if v[2]==spellName then
					if v[4]==dstName then
						owner = v[3]
					else
						secPrio = v[3]
					end
				end
			end
		end
	end
	return secPrio or owner
end
local player = UnitName("player")
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitName = UnitName

local PrayerOfMendingCastId = 33076 -- Prayer of Mending (rank 1)
local PrayerOfMendingAuraId = 41635 -- Prayer of Mending (when Aura is applied)
local PrayerOfMendingHealId = 33110 -- Prayer of Mending (when healing)
local enslaveDemons = GetSpellInfo(11726)
local castingED

local LifebloomId = 33763
local LifebloomHealId = 33778
local EarthShieldTickId = 379

local EarthShieldId = {
	[974]=true, -- Earth Shield (rank 1)
	[32593]=true, -- Earth Shield (rank 2)
	[32594]=true, -- Earth Shield (rank 3)
}

local cacheDebuffExpirePoison = {}
local cacheDebuffExpireDisease = {}
local poisoncleansingTotem = GetSpellInfo(38396)
local diseasecleansingTotem = GetSpellInfo(8170)
local DispelTypeByTotem = {
	[diseasecleansingTotem] = DPSMate.L["disease"],
	[poisoncleansingTotem] = DPSMate.L["poison"],
}
local activeTotem = {}
local isTotemActive = function()
	local time = GetTime()
	for c,v in pairs(activeTotem) do
		if v and (GetTime()-v[2])<=120 then
			return true
		else
			activeTotem[c] = false
		end
	end
	return false
end
local findDispelOwner = function(totem, dstName, spellName)
	for c,v in pairs(activeTotem) do
		if v[1]==totem and (GetTime()-v[2])<=120 then
			if DPSMate.Parser.SubGroups[c]==DPSMate.Parser.SubGroups[dstName] then
				DB:Dispels(c, totem, dstName, spellName)
				return
			end
		end
	end
end
local getActiveTotemDispel = function(spellName, dstName)
	if isTotemActive() then
		if cacheDebuffExpirePoison[spellName] then
			if (cacheDebuffExpirePoison[spellName]-GetTime())>=1.5 then
				findDispelOwner(poisoncleansingTotem, dstName, spellName)
			end
		elseif cacheDebuffExpireDisease[spellName] then
			if (cacheDebuffExpireDisease[spellName]-GetTime())>1.5 then
				findDispelOwner(diseasecleansingTotem, dstName, spellName)
			end
		end
	end
end

-- Begin Functions

local unitStatus = {}
local uduptime = 0
local unitdiednotwork = true
local GNRM = GetNumRaidMembers
local GNPM = GetNumPartyMembers
local UID = UnitIsDead
local UN = UnitName
function DPSMate.Parser:UnitDiedHackFix(elapsed)
	if unitdiednotwork then
		uduptime = uduptime + elapsed
		if uduptime>=5 then
			local type = "raid"
			local num = GNRM()
			if num<=0 then
				type = "party"
				num = GNPM()
			end
			for i=1, num do
				local name = UN(type..i)
				if UID(type..num) then
					if unitStatus[name] then
						unitStatus[name] = false
						DB:UnregisterDeath(name)
					end
				else
					unitStatus[name] = true
				end
			end
			uduptime = 0
		end
	end
end

function DPSMate.Parser:OnLoad()
	if (not DPSMateUser[self.player]) then
		DB:BuildUser(self.player, strlower(playerclass))
	end
	DPSMateUser[self.player][8] = UL("player")
	-- Prevent this addon from causing issues
	if SW_FixLogStrings then
		DPSMate:SendMessage("Please disable SW_StatsFixLogStrings and SW_Stats. Those addons causes issues.")
	end
end

function DPSMate.Parser:GetPlayerValues()
	self.player = UnitName("player")
	player = UnitName("player")
	_,playerclass = UnitClass("player")
	self.playerclass = playerclass
	DPSMatePlayer[1] = self.player
	DPSMatePlayer[2] = playerclass
	local _, fac = UnitFactionGroup("player")
	if fac == "Alliance" then
		DPSMatePlayer[3] = 1
	elseif fac == "Horde" then
		DPSMatePlayer[3] = -1
	end
	DPSMatePlayer[4] = GetRealmName()
	DPSMatePlayer[5] = GetGuildInfo("player")
	DPSMatePlayer[6] = GetLocale()
	self:OnLoad()
end

function DPSMate.Parser:OnEvent(event)
	if arg2 and Execute[arg2] then
		Execute[arg2](nil,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16,arg17,arg18,arg19,arg20,arg21,arg22)
		return
	end
	if Execute[event] then
		Execute[event](nil,arg1,arg2,arg3,arg4,arg5)
		return
	end
end

function DPSMate.Parser:GetUnitByName(target)
	local unit = self.TargetParty[target]
	if not unit then
		if target==player then
			unit="player"
		elseif target==UnitName("target") then
			unit="target"
		end
	end
	return unit
end
local GetOverhealByName = function(amount, target)
	local result, unit = 0, DPSMate.Parser:GetUnitByName(target)
	if unit then result = amount-(UnitHealthMax(unit)-UnitHealth(unit)) end
	if result<0 then return 0 else return result end 
end
function DPSMate.Parser:UnitAuraDispels(unit)
	for i=1, 8 do
		local name, _, _, _, dispelType, _, expTime = UnitDebuff(unit, i)
		if not name then break end
		DB:BuildAbility(name, dispelType)
		DPSMateAbility[name][2] = dispelType
		
		-- Dispel Totem Part
		if dispelType == "Poison" then
			cacheDebuffExpirePoison[name] = GetTime()+(expTime or -1)
		elseif dispelType == "Disease" then
			cacheDebuffExpireDisease[name] = GetTime()+(expTime or -1)
		end
	end
end

function DPSMate.Parser:SwingDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,amount, school, resisted, blocked, absorbed, critical, glancing, crushing)
	local spellName = DPSMate.L["AutoAttack"]
	t = {}
	if critical then t[1]=0;t[2]=1 end
	if resisted then t[1]=0;t[3]=1 end
	if blocked then t[1]=0;t[4]=1 end
	if glancing then t[1]=0;t[5]=1; end
	if crushing then t[1]=0;t[6]=1 end
	srcGUID, srcName, spellName = DB:GetGuardianOwnerByGUID(srcGUID, srcName, spellName)
	local npcone, npctwo = DPSMate:IsNPC(srcGUID, srcName), DPSMate:IsNPC(dstGUID, dstName)
	if npcone and npctwo then return end
	if npcone then
		DB:EnemyDamage(false, DPSMateEDD, dstName, spellName, t[1] or 1, t[2] or 0, 0, 0, 0, 0, amount, srcName, t[4] or 0, t[6] or 0)
		DB:DamageTaken(dstName, spellName, t[1] or 1, t[2] or 0, 0, 0, 0, 0, amount, srcName, t[6] or 0)
	else
		DB:EnemyDamage(true, DPSMateEDT, srcName, spellName, t[1] or 1, t[2] or 0, 0, 0, 0, t[3] or 0, amount, dstName, t[4] or 0, t[6] or 0)
		DB:DamageDone(srcName, spellName, t[1] or 1, t[2] or 0, 0, 0, 0, t[3] or 0, amount, t[5] or 0, t[4] or 0)
		if DPSMate.Parser.TargetParty[dstName] and DPSMate.Parser.TargetParty[srcName] then DB:BuildFail(1, dstName, srcName, spellName, amount) end
		DB:AssignLastHit(dstName, srcName, spellName)
	end
	DB:EvaluateLastHitWithPOM(dstName)
	DB:DeathHistory(dstName, srcName, spellName, amount, t[1] or 1, t[2] or 0, 0, t[6] or 0)
	DB:AddSpellSchool(spellName, "physical", 6603)
	if absorbed then
		DB:SetUnregisterVariables(absorbed, spellName, srcName)
	end
end

-- IsOffHand doesnt exist yet
function DPSMate.Parser:SwingMissed(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, missType, amountMissed)
	t = {}
	srcName = srcName or DPSMate.L["unknown"]
	if missType == DPSMate.L["pabsorb"] then
		DB:Absorb(DPSMate.L["AutoAttack"], dstName, srcName, amountMissed)
		return -- Cant rly return here, can I?
	end
	if missType == DPSMate.L["pmiss"] then t[2]=1 end
	if missType == DPSMate.L["pdodge"] then t[3]=1 end
	if missType == DPSMate.L["pparry"] then t[4]=1 end
	if missType == DPSMate.L["presist"] then t[5]=1 end -- TO CONFIRM
	if missType == DPSMate.L["pblock"] then t[6]=1 end -- TO CONFIRM
	srcGUID, srcName, spellName = DB:GetGuardianOwnerByGUID(srcGUID, srcName, spellName)
	local npcone, npctwo = DPSMate:IsNPC(srcGUID, srcName), DPSMate:IsNPC(dstGUID, dstName)
	if npcone and npctwo then return end
	if npcone then
		DB:EnemyDamage(false, DPSMateEDD, dstName, DPSMate.L["AutoAttack"], 0, 0, t[2] or 0, t[4] or 0, t[3] or 0, t[5] or 0, 0, srcName, t[6] or 0, 0)
		DB:DamageTaken(dstName, DPSMate.L["AutoAttack"], 0, 0, t[2] or 0, t[4] or 0, t[3] or 0, t[5] or 0, 0, srcName, 0)
	else
		DB:EnemyDamage(true, DPSMateEDT, srcName, DPSMate.L["AutoAttack"], 0, 0, t[2] or 0, t[4] or 0, t[3] or 0, t[5] or 0, 0, dstName, t[6] or 0, 0)
		DB:DamageDone(srcName, DPSMate.L["AutoAttack"], 0, 0, t[2] or 0, t[4] or 0, t[3] or 0, t[5] or 0, 0, 0, t[6] or 0)
	end
end

function DPSMate.Parser:SpellDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, amount, school, resisted, blocked, absorbed, critical, glancing, crushing)
	t = {}
	srcName = srcName or DPSMate.L["penvironment"]
	if critical then t[1]=0;t[2]=1 end
	--if resisted then t[1]=0;t[3]=1 end -- Commented out because Im not tracking party resists
	if blocked then t[1]=0;t[4]=1 end
	if glancing then t[1]=0;t[5]=1 end
	if crushing then t[1]=0;t[6]=1 end
	if eventtype == "SPELL_PERIODIC_DAMAGE" then
		spellName = spellName..DPSMate.L["periodic"]
	end
	srcGUID, srcName, spellName = DB:GetGuardianOwnerByGUID(srcGUID, srcName, spellName)
	local npcone, npctwo = DPSMate:IsNPC(srcGUID, srcName), DPSMate:IsNPC(dstGUID, dstName)
	if npcone and npctwo then return end
	if spellName == DPSMate.L["AutoAttack"] then
		spellName = spellName..DPSMate.L["guardian"]
	end
	if npcone or srcName == DPSMate.L["penvironment"] then
		if DPSMate.Parser.FailDT[spellName] then DB:BuildFail(2, srcName, dstName, spellName, amount) end
		DB:EnemyDamage(false, DPSMateEDD, dstName, spellName, t[1] or 1, t[2] or 0, 0, 0, 0, 0, amount, srcName, t[4] or 0, t[6] or 0)
		DB:DamageTaken(dstName, spellName, t[1] or 1, t[2] or 0, 0, 0, 0, 0, amount, srcName, t[6] or 0)
	else
		if DPSMate.Parser.Kicks[spellName] then DB:AssignPotentialKick(srcName, spellName, dstName, GetTime()) end
		if DPSMate.Parser.DmgProcs[spellName] then DB:BuildBuffs(srcName, srcName, spellName, true) end
		DB:EnemyDamage(true, DPSMateEDT, srcName, spellName, t[1] or 1, t[2] or 0, 0, 0, 0, t[3] or 0, amount, dstName, t[4] or 0, t[6] or 0)
		DB:DamageDone(srcName, spellName, t[1] or 1, t[2] or 0, 0, 0, 0, t[3] or 0, amount, t[5] or 0, t[4] or 0)
		if DPSMate.Parser.TargetParty[dstName] and DPSMate.Parser.TargetParty[srcName] then DB:BuildFail(1, dstName, srcName, spellName, amount) end
		DB:AssignLastHit(dstName, srcName, spellName)
	end
	DB:EvaluateLastHitWithPOM(dstName)
	DB:UnregisterPotentialKick(srcName, spellName, GetTime())
	DB:AddSpellSchool(spellName,spellSchoolToString[spellSchool],spellId)
	DB:DeathHistory(dstName, srcName, spellName, amount, t[1] or 1, t[2] or 0, 0, t[6] or 0)
	if absorbed then
		DB:SetUnregisterVariables(absorbed, spellName, srcName)
	end
end

function DPSMate.Parser:SpellMissed(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, missType, amountMissed)
	t = {}
	srcName = srcName or DPSMate.L["unknown"]
	if missType == DPSMate.L["pabsorb"] then
		DB:Absorb(spellName, dstName, srcName, amountMissed)
		return -- Cant rly return here, can I?
	end
	if missType == DPSMate.L["pmiss"] then t[2]=1 end
	if missType == DPSMate.L["pdodge"] then t[3]=1 end
	if missType == DPSMate.L["pparry"] then t[4]=1 end
	if missType == DPSMate.L["presist"] then t[5]=1 end -- TO CONFIRM
	if missType == DPSMate.L["pblock"] then t[6]=1 end -- TO CONFIRM
	srcGUID, srcName, spellName = DB:GetGuardianOwnerByGUID(srcGUID, srcName, spellName)
	local npcone, npctwo = DPSMate:IsNPC(srcGUID, srcName), DPSMate:IsNPC(dstGUID, dstName)
	if npcone and npctwo then return end
	if npcone then
		DB:EnemyDamage(false, DPSMateEDD, dstName, spellName, 0, 0, t[2] or 0, t[4] or 0, t[3] or 0, t[5] or 0, 0, srcName, t[6] or 0, 0)
		DB:DamageTaken(dstName, spellName, 0, 0, t[2] or 0, t[4] or 0, t[3] or 0, t[5] or 0, 0, srcName, 0)
	else
		DB:EnemyDamage(true, DPSMateEDT, srcName, spellName, 0, 0, t[2] or 0, t[4] or 0, t[3] or 0, t[5] or 0, 0, dstName, t[6] or 0, 0)
		DB:DamageDone(srcName, spellName, 0, 0, t[2] or 0, t[4] or 0, t[3] or 0, t[5] or 0, 0, 0, t[6] or 0)
	end
end


-- custom spellId?
function DPSMate.Parser:EnvironmentalDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,enviromentalType, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing)
	t = {}
	if critical then t[1]=0;t[2]=1 end
	if resisted then t[1]=0;t[3]=1 end
	if blocked then t[1]=0;t[4]=1 end
	if glancing then t[1]=0;t[5]=1 end
	if crushing then t[1]=0;t[6]=1 end
	DB:EnemyDamage(false, DPSMateEDD, dstName, FixCaps(enviromentalType), t[1] or 1, t[2] or 0, 0, 0, 0, 0, amount, DPSMate.L["penvironment"], t[4] or 0, t[6] or 0)
	DB:DamageTaken(dstName, FixCaps(enviromentalType), t[1] or 1, t[2] or 0, 0, 0, 0, 0, amount, DPSMate.L["penvironment"], t[6] or 0)
	DB:DeathHistory(dstName, DPSMate.L["penvironment"], FixCaps(enviromentalType), amount, t[1] or 1, t[2] or 0, 0, t[6] or 0)
end

function DPSMate.Parser:SpellHeal(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, amount, critical)
	t = {}
	srcName = srcName or DPSMate.L["unknown"]
	if not DB:InCombat() then
		return
	end
	srcGUID, srcName, spellName = DB:GetGuardianOwnerByGUID(srcGUID, srcName, spellName)
	if not DPSMate:IsNPC(srcGUID, srcName) then
		if critical then t[1]=0;t[2]=critical end
		if eventtype == "SPELL_PERIODIC_HEAL" then
			spellName = spellName..DPSMate.L["periodic"]
		end
		if spellId == PrayerOfMendingHealId then
			srcName = DB:POM_Healed(srcName)
		end
		if spellId == EarthShieldTickId then
			srcName = DB:GetEarthShieldOwner(srcName)
		end
		if spellId == LifebloomHealId then
			srcName = DB:LifeBloomOwner(srcName)
		end
		DB:UnregisterPotentialKick(srcName, spellName, GetTime())
		overheal = GetOverhealByName(amount, dstName)
		DB:HealingTaken(DPSMateHealingTaken, dstName, spellName, t[1] or 1, t[2] or 0, amount, srcName)
		DB:HealingTaken(DPSMateEHealingTaken, dstName, spellName, t[1] or 1, t[2] or 0, amount-overheal, srcName)
		DB:Healing(0, DPSMateEHealing, srcName, spellName, t[1] or 1, t[2] or 0, amount-overheal, dstName)
		DB:Healing(1, DPSMateTHealing, srcName, spellName, t[1] or 1, t[2] or 0, amount, dstName)
		DB:DeathHistory(dstName, srcName, spellName, amount, t[1] or 1, t[2] or 0, 1, 0)
		if overheal>0 then
			DB:Healing(2, DPSMateOverhealing, srcName, spellName, t[1] or 1, t[2] or 0, overheal, dstName)
			DB:HealingTaken(DPSMateOverhealingTaken, dstName, spellName, t[1] or 1, t[2] or 0, overheal, srcName)
		end
		DB:AddSpellSchool(spellName,spellSchoolToString[spellSchool],spellId)
	end
end

function DPSMate.Parser:SpellAuraDispelled(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, extraSpellId, extraSpellName, extraSpellSchool)
	srcName = srcName or DPSMate.L["unknown"]
	DPSMate.DB:Dispels(srcName, spellName, dstName, extraSpellName)
	DB:AddSpellSchool(spellName,spellSchoolToString[spellSchool],spellId)
	DB:AddSpellSchool(extraSpellName,spellSchoolToString[extraSpellSchool],extraSpellId)
end

local BuffTypes = {
	["DEBUFF"] = true,
	["BUFF"] = false,
}
function DPSMate.Parser:SpellAuraApplied(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, auraType)
	srcName = srcName or GetSpellSource(spellName, dstName)
	if not DPSMate:IsNPC(dstGUID, dstName) then
		if DPSMate.Parser.RCD[spellName] then DPSMate:Broadcast(1, dstName, spellName) end
		if DPSMate.Parser.FailDB[spellName] then DB:BuildFail(3, srcName, dstName, spellName, 0) end
		if spellId == PrayerOfMendingAuraId then
			DB:POM_Gained(dstName)
		end
		DPSMate.DB:BuildBuffs(srcName, dstName, spellName, false)
	else
		if spellName == enslaveDemons then
			DB:AssignEnslavedDemon(dstGUID, castingED[1], castingED[2])
			return
		end
	end
	if DPSMate.Parser.CC[spellName] then DB:BuildActiveCC(dstName, spellName) end
	if DPSMate.Parser.Kicks[spellName] and srcName~=DPSMate.L["unknown"] then DB:AssignPotentialKick(srcName, spellName, dstName, GetTime()); end
	if DB.ShieldFlags[spellName] then DB:RegisterAbsorb(srcName, spellName, dstName) end
	DB:AddSpellSchool(spellName,spellSchoolToString[spellSchool],spellId,BuffTypes[auraType])
end

function DPSMate.Parser:SpellAuraRemoved(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, auraType)
	srcName = srcName or DPSMate.L["unknown"]
	if not DPSMate:IsNPC(dstGUID, dstName) then
		DB:UnregisterPotentialKick(dstName, spellName, GetTime())
		DPSMate.DB:DestroyBuffs(dstName, spellName)
		if DPSMate.Parser.RCD[spellName] then DPSMate:Broadcast(6, dstName, spellName) end
		if spellId == PrayerOfMendingAuraId then
			DB:POM_Faded(dstName)
		end
	end
	DB:RemoveActiveCC(dstName, spellName)
	if DB.ShieldFlags[spellName] then DB:UnregisterAbsorb(spellName, dstName) end
	DB:AddSpellSchool(spellName,spellSchoolToString[spellSchool],spellId,BuffTypes[auraType])
	getActiveTotemDispel(spellName, dstName)
end

function DPSMate.Parser:Interrupt(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, extraSpellId, extraSpellName, extraSpellSchool)
	srcName = srcName or DPSMate.L["unknown"]
	DPSMate.DB:Kick(srcName, dstName, spellName, extraSpellName)
	DB:AddSpellSchool(spellName,spellSchoolToString[spellSchool],spellId)
	DB:AddSpellSchool(extraSpellName,spellSchoolToString[extraSpellSchool],extraSpellId)
end

function DPSMate.Parser:UnitDied(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags) -- Killingblows :D
	if DPSMate:IsNPC(dstGUID) then
		DB:Attempt(false, true, dstName)
	else
		if dstName~=player then
			unitdiednotwork = false
		end
		DB:UnregisterDeath(dstName)
	end
end

function DPSMate.Parser:ExtraAttacks(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, amount)
	srcName = srcName or DPSMate.L["unknown"]
	DB.NextSwing[srcName] = {
		[1] = amount,
		[2] = spellName
	}
	DB.NextSwingEDD[srcName] = {
		[1] = amount,
		[2] = spellName
	}
	DB:BuildBuffs(srcName, srcName, spellName, true)
	DB:DestroyBuffs(srcName, spellName)
	DB:AddSpellSchool(spellName,spellSchoolToString[spellSchool],spellId)
end

function DPSMate.Parser:SpellCastStart(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool)
	srcName = srcName or DPSMate.L["unknown"]
	if not DPSMate:IsNPC(srcGUID, srcName) then
		if DPSMate.Parser.RCD[spellName] then DPSMate:Broadcast(2, srcName, dstName or DPSMate.L["unknown"], spellName) end
	end
	DB:RegisterPotentialKick(srcName, spellName, GetTime())
	DB:AddSpellSchool(spellName,spellSchoolToString[spellSchool],spellId)
	if spellName == enslaveDemons then
		castingED = {srcGUID, srcName}
		return
	end
end

function DPSMate.Parser:SpellCastSuccess(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool)
	if eventtype=="SPELL_INSTAKILL"then
		DB:UnregisterDeath(dstName)
		return
	end
	srcName = srcName or DPSMate.L["unknown"]
	if spellId == PrayerOfMendingCastId then
		DB:POM_Casted(srcName,dstName)
		return
	end
	if EarthShieldId[spellId] then
		DB:RegisterEarthShield(dstName, srcName)
		return
	end
	if spellId == LifebloomId then
		DB:RegisterLifeBloom(dstName, srcName)
		return
	end
	--if DPSMate.Parser.RCD[spellName] then DPSMate:Broadcast(1, srcName, spellName) end
	tinsert(SuccessfulCasts, {GetTime(), spellName, srcName, dstName})
	DB:AddSpellSchool(spellName,spellSchoolToString[spellSchool],spellId)
end

local linkQuality = {
	["9d9d9d"] = 0,
	["ffffff"] = 1,
	["1eff00"] = 2,
	["0070dd"] = 3,
	["a335ee"] = 4,
	["ff8000"] = 5
}
function DPSMate.Parser:Loot(msg)
	for a,b,c,d,e in strgfind(msg, DPSMate.L["loot1"]) do
		DB:Loot(a, linkQuality[b], tnbr(c), e)
		return
	end
	for a,b,c,d in strgfind(msg, DPSMate.L["loot2"]) do
		DB:Loot(player, linkQuality[a], tnbr(b), d)
		return
	end
	for a,b,c,d,e in strgfind(msg, "(.-) erhält Beute: |cff(.-)|Hitem:(%d+)(.+)%[(.+)%]|h|r") do
		DB:Loot(a, linkQuality[b], tnbr(c), e)
		return
	end
end

function DPSMate.Parser:Energize(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, amount, powerType) -- Potential to add here mana etc. gained mode
	if DPSMate.Parser.procs[spellName] and not DPSMate.Parser.OtherExceptions[spellName] then
		srcName = srcName or DPSMate.L["unknown"]
		DB:BuildBuffs(srcName, dstName, spellName, true)
		DB:DestroyBuffs(dstName, spellName)
		DB:AddSpellSchool(spellName,spellSchoolToString[spellSchool],spellId)
	end
end

function DPSMate.Parser:Summon(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool)
	srcName = srcName or DPSMate.L["unknown"]
	DB:AddPotentialGuardianForOwner(dstName or spellName, srcGUID, srcName)
	if DispelTypeByTotem[spellName] then
		activeTotem[srcName] = {spellName, GetTime()}
	end
end

Execute = {
	["SWING_DAMAGE"] = DPSMate.Parser.SwingDamage, 
	["SWING_MISSED"] = DPSMate.Parser.SwingMissed,
	["SPELL_DAMAGE"] = DPSMate.Parser.SpellDamage,
	["RANGE_DAMAGE"] = DPSMate.Parser.SpellDamage,
	["SPELL_PERIODIC_DAMAGE"] = DPSMate.Parser.SpellDamage,
	["DAMAGE_SHIELD"] = DPSMate.Parser.SpellDamage,
	["DAMAGE_SPLIT"] = DPSMate.Parser.SpellDamage,
	["ENVIRONMENTAL_DAMAGE"] = DPSMate.Parser.EnvironmentalDamage,
	["SPELL_MISSED"] = DPSMate.Parser.SpellMissed,
	["RANGE_MISSED"] = DPSMate.Parser.SpellMissed,
	["SPELL_PERIODIC_MISSED"] = DPSMate.Parser.SpellMissed,
	["DAMAGE_SHIELD_MISSED"] = DPSMate.Parser.SpellMissed,
	["SPELL_HEAL"] = DPSMate.Parser.SpellHeal,
	["SPELL_PERIODIC_HEAL"] = DPSMate.Parser.SpellHeal,
	["SPELL_DISPEL"] = DPSMate.Parser.SpellAuraDispelled,
	["SPELL_STOLEN"] = DPSMate.Parser.SpellAuraDispelled, -- Merging purge and dispel for now
	["SPELL_AURA_APPLIED"] = DPSMate.Parser.SpellAuraApplied,
	["SPELL_AURA_REMOVED"] = DPSMate.Parser.SpellAuraRemoved,
	["SPELL_INTERRUPT"] = DPSMate.Parser.Interrupt, -- Not taking stuns into account // Also not taking silences into account (atleast not aoe silence)
	["UNIT_DIED"] = DPSMate.Parser.UnitDied,
	["UNIT_DESTROYED"] = DPSMate.Parser.UnitDied,
	["SPELL_CAST_START"] = DPSMate.Parser.SpellCastStart,
	["SPELL_CAST_SUCCESS"] = DPSMate.Parser.SpellCastSuccess,
	["SPELL_INSTAKILL"] = DPSMate.Parser.SpellCastSuccess,
	["UNIT_AURA"] = DPSMate.Parser.UnitAuraDispels,
	["SPELL_ENERGIZE"] = DPSMate.Parser.Energize, -- Potential to add mana gained meter etc.
	["SPELL_PERIODIC_ENERGIZE"] = DPSMate.Parser.Energize,
	["SPELL_EXTRA_ATTACKS"] = DPSMate.Parser.ExtraAttacks,
	["CHAT_MSG_LOOT"] = DPSMate.Parser.Loot,
	
	["SPELL_SUMMON"] = DPSMate.Parser.Summon,
	
	
	--["SPELL_CAST_FAILED"] = DPSMate.Parser.Test2,
	
	-- TO BE TESTED
	--["SPELL_DRAIN"] = Recount.SpellDrainLeech, -- Elsia: Drains and leeches.
	--["SPELL_LEECH"] = Recount.SpellDrainLeech,
	--["SPELL_PERIODIC_DRAIN"] = Recount.SpellDrainLeech,
	--["SPELL_PERIODIC_LEECH"] = Recount.SpellDrainLeech,
	
	-- TO BE IMPLEMENTED
	--["SPELL_AURA_APPLIED_DOSE"] = DPSMate.Parser.Test,  -- Getting a stack more of Vengeance for example
	--["SPELL_AURA_REMOVED_DOSE"] = DPSMate.Parser.Test,
	
	-- Maybe for shields?
	--["SPELL_AURA_BROKEN"] = Recount.SpellAuraBroken, -- New with 2.4.3
	--["SPELL_AURA_BROKEN_SPELL"] = Recount.SpellAuraBroken, -- New with 2.4.3
	--["SPELL_AURA_REFRESH"] = Recount.SpellAuraAppliedRemoved, -- New with 2.4.3
	
	-- Maybe I can do sth with this
	--["SPELL_CAST_START"] = Recount.SpellCastStartSuccess, -- Elsia: Spell casts
	--["SPELL_CAST_SUCCESS"] = Recount.SpellCastStartSuccess,
	--["SPELL_INSTAKILL"] = Recount.SpellCastStartSuccess,
	--["SPELL_DURABILITY_DAMAGE"] = Recount.SpellCastStartSuccess,
	--["SPELL_DURABILITY_DAMAGE_ALL"] = Recount.SpellCastStartSuccess,
	--["SPELL_CAST_FAILED"] = Recount.SpellCastFailed, -- Elsia: Spell aborts/fails
}