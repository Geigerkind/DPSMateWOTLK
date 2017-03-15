-- Global Variables
DPSMate.DB.loaded = false
DPSMate.DB.ShieldFlags = {
	-- Blade Turning
	[37515] = 0,
	[37514] = 0,
	
	-- Sacred Shield
	[58597] = 0,
	
	-- Power Word: Shield
	[17] = 0,
	[592] = 0,
	[600] = 0,
	[3747] = 0,
	[6065] = 0,
	[10898] = 0,
	[10899] = 0,
	[10900] = 0,
	[10901] = 0,
	[11835] = 0,
	[25217] = 0,
	[25218] = 0,
	[27607] = 0,
	[29408] = 0,
	[44175] = 0,
	[44291] = 0,
	[46193] = 0,
	[48065] = 0,
	[48066] = 0,
	[66099] = 0,
	[68032] = 0,
	[71548] = 0,
	[71780] = 0,
	[20706] = 0,
	[11974] = 0,
	
	-- Ice Barrier
	[13031] = 0,
	[13032] = 0,
	[13033] = 0,
	[27134] = 0,
	[33405] = 0,
	[43038] = 0,
	[43039] = 0,
	[69787] = 0,
	[11426] = 0,
	
	-- The Burrower's Shell
	[29506] = 0,
	
	-- Aura of Protection
	[23506] = 0,
	
	-- Damage Absorb
	[23991] = 0,
	[25746] = 0,
	[25747] = 0,
	[25750] = 0,
	
	-- Physical Protection
	[21956] = 1,
	[34206] = 1,
	
	-- Harm Prevention Belt
	[13234] = 0,
	
	-- Mana Shield
	[1463] = 1,
	[1481] = 1,
	[8494] = 1,
	[8495] = 1,
	[8496] = 1,
	[8497] = 1,
	[10191] = 1,
	[10192] = 1,
	[10193] = 1,
	[10194] = 1,
	[10195] = 1,
	[10196] = 1,
	[17740] = 1,
	[27131] = 1,
	[27398] = 1,
	[30973] = 1,
	[31635] = 1,
	[35064] = 1,
	[43019] = 1,
	[43020] = 1,
	[46151] = 1,
	[58348] = 1,
	[8373] = 1,
	
	-- Frost Protection
	[7236] = 2,
	[7237] = 2,
	[7238] = 2,
	[7239] = 2,
	[7240] = 2,
	[16895] = 2,
	[17544] = 2,
	[28512] = 2,
	[53913] = 2,
	
	-- Frost Resistance
	[27534] = 2,
	[28766] = 2,
	
	-- Frost Ward
	[6143] = 2,
	[6144] = 2,
	[8461] = 2,
	[8462] = 2,
	[8463] = 2,
	[8464] = 2,
	[10177] = 2,
	[10178] = 2,
	[25641] = 2,
	[27396] = 2,
	[28609] = 2,
	[32796] = 2,
	[32797] = 2,
	[43012] = 2,
	
	-- Fire Protection
	[7230] = 3,
	[7231] = 3,
	[7232] = 3,
	[7233] = 3,
	[7234] = 3,
	[12561] = 3,
	[16894] = 3,
	[17543] = 3,
	[18942] = 3,
	[28511] = 3,
	[29432] = 3,
	[53911] = 3,
	
	-- Fire Ward
	[543] = 3,
	[1035] = 3,
	[8457] = 3,
	[8458] = 3,
	[8459] = 3,
	[8460] = 3,
	[10223] = 3,
	[10224] = 3,
	[10225] = 3,
	[10226] = 3,
	[27128] = 3,
	[27395] = 3,
	[43010] = 3,
	
	-- Nature Protection
	[7250] = 4,
	[7251] = 4,
	[7252] = 4,
	[7253] = 4,
	[7254] = 4,
	[16893] = 4,
	[17546] = 4,
	[28513] = 4,
	[53914] = 4,
	
	-- Shadow Protection
	[7235] = 5,
	[7241] = 5,
	[7242] = 5,
	[7243] = 5,
	[7244] = 5,
	[16891] = 5,
	[17548] = 5,
	[28537] = 5,
	[53915] = 5,
	
	-- Arcane Protection
	[17549] = 6,
	[28536] = 6,
	[53910] = 6,
	
	-- Holy Protection
	[7245] = 7,
	[7246] = 7,
	[7247] = 7,
	[7248] = 7,
	[7249] = 7,
	[16892] = 7,
	[17545] = 7,
	[28538] = 7,
	[27536] = 7,
	
	-- Val'anyr
	[64411] = 0,
	
	-- Anti-Magic-Shell
	[52918] = 0,
	[48707] = 0,
	[49088] = 0,
	
	-- Anti-Magic-Zone
	[50642] = 0,
	[53636] = 0,
	[53637] = 0,
	[72628] = 0,
	
	-- Bone Shield
	--[27688] = 0,
	
	-- Divine Guardian
	--[70940] = 0,
	
	-- Divine Protection
	--[498] = 0,
	--[13007] = 0,
	--[27778] = 0,
	--[27779] = 0,
	
	-- Divine Aegis
	[47753] = 0,
	[54704] = 0,
	
	-- Cheat Death
	[31231] = 0,
}
local AbilityFlags = {
	["fire"] = 3,
	["holy"] = 7,
	["arcane"] = 6,
	["shadow"] = 5,
	["nature"] = 4,
	["frost"] = 2,
	["physical"] = 1,
	
	["feuer"] = 3,
	["heilig"] = 7,
	["arkan"] = 6,
	["schatten"] = 5,
	["natur"] = 4,
	["frost"] = 2,
	["physisch"] = 1,
	
	["火焰"] = 3,
	["神圣"] = 7,
	["奥术"] = 6,
	["暗影"] = 5,
	["自然"] = 4,
	["冰霜"] = 2,
	["物理"] = 1,
	
	["ombre"] = 5,
	["feu"] = 3,
	["nature"] = 4,
	["givre"] = 2,
	["arcane"] = 6,
	["sacré"] = 7,
	["physique"] = 1,

	["огонь"] = 3,
	["обычный"] = 7,
	["тайная магия"] = 6,
	["тьма"] = 5,
	["природа"] = 4,
	["лед"] = 2,
	["физический урон"] = 1,
}
DPSMate.DB.NeedUpdate = false
DPSMate.DB.UserData = {}
DPSMate.DB.Zones = {
	[DPSMate.L["dun1"]] = true,
	[DPSMate.L["dun2"]] = true,
	[DPSMate.L["dun3"]] = true,
	[DPSMate.L["dun4"]] = true,
	[DPSMate.L["dun5"]] = true,
	[DPSMate.L["dun6"]] = true,
	[DPSMate.L["dun7"]] = true,
	[DPSMate.L["dun8"]] = true,
	[DPSMate.L["dun9"]] = true,
}
DPSMate.DB.NextSwing = {}
DPSMate.DB.NextSwingEDD = {}
DPSMate.DB.userlen = 0
DPSMate.DB.abilitylen = 0

-- Local Variables
local CombatState = false
local cheatCombat = 0
local UpdateTime = 0.25
local LastUpdate = 0
local MainLastUpdate = 0
local MainUpdateTime = 1.5
local tinsert = table.insert
local tremove = table.remove
local _G = getglobal
local player = ""
local GetTime = GetTime
local strfind = string.find
local UL = UnitLevel
local strlower = strlower
local UnitClass = UnitClass
local GetGuildInfo = GetGuildInfo
local GetRaidRosterInfo = GetRaidRosterInfo
local GetRealZoneText = GetRealZoneText
local GetNumPartyMembers = GetNumPartyMembers
local GetNumRaidMembers = GetNumRaidMembers
local GetGameTime = GetGameTime
local UnitName = UnitName
local UnitFactionGroup = UnitFactionGroup
local UnitAffectingCombat = UnitAffectingCombat
local UnitIsPlayer = UnitIsPlayer
local UnitIsDead = UnitIsDead
local UnitBuff = UnitBuff
local UnitInRaid = UnitInRaid
local pairs = pairs
local floor = floor
local UnitIsConnected = UnitIsConnected
local tablemodes = {[1]="total", [2]="current"}
local time, gen, path

-- Begin Functions

DPSMate.DB.VARIABLES_LOADED = function()
	if not this.loaded then
		if DPSMateSettings == nil then
			DPSMateSettings = {
				windows = {
					[1] = {
						name = "DPSMate",
						options = {
							[1] = {
								damage = true
							},
							[2] = {
								total = true
							}
						},
						CurMode = "damage",
						hidden = false,
						scale = 1,
						barfont = "FRIZQT",
						barfontsize = 13,
						barfontflag = "Outline",
						bartexture = "Minimalist",
						barspacing = 1,
						barheight = 17,
						classicons = true,
						ranks = true,
						titlebar = true,
						titlebarfont = "FRIZQT",
						titlebarfontflag = "None",
						titlebarfontsize = 12,
						titlebarheight = 17,
						titlebarreport = true,
						titlebarreset = true,
						titlebarsegments = true,
						titlebarconfig = true,
						titlebarsync = true,
						titlebarenable = true,
						titlebarfilter = true,
						titlebartexture = "Minimalist",
						titlebarbgcolor = {0.1568627450980392,0.1725490196078431,0.1647058823529412},
						titlebarfontcolor = {1.0,0.82,0.0},
						barfontcolor = {1.0,1.0,1.0},
						contentbgtexture = "UI-Tooltip-Background",
						contentbgcolor = {0.01568627450980392,0,1},
						bgbarcolor = {1,1,1},
						numberformat = 1,
						opacity = 1,
						bgopacity = 0,
						titlebaropacity = 1,
						filterclasses = {
							warrior = true,
							rogue = true,
							priest = true,
							hunter = true,
							mage = true,
							warlock = true,
							paladin = true,
							shaman = true,
							druid = true,
						},
						filterpeople = "",
						grouponly = true,
						realtime = false,
						cbtdisplay = false,
						barbg = false,
						totopacity = 1.0,
						borderopacity = 1.0,
						contentbordercolor = {0,0,0},
						borderstrata = 1,
						bordertexture = "UI-Tooltip-Border",
						position = {"CENTER",0,0},
						savsize = {150,100},
					}
				},
				lock = false,
				sync = true,
				enable = true,
				dataresetsworld = 2,
				dataresetsjoinparty = 2,
				dataresetsleaveparty = 2,
				dataresetspartyamount = 2,
				dataresetssync = 3,
				dataresetslogout = 2,
				showminimapbutton = true,
				showtotals = true,
				hidewhensolo = false,
				hideincombat = false,
				hideinpvp = false,
				disablewhilehidden = false,
				datasegments = 8,
				mergepets = true,
				columnsdps = {
					[1] = false,
					[2] = true,
					[3] = true,
					[4] = false
				},
				columnsdmg = {
					[1] = true,
					[2] = false,
					[3] = true,
					[4] = false
				},
				columnsdmgtaken = {
					[1] = true,
					[2] = false,
					[3] = true,
					[4] = false
				},
				columnsdtps = {
					[1] = false,
					[2] = true,
					[3] = true,
					[4] = false
				},
				columnsedd = {
					[1] = true,
					[2] = false,
					[3] = true,
					[4] = false
				},
				columnsedt = {
					[1] = true,
					[2] = false,
					[3] = true,
					[4] = false
				},
				columnshealing = {
					[1] = true,
					[2] = false,
					[3] = true,
					[4] = false
				},
				columnshealingtaken = {
					[1] = true,
					[2] = false,
					[3] = true,
					[4] = false
				},
				columnshps = {
					[1] = false,
					[2] = true,
					[3] = true,
					[4] = false
				},
				columnsohps = {
					[1] = false,
					[2] = true,
					[3] = true,
					[4] = false
				},
				columnsoverhealing = {
					[1] = true,
					[2] = false,
					[3] = true,
					[4] = false
				},
				columnsohealingtaken = {
					[1] = true,
					[2] = false,
					[3] = true,
					[4] = false
				},
				columnsehealing = {
					[1] = true,
					[2] = false,
					[3] = true,
					[4] = false
				},
				columnsehealingtaken = {
					[1] = true,
					[2] = false,
					[3] = true,
					[4] = false
				},
				columnsehps = {
					[1] = false,
					[2] = true,
					[3] = true,
					[4] = false
				},
				columnsabsorbs = {
					[1] = true,
					[2] = true,
					[3] = false,
					[4] = false
				},
				columnsabsorbstaken = {
					[1] = true,
					[2] = true,
					[3] = false,
					[4] = false
				},
				columnshab = {
					[1] = true,
					[2] = false,
					[3] = true,
					[4] = false
				},
				columnsdeaths = {
					[1] = true,
					[2] = true,
				},
				columnsinterrupts = {
					[1] = true,
					[2] = true,
				},
				columnsdispels = {
					[1] = true,
					[2] = true,
				},
				columnsdispelsreceived = {
					[1] = true,
					[2] = true,
				},
				columnsdecurses = {
					[1] = true,
					[2] = true,
				},
				columnsdecursesreceived = {
					[1] = true,
					[2] = true,
				},
				columnsdisease = {
					[1] = true,
					[2] = true,
				},
				columnsdiseasereceived = {
					[1] = true,
					[2] = true,
				},
				columnspoison = {
					[1] = true,
					[2] = true,
				},
				columnspoisonreceived = {
					[1] = true,
					[2] = true,
				},
				columnsmagic = {
					[1] = true,
					[2] = true,
				},
				columnsmagicreceived = {
					[1] = true,
					[2] = true,
				},
				columnsaurasgained = {
					[1] = true,
					[2] = true,
				},
				columnsauraslost = {
					[1] = true,
					[2] = true,
				},
				columnsaurauptime = {
					[1] = true,
					[2] = true,
				},
				columnsprocs = {
					[1] = true,
					[2] = true,
				},
				columnscasts = {
					[1] = true,
					[2] = true,
				},
				columnsthreat = {
					[1] = true,
					[2] = false,
					[3] = true,
					[4] = false
				},
				columnstps = {
					[1] = false,
					[2] = true,
					[3] = true,
					[4] = false
				},
				columnsfails = {
					[1] = true,
					[2] = true,
				},
				columnsccbreaker = {
					[1] = true,
					[2] = true,
				},
				columnsfriendlyfire = {
					[1] = true,
					[2] = false,
					[3] = true,
					[4] = false
				},
				columnsfriendlyfiretaken = {
					[1] = true,
					[2] = false,
					[3] = true,
					[4] = false
				},
				showtooltips = true,
				informativetooltips = true,
				subviewrows = 4,
				tooltipanchor = 5,
				onlybossfights = true,
				hiddenmodes = {},
				broadcasting = false,
				bccd = false,
				bcress = false,
				bckb = false,
				bcfail = false,
				bcrw = false,
				targetscale=0.58,
				hideonlogin = false,
				reportdelay = false,
				legacylogs = false,
			}
		end
		if DPSMateHistory == nil then 
			DPSMateHistory = {
				names = {},
				DMGDone = {},
				DMGetTimeaken = {},
				EDDone = {},
				EDTaken = {},
				THealing = {},
				EHealing = {},
				OHealing = {},
				EHealingTaken = {},
				THealingTaken = {},
				OHealingTaken = {},
				Absorbs = {},
				Deaths = {},
				Interrupts = {},
				Dispels = {},
				Auras = {},
				Fail = {},
				CCBreaker = {},
				Rezz = {}
			}
		end
		if DPSMateUser == nil then DPSMateUser = {} end
		if DPSMateAbility == nil then DPSMateAbility = {} end
		if DPSMateDamageDone == nil then DPSMateDamageDone = {[1]={},[2]={}} end
		if DPSMateDamageTaken == nil then DPSMateDamageTaken = {[1]={},[2]={}} end
		if DPSMateEDD == nil then DPSMateEDD = {[1]={},[2]={}} end
		if DPSMateEDT == nil then DPSMateEDT = {[1]={},[2]={}} end
		if DPSMateTHealing == nil then DPSMateTHealing = {[1]={},[2]={}} end
		if DPSMateEHealing == nil then DPSMateEHealing = {[1]={},[2]={}} end
		if DPSMateOverhealing == nil then DPSMateOverhealing = {[1]={},[2]={}} end
		if DPSMateHealingTaken == nil then DPSMateHealingTaken = {[1]={},[2]={}} end
		if DPSMateEHealingTaken == nil then DPSMateEHealingTaken = {[1]={},[2]={}} end
		if DPSMateOverhealingTaken == nil then DPSMateOverhealingTaken = {[1]={},[2]={}} end
		if DPSMateAbsorbs == nil then DPSMateAbsorbs = {[1]={},[2]={}} end
		if DPSMateDispels == nil then DPSMateDispels = {[1]={},[2]={}} end
		if DPSMateDeaths == nil then DPSMateDeaths = {[1]={},[2]={}} end
		if DPSMateInterrupts == nil then DPSMateInterrupts = {[1]={},[2]={}} end
		if DPSMateAurasGained == nil then DPSMateAurasGained = {[1]={},[2]={}} end
		if DPSMateFails == nil then DPSMateFails = {[1]={},[2]={}} end
		if DPSMateCCBreaker == nil then DPSMateCCBreaker = {[1]={},[2]={}} end
		if DPSMateRezz == nil then DPSMateRezz = {[1]={},[2]={}} end
		-- Legacy Logs support
		if DPSMateAttempts == nil then DPSMateAttempts = {} end
		if DPSMatePlayer == nil then DPSMatePlayer = {} end
		if DPSMateLoot == nil then DPSMateLoot = {} end
		
		if DPSMate.Modules.DPS then DPSMate.Modules.DPS.DB = DPSMateDamageDone end
		if DPSMate.Modules.Damage then DPSMate.Modules.Damage.DB = DPSMateDamageDone end
		if DPSMate.Modules.DamageTaken then DPSMate.Modules.DamageTaken.DB = DPSMateDamageTaken end
		if DPSMate.Modules.DTPS then DPSMate.Modules.DTPS.DB = DPSMateDamageTaken end
		if DPSMate.Modules.EDD then DPSMate.Modules.EDD.DB = DPSMateEDD end
		if DPSMate.Modules.EDT then DPSMate.Modules.EDT.DB = DPSMateEDT end
		if DPSMate.Modules.FriendlyFire then DPSMate.Modules.FriendlyFire.DB = DPSMateEDT end
		if DPSMate.Modules.FriendlyFireTaken then DPSMate.Modules.FriendlyFireTaken.DB = DPSMateEDT end
		if DPSMate.Modules.Healing then DPSMate.Modules.Healing.DB = DPSMateTHealing end
		if DPSMate.Modules.HPS then DPSMate.Modules.HPS.DB = DPSMateTHealing end
		if DPSMate.Modules.Overhealing then DPSMate.Modules.Overhealing.DB = DPSMateOverhealing end
		if DPSMate.Modules.EffectiveHealing then DPSMate.Modules.EffectiveHealing.DB = DPSMateEHealing end
		if DPSMate.Modules.EffectiveHPS then DPSMate.Modules.EffectiveHPS.DB = DPSMateEHealing end
		if DPSMate.Modules.HealingTaken then DPSMate.Modules.HealingTaken.DB = DPSMateHealingTaken end
		if DPSMate.Modules.EffectiveHealingTaken then DPSMate.Modules.EffectiveHealingTaken.DB = DPSMateEHealingTaken end
		if DPSMate.Modules.Absorbs then DPSMate.Modules.Absorbs.DB = DPSMateAbsorbs end
		if DPSMate.Modules.AbsorbsTaken then DPSMate.Modules.AbsorbsTaken.DB = DPSMateAbsorbs end
		if DPSMate.Modules.HealingAndAbsorbs then DPSMate.Modules.HealingAndAbsorbs.DB = DPSMateAbsorbs end
		if DPSMate.Modules.Deaths then DPSMate.Modules.Deaths.DB = DPSMateDeaths end
		if DPSMate.Modules.Dispels then DPSMate.Modules.Dispels.DB = DPSMateDispels end
		if DPSMate.Modules.DispelsReceived then DPSMate.Modules.DispelsReceived.DB = DPSMateDispels end
		if DPSMate.Modules.Decurses then DPSMate.Modules.Decurses.DB = DPSMateDispels end
		if DPSMate.Modules.DecursesReceived then DPSMate.Modules.DecursesReceived.DB = DPSMateDispels end
		if DPSMate.Modules.CureDisease then DPSMate.Modules.CureDisease.DB = DPSMateDispels end
		if DPSMate.Modules.CureDiseaseReceived then DPSMate.Modules.CureDiseaseReceived.DB = DPSMateDispels end
		if DPSMate.Modules.CurePoison then DPSMate.Modules.CurePoison.DB = DPSMateDispels end
		if DPSMate.Modules.CurePoisonReceived then DPSMate.Modules.CurePoisonReceived.DB = DPSMateDispels end
		if DPSMate.Modules.LiftMagic then DPSMate.Modules.LiftMagic.DB = DPSMateDispels end
		if DPSMate.Modules.LiftMagicReceived then DPSMate.Modules.LiftMagicReceived.DB = DPSMateDispels end
		if DPSMate.Modules.Interrupts then DPSMate.Modules.Interrupts.DB = DPSMateInterrupts end
		if DPSMate.Modules.AurasGained then DPSMate.Modules.AurasGained.DB = DPSMateAurasGained end
		if DPSMate.Modules.AurasLost then DPSMate.Modules.AurasLost.DB = DPSMateAurasGained end
		if DPSMate.Modules.AurasLost then DPSMate.Modules.AurasLost.DB = DPSMateAurasGained end
		if DPSMate.Modules.AurasUptimers then DPSMate.Modules.AurasUptimers.DB = DPSMateAurasGained end
		if DPSMate.Modules.Procs then DPSMate.Modules.Procs.DB = DPSMateAurasGained end
		if DPSMate.Modules.Casts then DPSMate.Modules.Casts.DB = DPSMateEDT end
		if DPSMate.Modules.Fails then DPSMate.Modules.Fails.DB = DPSMateFails end
		if DPSMate.Modules.CCBreaker then DPSMate.Modules.CCBreaker.DB = DPSMateCCBreaker end
		if DPSMate.Modules.OHPS then DPSMate.Modules.OHPS.DB = DPSMateOverhealing end
		if DPSMate.Modules.OHealingTaken then DPSMate.Modules.OHealingTaken.DB = DPSMateOverhealingTaken end
		if DPSMate.Modules.Rezz then DPSMate.Modules.Rezz.DB = DPSMateRezz end
		if DPSMate.Modules.Activity then DPSMate.Modules.Activity.DB = DPSMateCombatTime end
		
		if DPSMateCombatTime == nil then
			DPSMateCombatTime = {
				total = 0.00001,
				current = 0.00001,
				segments = {},
				effective = {
					[1] = {},
					[2] = {}
				},
			}
		end
		
		if not DPSMateSettings["columnsrezz"] then
			DPSMateSettings["columnsrezz"] = {
				[1] = true,
				[2] = true,
			}
		end
		
		-- Settings for each window
		for num, val in pairs(DPSMateSettings["windows"]) do
			if not val["contentbordercolor"] then
				DPSMateSettings["windows"][num]["contentbordercolor"] = {0,0,0}
			end
			if not val["borderstrata"] then
				DPSMateSettings["windows"][num]["borderstrata"] = 1
			end
			if not val["bordertexture"] then
				DPSMateSettings["windows"][num]["bordertexture"] = "UI-Tooltip-Border"
			end
			if not val["borderopacity"] then
				DPSMateSettings["windows"][num]["borderopacity"] = 1
			end
		end
		
		
		DPSMate:OnLoad()
		DPSMate.Sync:OnLoad()
		DPSMate.Options:InitializeSegments()
		DPSMate.Options:InitializeHideShowWindow()
		
		player = UnitName("player")
		
		-- Adding WF Attack
		if not DPSMateAbility[DPSMate.L["wfattack"]] then
			DPSMateAbility[DPSMate.L["wfattack"]] = {
				[1] = 100,
				[4] = 25504
			}
		end
		
		local frames = {"", "_Absorbs", "_AbsorbsTaken", "_Auras", "_Casts", "_CCBreaker", "_CureDisease", "_CureDiseaseReceived", "_CurePoison", "_CurePoisonReceived", "_DamageTaken", "_DamageTakenTotal", "_DamageTotal", "_Deaths", "_Decurses", "_DecursesReceived", "_Dispels", "_DispelsReceived", "_EDD", "_EDT", "_EHealing", "_EHealingTaken", "_Fails", "_FF", "_FFT", "_Healing", "_HealingTaken", "_Interrupts", "_LiftMagic", "_LiftMagicReceived", "_OHealingTaken", "_Overhealing", "_Procs", "_AbsorbsTakenTotal", "_AbsorbsTotal", "_AurasTotal", "_CastsTotal", "_CCBreakerTotal", "_CureDisease_Total", "_CurePoison_Total", "_Deaths_Total", "_Decurses_Total", "_Dispels_Total", "_EDDTotal", "_EDTTotal", "_EHealingTakenTotal", "_EHealingTotal", "_FailsTotal", "_FFTotal", "_FFTTotal", "_HABTotal", "_HealingTakenTotal", "_HealingTotal", "_Interrupts_Total", "_LiftMagic_Total", "_OverhealingTakenTotal", "_OverhealingTotal", "_ProcsTotal"}
		for cat, val in pairs(frames) do
			if _G("DPSMate_Details"..val) then
				_G("DPSMate_Details"..val):SetToplevel(true)
			end
		end

		-- Fixing an Log Bug
		if not DPSMateUser["LASTRESETDPSMATE"] or DPSMateUser["LASTRESETDPSMATE"][2]<DPSMate.VERSION then
			DPSMateUser = {}
			DPSMateAbility = {}
			DPSMateUser["LASTRESETDPSMATE"] = {
				[1] = 1,
				[2] = DPSMate.VERSION
			}
			DPSMate.Options:PopUpAccept(true, true)
		end

		this.userlen = DPSMate:TableLength(DPSMateUser)+100
		this.abilitylen = DPSMate:TableLength(DPSMateAbility)+100

		DPSMate.Parser:GetPlayerValues()
		this:OnGroupUpdate()
		DPSMate:SetStatusBarValue()
		this.NeedUpdate = true
		
		DPSMate.Sync:RegisterEvent("CHAT_MSG_ADDON")
		DPSMate.Options:RegisterEvent("PLAYER_ENTERING_WORLD")
		DPSMate.Options:RegisterEvent("RAID_ROSTER_UPDATE")
		DPSMate.Options:RegisterEvent("PARTY_MEMBERS_CHANGED")

		DPSMate.Options:SetScript("OnEvent", function() this[event]() end)
		DPSMate.Options:SetScript("OnUpdate", function() this:OnUpdate() end)

		DPSMate:SendMessage("DPSMate build "..DPSMate.VERSION.." has been loaded!")
		this.loaded = true
		DPSMate.Options.PLAYER_ENTERING_WORLD()
	end
end

DPSMate.DB.PLAYER_REGEN_DISABLED = function()
	if DPSMateSettings["hideincombat"] then
		for _, val in pairs(DPSMateSettings["windows"]) do
			if not val then break end
			_G("DPSMate_"..val["name"]):Hide()
		end
		if DPSMateSettings["disablewhilehidden"] then
			DPSMate:Disable()
		end
	end
	DPSMate.Options:HideWhenSolo()
	if (not CombatState and cheatCombat<GetTime()) then
		DPSMate.Options:NewSegment()
	end
	CombatState = true
end

DPSMate.DB.PLAYER_REGEN_ENABLED = function()
	if DPSMateSettings["hideincombat"] then
		for _, val in pairs(DPSMateSettings["windows"]) do
			if not val then break end
			if not val["hidden"] then
				_G("DPSMate_"..val["name"]):Show()
			end
		end
		DPSMate:Enable()
	end
	DPSMate.Options:HideWhenSolo()
end

DPSMate.DB.PLAYER_AURAS_CHANGED = function()
	local buff
	for i=1, 50 do
		buff = UnitBuff("player", i)
		if (not buff) then break end
		if (buff == DPSMate.L["vanish"] or buff == DPSMate.L["feigndeath"]) and cheatCombat<GetTime() then
			cheatCombat = GetTime() + 10
			return true
		end
	end
end

DPSMate.DB.PLAYER_TARGET_CHANGED = function()
	if UnitIsPlayer("target") then
		local name = UnitName("target")
		local a, class = UnitClass("target")
		local fac = UnitFactionGroup("target") or ""
		local level = UL("target")
		if DPSMateUser[name] then
			DPSMateUser[name][2] = strlower(class)
		else
			self:BuildUser(name, strlower(class))
		end
		if fac == DPSMate.L["alliance"] then
			DPSMateUser[name][3] = 1
		elseif fac == DPSMate.L["horde"] then
			DPSMateUser[name][3] = -1
		end
		if level and level>0 then
			DPSMateUser[name][8] = level
		end
		if DPSMateUser[name][4] then
			DPSMateUser[name][4] = false
			DPSMateUser[name][5] = ""
		end
	end
end

DPSMate.DB.PLAYER_PET_CHANGED = function()
	this:OnGroupUpdate()
end

DPSMate.DB.PET_STABLE_CLOSED = function()
	this:OnGroupUpdate()
end

DPSMate.DB.ZONE_CHANGED_NEW_AREA = function()
	this:OnGroupUpdate()
end

function DPSMate.DB:OnGroupUpdate()
	local type = "raid"
	local num = GetNumRaidMembers()
	DPSMate.Parser.TargetParty = {}
	if num<=0 then
		type = "party"
		num = GetNumPartyMembers()
	end
	for i=1, num do
		if UnitIsConnected(type..i) then
			local name = UnitName(type..i)
			if name then
				local pet = UnitName(type.."pet"..i)
				local _,classEng = UnitClass(type..i)
				local fac = UnitFactionGroup(type..i)
				local gname, _, _ = GetGuildInfo(type..i)
				local level = UL(type..i)
				self:BuildUser(name, strlower(classEng or ""))
				self:BuildUser(pet)
				if classEng then
					DPSMateUser[name][2] = strlower(classEng)
				end
				DPSMateUser[name][4] = false
				if pet and pet ~= DPSMate.L["unknown"] then
					DPSMateUser[pet][4] = true
					DPSMateUser[name][5] = pet
					DPSMateUser[pet][6] = DPSMateUser[name][1]
				end
				if DPSMate.Parser.TargetParty[pet] then
					DPSMateUser[pet][4] = false
					DPSMateUser[pet][6] = ""
					DPSMateUser[name][5] = ""
				end
				if DPSMateUser[name][4] then
					DPSMateUser[name][4] = false
					DPSMateUser[name][5] = ""
				end
				if fac == DPSMate.L["alliance"] then
					DPSMateUser[name][3] = 1
				elseif fac == DPSMate.L["horde"] then
					DPSMateUser[name][3] = -1
				end
				DPSMate.Parser.TargetParty[name] = type..i
				if (gname and gname ~= "") then
					DPSMateUser[name][7] = gname
				end
				if level and level>0 then
					DPSMateUser[name][8] = level
				end
				if type=="party" then
					DPSMate.Parser.SubGroups[name] = 9
				else
					local _,_,sg = GetRaidRosterInfo(i)
					DPSMate.Parser.SubGroups[name] = sg
				end
			end
		end
	end
	local pet = UnitName("pet")
	local name = UnitName("player")
	if pet and pet ~= DPSMate.L["unknown"] then
		self:BuildUser(pet, nil)
		DPSMateUser[pet][4] = true
		DPSMateUser[name][5] = pet
		DPSMateUser[pet][6] = self:BuildUser(name)
	end
	DPSMate.Parser.TargetParty[name] = "player"
	if num<=0 then
		DPSMate.Parser.SubGroups[name] = 9
	end
end

function DPSMate.DB:GetNumPartyMembers()
	if GetNumPartyMembers() > 0 and (not UnitInRaid("player")) then
		return GetNumPartyMembers()
	elseif UnitInRaid("player") then
		return GetNumRaidMembers()
	end
end

-- Performance
function DPSMate.DB:BuildUser(Dname, Dclass)
	if (not DPSMateUser[Dname] and Dname) then
		if not Dclass then
			local _, en = UnitClass(Dname)
			if en then
				Dclass = strlower(Dclass)
			end
		end
		self.userlen = self.userlen + 1
		DPSMateUser[Dname] = {
			[1] = self.userlen,
			[2] = Dclass or "",
			[3] = 0,
			[4] = false,
			[5] = 0,
			[6] = 0,
			[7] = "",
			[8] = 80,
			[9] = 0, -- NPCID
		}
		DPSMate.UserId = nil
		return self.userlen
	end
	return DPSMateUser[Dname][1]
end

-- Performance
function DPSMate.DB:BuildAbility(name, kind, school, sid, buffOrDebuff)
	if not DPSMateAbility[name] then
		self.abilitylen = self.abilitylen + 1
		DPSMateAbility[name] = {
			[1] = self.abilitylen,
			[2] = kind or "None",
			[3] = school or "None",
			[4] = sid or 0,
			[5] = buffOrDebuff or false,
		}
		DPSMate.AbilityId = nil
		return self.abilitylen
	end
	return DPSMateAbility[name][1]
end

function DPSMate.DB:InCombat()
	return CombatState
end

local savedValue = {
	["damage"] = 0,
	["dmgt"] = 0,
	["heal"] = 0,
	["eheal"] = 0
}

function DPSMate.DB:GetAlpha(k)
	if DPSMateSettings["windows"][k]["realtime"] then
		local p = savedValue[DPSMateSettings["windows"][k]["realtime"]] or 0
		savedValue[DPSMateSettings["windows"][k]["realtime"]] = 0
		if p > 600000 then -- That may solve the freeze issue
			p = 600000
		end
		return p
	end
end

function DPSMate.DB:HookGraphEvents()
	if not self.hooked then
		self.oldDmgDone = DPSMate.DB.DamageDone
		function DPSMate.DB:DamageDone(Duser, Dname, Dhit, Dcrit, Dmiss, Dparry, Ddodge, Dresist, Damount, Dglance, Dblock)
			self:oldDmgDone(Duser, Dname, Dhit, Dcrit, Dmiss, Dparry, Ddodge, Dresist, Damount, Dglance, Dblock)
			savedValue["damage"] = savedValue["damage"] + Damount
		end
		self.oldDmgTaken = DPSMate.DB.DamageTaken
		function DPSMate.DB:DamageTaken(Duser, Dname, Dhit, Dcrit, Dmiss, Dparry, Ddodge, Dresist, Damount, cause, Dcrush, Dblock)
			self:oldDmgTaken(Duser, Dname, Dhit, Dcrit, Dmiss, Dparry, Ddodge, Dresist, Damount, cause, Dcrush, Dblock)
			savedValue["dmgt"] = savedValue["dmgt"] + Damount
		end
		self.oldHealing = DPSMate.DB.Healing
		function DPSMate.DB:Healing(mode, arr, Duser, Dname, Dhit, Dcrit, Damount)
			self:oldHealing(mode, arr, Duser, Dname, Dhit, Dcrit, Damount)
			if mode == 0 then
				savedValue["eheal"] = savedValue["eheal"] + Damount
			elseif mode == 1 then
				savedValue["heal"] = savedValue["heal"] + Damount
			end
		end
		self.hooked = true
	end
end

function DPSMate.DB:WeightedAverage(a, b, c, d)
	return (a*c+b*d)/(c+d)
end

function DPSMate.DB:SetNpcID(name, guid)
	if name then
		if DPSMateUser[name] then
			DPSMateUser[name][9] = DPSMate:GetNPCID(guid)
		end
	end
end

function DPSMate.DB:AddSpellSchool(ab, sc, sid, bod)
	if DPSMateAbility[ab] then
		DPSMateAbility[ab][3] = sc or DPSMateAbility[ab][3]
		DPSMateAbility[ab][4] = sid or DPSMateAbility[ab][4]
		DPSMateAbility[ab][5] = bod or DPSMateAbility[ab][5]
	else
		self:BuildAbility(ab,"None",sc,sid)
	end
end

function DPSMate.DB:RegisterNextSwing(player, amount, ability)
	player = self:BuildUser(player)
	self.NextSwing[player] = {amount, ability}
	self.NextSwingEDD[player] = {amount, ability}
end	

local AAttack = DPSMate.L["AutoAttack"]
local WFAttack = DPSMate.L["wfattack"]
local Windfury = {}
local WindfuryEDT = {}
function DPSMate.DB:IsWindFuryAttack(arr, Dname, Duser, bool)
	local time = GetTime()
	for c,v in pairs(arr) do
		if v then
			if (time-c)<=0.0005 then
				if bool then
					self:BuildBuffs(Duser, Duser, WFAttack, true)
					self:DestroyBuffs(Duser, WFAttack)
				end
				return WFAttack
			else
				arr[c] = false
			end
		end
	end
	arr[time] = true
	return AAttack
end

function DPSMate.DB:DamageDone(Duser, Dname, Dhit, Dcrit, Dmiss, Dparry, Ddodge, Dresist, Damount, Dglance, Dblock)
	Duser = self:BuildUser(Duser)

	if (not CombatState and cheatCombat<GetTime()) then
		DPSMate.Options:NewSegment()
		CombatState = true
	end
	
	-- Part to take extra swings as abilities into account
	if Dname == AAttack then
		if self.NextSwing[Duser] and self.NextSwing[Duser][1]>0 then
			Dname = self.NextSwing[Duser][2]
			self.NextSwing[Duser][1] = self.NextSwing[Duser][1] - 1
		end
	end

	Dname = self:BuildAbility(Dname)
	
	for cat, val in pairs(tablemodes) do 
		if (not DPSMateDamageDone[cat][Duser]) then
			DPSMateDamageDone[cat][Duser] = {
				i = 0,
			}
		end
		gen = DPSMateDamageDone[cat][Duser]
		if not gen[Dname] then
			gen[Dname] = {
				[1] = 0, -- hit
				[2] = 0, -- hitlow
				[3] = 0, -- hithigh
				[4] = 0, -- hitaverage
				[5] = 0, -- crit
				[6] = 0, -- critlow
				[7] = 0, -- crithigh
				[8] = 0, -- critaverage
				[9] = 0, -- miss
				[10] = 0, -- parry
				[11] = 0, -- dodge
				[12] = 0, -- resist 
				[13] = 0, -- amount
				[14] = 0,
				[15] = 0,
				[16] = 0,
				[17] = 0,
				[18] = 0,
				[19] = 0,
				[20] = 0,
				[21] = 0,
				[22] = 0, -- Casts
				["i"] = {}
			}
		end
		path = gen[Dname]
		if Damount > 0 then 
			path[13] = path[13] + Damount
			if Dhit == 1 then
				if (Damount < path[2] or path[2] == 0) then path[2] = Damount end
				if Damount > path[3] then path[3] = Damount end
				path[4] = (path[4]*path[1]+Damount)/(path[1]+1)
				path[1] = path[1] + 1
			elseif Dcrit == 1 then
				if (Damount < path[6] or path[6] == 0) then path[6] = Damount end
				if Damount > path[7] then path[7] = Damount end
				path[8] = (path[8]*path[5]+Damount)/(path[5]+1)
				path[5] = path[5] + 1
			elseif Dglance == 1 then
				if (Damount < path[15] or path[15] == 0) then path[15] = Damount end
				if Damount > path[16] then path[16] = Damount end
				path[17] = (path[17]*path[14]+Damount)/(path[14]+1)
				path[14] = path[14] + 1
			else
				if (Damount < path[19] or path[19] == 0) then path[19] = Damount end
				if Damount > path[20] then path[20] = Damount end
				path[21] = (path[21]*path[18]+Damount)/(path[18]+1)
				path[18] = path[18] + 1
			end
			gen["i"] = gen["i"] + Damount
			time = floor(DPSMateCombatTime[val])
			path["i"][time] = (path["i"][time] or 0) + Damount
		else
			path[9] = path[9] + Dmiss
			path[10] = path[10] + Dparry
			path[11] = path[11] + Ddodge
			path[12] = path[12] + Dresist
			path[18] = path[18] + Dblock
		end
	end
	self.NeedUpdate = true
end

function DPSMate.DB:DamageTaken(Duser, Dname, Dhit, Dcrit, Dmiss, Dparry, Ddodge, Dresist, Damount, cause, Dcrush, Dblock)
	if not DPSMateSettings["legacylogs"] and not DPSMate.RegistredModules["damagetaken"] then return end
	Duser = self:BuildUser(Duser)
	cause = self:BuildUser(cause)
	Dname = self:BuildAbility(Dname)

	for cat, val in pairs(tablemodes) do 
		if not DPSMateDamageTaken[cat][Duser] then
			DPSMateDamageTaken[cat][Duser] = {
				i = 0,
			}
		end
		gen = DPSMateDamageTaken[cat][Duser]
		if not gen[cause] then
			gen[cause] = {}
		end
		if not gen[cause][Dname] then
			gen[cause][Dname] = {
				[1] = 0, -- hit
				[2] = 0, -- hitlow
				[3] = 0, -- hithigh
				[4] = 0, -- hitaverage
				[5] = 0, -- crit
				[6] = 0, -- critlow
				[7] = 0, -- crithigh
				[8] = 0, -- critaverage
				[9] = 0, -- miss
				[10] = 0, -- parry
				[11] = 0, -- dodge
				[12] = 0, -- resist
				[13] = 0, -- amount
				[14] = 0, -- average
				[15] = 0,
				[16] = 0,
				[17] = 0,
				[18] = 0,
				[19] = 0,
				[20] = 0,
				[21] = 0,
				[22] = 0,
				[23] = 0,
				["i"] = {}
			}
		end
		path = gen[cause][Dname]
		if Damount > 0 then 
			path[13] = path[13] + Damount
			if Dhit == 1 then
				if (Damount < path[2] or path[2] == 0) then path[2] = Damount end
				if Damount > path[3] then path[3] = Damount end
				path[4] = (path[4]*path[1]+Damount)/(path[1]+1)
				path[1] = path[1] + 1
			elseif Dcrit == 1 then
				if (Damount < path[6] or path[6] == 0) then path[6] = Damount end
				if Damount > path[7] then path[7] = Damount end
				path[8] = (path[8]*path[5]+Damount)/(path[5]+1)
				path[5] = path[5] + 1
			elseif Dcrush == 1 then
				if (Damount < path[16] or path[16] == 0) then path[16] = Damount end
				if Damount > path[17] then path[17] = Damount end
				path[18] = (path[18]*path[15]+Damount)/(path[15]+1)
				path[15] = path[15] + 1
			else
				if (Damount < path[21] or path[21] == 0) then path[21] = Damount end
				if Damount > path[22] then path[22] = Damount end
				path[23] = (path[23]*path[20]+Damount)/(path[20]+1)
				path[20] = path[20] + 1
			end
			gen["i"] = gen["i"] + Damount
			path[14] = (path[14] + Damount)/2
			time = floor(DPSMateCombatTime[val])
			path["i"][time] = (path["i"][time] or 0) + Damount
		else
			path[9] = path[9] + Dmiss
			path[20] = path[20] + Dblock
			path[10] = path[10] + Dparry
			path[11] = path[11] + Ddodge
			path[12] = path[12] + Dresist
		end
	end
	self.NeedUpdate = true
end

local ActiveMob = {}
function DPSMate.DB:EnemyDamage(mode, arr, Duser, Dname, Dhit, Dcrit, Dmiss, Dparry, Ddodge, Dresist, Damount, cause, Dblock, Dcrush)
	ActiveMob[cause] = true
	Duser = self:BuildUser(Duser)
	cause = self:BuildUser(cause)
	
	if not mode then
		if not DPSMateSettings["legacylogs"] and not DPSMate.RegistredModules["enemydamagedone"] then
			return
		end
	else
		-- Part to take extra swings as abilities into account
		if Dname == AAttack then
			if self.NextSwingEDD[Duser] and self.NextSwingEDD[Duser][1]>0 then
				Dname = self.NextSwingEDD[Duser][2]
				self.NextSwingEDD[Duser][1] = self.NextSwingEDD[Duser][1] - 1
			else
				Dname = self:IsWindFuryAttack(WindfuryEDT, Dname, Duser)
			end
		end
	end

	Dname = self:BuildAbility(Dname)
	
	for cat, val in pairs(tablemodes) do 
		if not arr[cat][cause] then
			arr[cat][cause] = {}
		end
		gen = arr[cat][cause]
		if not gen[Duser] then
			gen[Duser] = {
				i = 0,
			}
		end
		if not gen[Duser][Dname] then
			gen[Duser][Dname] = {
				[1] = 0, -- hit
				[2] = 0, -- hitlow
				[3] = 0, -- hithigh
				[4] = 0, -- hitaverage
				[5] = 0, -- crit
				[6] = 0, -- critlow
				[7] = 0, -- crithigh
				[8] = 0, -- critaverage
				[9] = 0, -- miss
				[10] = 0, -- parry
				[11] = 0, -- dodge
				[12] = 0, -- resist
				[13] = 0, -- amount
				[14] = 0,
				[15] = 0,
				[16] = 0,
				[17] = 0,
				[18] = 0,
				[19] = 0,
				[20] = 0,
				[21] = 0,
				[22] = 0,
				["i"] = {}
			}
		end
		path = gen[Duser][Dname]
		if Damount > 0 then
			path[13] = path[13] + Damount
			if Dhit == 1 then
				if (Damount < path[2] or path[2] == 0) then path[2] = Damount end
				if Damount > path[3] then path[3] = Damount end
				path[4] = (path[4]*path[1]+Damount)/(path[1]+1)
				path[1] = path[1] + 1
			elseif Dcrit == 1 then
				if (Damount < path[6] or path[6] == 0) then path[6] = Damount end
				if Damount > path[7] then path[7] = Damount end
				path[8] = (path[8]*path[5]+Damount)/(path[5]+1)
				path[5] = path[5] + 1
			elseif Dcrush == 1 then
				if (Damount < path[19] or path[19] == 0) then path[19] = Damount end
				if Damount > path[20] then path[20] = Damount end
				path[21] = (path[21]*path[18]+Damount)/(path[18]+1)
				path[18] = path[18] + 1
			else
				if (Damount < path[15] or path[15] == 0) then path[15] = Damount end
				if Damount > path[16] then path[16] = Damount end
				path[17] = (path[17]*path[14]+Damount)/(path[14]+1)
				path[14] = path[14] + 1
			end
			gen[Duser]["i"] = gen[Duser]["i"] + Damount
			time = floor(DPSMateCombatTime[val])
			path["i"][time] = (path["i"][time] or 0) + Damount
		else
			path[9] = path[9] + Dmiss
			path[10] = path[10] + Dparry
			path[11] = path[11] + Ddodge
			path[12] = path[12] + Dresist
			path[14] = path[14] + Dblock
		end
	end
	self.NeedUpdate = true
end

function DPSMate.DB:Healing(mode, arr, Duser, Dname, Dhit, Dcrit, Damount)
	if not DPSMateSettings["legacylogs"] and ((mode==0 and not DPSMate.RegistredModules["effectivehealing"] and not DPSMate.RegistredModules["healingandabsorbs"]) or (mode==1 and not DPSMate.RegistredModules["healing"]) or (mode==2 and not DPSMate.RegistredModules["overhealing"])) then return end
	Duser = self:BuildUser(Duser)
	Dname = self:BuildAbility(Dname)
	
	for cat, val in pairs(tablemodes) do 
		if not arr[cat][Duser] then
			arr[cat][Duser] = {
				i = 0,
			}
		end
		gen = arr[cat][Duser]
		if not gen[Dname] then
			gen[Dname] = {
				[1] = 0, -- Healing done
				[2] = 0, -- Hit
				[3] = 0, -- Crit
				[4] = 0, -- hitav
				[5] = 0, -- critav
				[6] = 0, -- hitMin
				[7] = 0, -- hitMax
				[8] = 0, -- critMin
				[9] = 0, -- critMax
				["i"] = {}
			}
		end
		path = gen[Dname]
		if Damount > 0 then 
			path[1] = path[1]+Damount
			gen["i"] = gen["i"]+Damount
			if Dhit==1 then 
				path[4] = (path[4]*path[2]+Damount)/(path[2]+1)
				if Damount<path[6] or path[6]==0 then
					path[6] = Damount; 
				end
				if Damount>path[7] or path[7]==0 then
					path[7] = Damount 
				end
				path[2] = path[2]+1
			else
				path[5] = (path[5]*path[3]+Damount)/(path[3]+1)
				if Damount<path[8] or path[8]==0 then
					path[8] = Damount; 
				end
				if Damount>path[9] or path[9]==0 then
					path[9] = Damount 
				end
				path[3] = path[3]+1
			end
			time = floor(DPSMateCombatTime[val])
			path["i"][time] = (path["i"][time] or 0) + Damount
		end
	end
	self.NeedUpdate = true
end

function DPSMate.DB:HealingTaken(mode, arr, Duser, Dname, Dhit, Dcrit, Damount, target)
	if not DPSMateSettings["legacylogs"] and ((mode==0 and not DPSMate.RegistredModules["healingtaken"] and not DPSMate.RegistredModules["healing"]) or (mode==1 and not DPSMate.RegistredModules["effectivehealingtaken"] and not DPSMate.RegistredModules["effectivehealing"] and not DPSMate.RegistredModules["healingandabsorbs"]) or (mode==2 and not DPSMate.RegistredModules["OHealingTaken"] and not DPSMate.RegistredModules["overhealing"])) then return end
	Duser = self:BuildUser(Duser)
	target = self:BuildUser(target)
	Dname = self:BuildAbility(Dname)
	for cat, val in pairs(tablemodes) do 
		if not arr[cat][Duser] then
			arr[cat][Duser] = {
				i = 0,
			}
		end
		gen = arr[cat][Duser]
		if not gen[target] then
			gen[target] = {}
		end
		if not gen[target][Dname] then
			gen[target][Dname] = {
				[1] = 0, -- Healing done
				[2] = 0, -- Hit
				[3] = 0, -- Crit
				[4] = 0, -- hitav
				[5] = 0, -- critav
				[6] = 0, -- hitMin
				[7] = 0, -- hitMax
				[8] = 0, -- critMin
				[9] = 0, -- critMax
				["i"] = {}
			}
		end
		path = gen[target][Dname]
		if Damount > 0 then 
			path[1] = path[1]+Damount
			if Dhit==1 then
				path[4] = (path[4]*path[2]+Damount)/(path[2]+1)
				if Damount<path[6] or path[6]==0 then
					path[6] = Damount; 
				end
				if Damount>path[7] or path[7]==0 then
					path[7] = Damount 
				end
				path[2] = path[2]+1
			else
				path[5] = (path[5]*path[3]+Damount)/(path[3]+1)
				if Damount<path[8] or path[8]==0 then
					path[8] = Damount; 
				end
				if Damount>path[9] or path[9]==0 then
					path[9] = Damount 
				end
				path[3] = path[3]+1
			end
			gen["i"] = gen["i"]+Damount
			time = floor(DPSMateCombatTime[val])
			path["i"][time] = (path["i"][time] or 0) + Damount
		end
	end
	self.NeedUpdate = true
end

function DPSMate.DB:RegisterAbsorb(owner, ability, abilityTarget)
	if not DPSMateSettings["legacylogs"] and not DPSMate.RegistredModules["absorbs"] and not DPSMate.RegistredModules["absorbstaken"] and not DPSMate.RegistredModules["healingandabsorbs"] then return end
	owner = self:BuildUser(owner)
	abilityTarget = self:BuildUser(abilityTarget)
	ability = self:BuildAbility(ability)
	for cat, val in pairs(tablemodes) do 
		if not DPSMateAbsorbs[cat][abilityTarget] then
			DPSMateAbsorbs[cat][abilityTarget] = {}
		end
		if not DPSMateAbsorbs[cat][abilityTarget][owner] then
			DPSMateAbsorbs[cat][abilityTarget][owner] = {
				i = {},
			}
		end
		if not DPSMateAbsorbs[cat][abilityTarget][owner][ability] then
			DPSMateAbsorbs[cat][abilityTarget][owner][ability] = {}
		end
		tinsert(DPSMateAbsorbs[cat][abilityTarget][owner][ability], {
			i = {
				[1] = 0,
				[2] = 0,
				[3] = 0,
				[4] = 0,
			},
		})
	end
	self.NeedUpdate = true
end

local broken = {}
function DPSMate.DB:SetUnregisterVariables(broAbsorb, ab, c)
	if broAbsorb then
		ab = self:BuildAbility(ab)
		c = self:BuildUser(c)
		broken = {1, broAbsorb, ab, c}
	end
end

function DPSMate.DB:UnregisterAbsorb(ability, abilityTarget)
	if not DPSMateSettings["legacylogs"] and not DPSMate.RegistredModules["absorbs"] and not DPSMate.RegistredModules["absorbstaken"] then return end
	ability = self:BuildAbility(ability)
	abilityTarget = self:BuildUser(abilityTarget)
	local AbsorbingAbility
	for cat, val in pairs(tablemodes) do 
		AbsorbingAbility = self:GetActiveAbsorbAbilityByPlayer(ability, abilityTarget, cat)
		if AbsorbingAbility[1] then
			path = DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]][AbsorbingAbility[2]][AbsorbingAbility[3]]["i"]
			if path[1] == 0 then
				path[1] = broken[1]
				path[2] = broken[2]
				path[3] = broken[3]
				path[4] = broken[4]
				if (broken[2] or 0)>0 then 
					if not DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2]] then
						DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2]] = {}
					end
					if not DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2]][broken[3]] then
						DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2]][broken[3]] = {}
					end
					if DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2]][broken[3]][DPSMateCombatTime[val]] then
						DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2]][broken[3]][DPSMateCombatTime[val]] = DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2]][broken[3]][DPSMateCombatTime[val]] + broken[2];
					else
						DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2]][broken[3]][DPSMateCombatTime[val]] = broken[2]
					end
				end
			end
		end
	end
	broken = {2,0,0,0}
	self.NeedUpdate = true
end

function DPSMate.DB:GetActiveAbsorbAbilityByPlayer(ability, abilityTarget, cate)
	if self:BuildAbility(ability, nil) or self:BuildUser(abilityTarget, nil) then return end
	local ActiveShield = {}
	if DPSMateAbsorbs[cate][abilityTarget] then
		for cat, val in pairs(DPSMateAbsorbs[cate][abilityTarget]) do
			for ca, va in pairs(val) do
				if ca~="i" then
					for c, v in pairs(va) do
						for ce, ve in pairs(v) do
							if ve[1]==0 and ca==ability then
								ActiveShield = {cat, ca, c}
								break
							end
						end
					end
				end
			end
		end
	end
	return ActiveShield
end

function DPSMate.DB:GetAbsorbingShield(ability, abilityTarget, cate)
	-- Checking for active Shields
	local AbsorbingAbility = {}	
	local activeShields = {}
	if DPSMateAbsorbs[cate][DPSMateUser[abilityTarget][1]] then
		for cat, val in pairs(DPSMateAbsorbs[cate][DPSMateUser[abilityTarget][1]]) do
			for ca, va in pairs(val) do
				if ca~="i" then
					for c, v in pairs(va) do
						for ce, ve in pairs(v) do
							if ve[1]==0 then
								activeShields[cat] = {ca,c}
								break
							end
						end
					end
				end
			end
		end

		local AAS, ASS = {}, {}
		for cat, val in pairs(activeShields) do
			if self.ShieldFlags[DPSMateAbility[DPSMate:GetAbilityById(val[1])][4]]==0 then
				AAS[cat] = {val[1],val[2]}
			elseif self.ShieldFlags[DPSMateAbility[DPSMate:GetAbilityById(val[1])][4]]==AbilityFlags[DPSMateAbility[ability][3]] then
				ASS[cat] = {val[1],val[2]}
			elseif not DPSMateAbility[ability][3] or not AbilityFlags[DPSMateAbility[ability][3]] then
				ASS[cat] = {val[1],val[2]}
			end
		end
		
		-- Checking buffs for order
		if AAS~={} or ASS~={} then
			local unit = DPSMate.Parser:GetUnitByName(abilityTarget)
			if unit then
				local buff
				for i=1, 32 do
					buff = UnitBuff(unit, i)
					if (not buff) then break end
					buff = self:BuildAbility(buff)
					for cat, val in pairs(AAS) do
						if val[1]==buff then
							AbsorbingAbility = {cat, {val[1],val[2]}}
							break
						end
					end
					for cat, val in pairs(ASS) do
						if val[1]==buff then
							AbsorbingAbility = {cat, {val[1],val[2]}}
							break
						end
					end
				end
			else
				if AAS then
					for cat, val in pairs(AAS) do
						return {cat, {val[1],val[2]}}
					end
				else
					for cat, val in pairs(ASS) do
						return {cat, {val[1],val[2]}}
					end
				end
			end
		end
	end
	return AbsorbingAbility
end

function DPSMate.DB:Absorb(ability, abilityTarget, incTarget, amount)
	if not DPSMateSettings["legacylogs"] and not DPSMate.RegistredModules["absorbs"] and not DPSMate.RegistredModules["absorbstaken"] then return end
	incTarget = self:BuildUser(incTarget)
	abilityTarget = self:BuildUser(abilityTarget)
	ability = self:BuildAbility(ability)
	local AbsorbingAbility
	for cat, val in pairs(tablemodes) do 
		AbsorbingAbility = self:GetAbsorbingShield(DPSMate:GetAbilityById(ability), DPSMate:GetUserById(abilityTarget), cat)
		if AbsorbingAbility[1] then
			if not DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]][AbsorbingAbility[2][1]][AbsorbingAbility[2][2]][incTarget] then
				DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]][AbsorbingAbility[2][1]][AbsorbingAbility[2][2]][incTarget] = {}
			end
			local path = DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]][AbsorbingAbility[2][1]][AbsorbingAbility[2][2]][incTarget]
			if path[ability] then
				path[ability][1] = path[ability][1] + 1
				path[ability][2] = path[ability][2] + amount
				if amount > path[ability][4] then
					path[ability][4] = amount 
				end
				if amount<path[ability][3] then
					path[ability][2] = amount
				end
			else
				path[ability] = {[1]=1,[2]=amount,[3]=amount,[4]=amount}
			end
			if not DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2][1]] then
				DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2][1]] = {}
			end
			if not DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2][1]][ability] then
				DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2][1]][ability] = {}
			end
			if DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2][1]][ability][DPSMateCombatTime[val]] then
				DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2][1]][ability][DPSMateCombatTime[val]] = DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2][1]][ability][DPSMateCombatTime[val]] + amount;
			else
				DPSMateAbsorbs[cat][abilityTarget][AbsorbingAbility[1]]["i"][AbsorbingAbility[2][1]][ability][DPSMateCombatTime[val]] = amount
			end
		end
	end
	self.NeedUpdate = true
end

function DPSMate.DB:Dispels(cause, Dname, target, ability)
	if not DPSMateSettings["legacylogs"] and not DPSMate.RegistredModules["decurses"] and not DPSMate.RegistredModules["curepoison"] and not DPSMate.RegistredModules["liftmagic"] and not DPSMate.RegistredModules["curedisease"] and not DPSMate.RegistredModules["dispels"] then return end
	cause = self:BuildUser(cause)
	target = self:BuildUser(target)
	Dname = self:BuildAbility(Dname)
	ability = self:BuildAbility(ability)
	for cat, val in pairs(tablemodes) do 
		if not DPSMateDispels[cat][cause] then
			DPSMateDispels[cat][cause] = {
				i = {
					[1] = 0,
					[2] = {}
				},
			}
		end
		gen = DPSMateDispels[cat][cause]
		if not gen[Dname] then
			gen[Dname] = {}
		end
		if not gen[Dname][target] then 
			gen[Dname][target] = {}
		end
		path = gen[Dname][target]
		if not path[ability] then
			path[ability] = 0
		end
		path[ability] = path[ability]+1
		gen["i"][1] = gen["i"][1]+1
		tinsert(gen["i"][2], {DPSMateCombatTime[val], ability, target, GetRealTime()})
	end
	self.NeedUpdate = true
end

function DPSMate.DB:UnregisterDeath(target)
	if not DPSMateSettings["legacylogs"] and not DPSMate.RegistredModules["deaths"] then return end
	target = self:BuildUser(target)
	for cat, val in pairs(tablemodes) do 
		if DPSMateDeaths[cat][target] then
			DPSMateDeaths[cat][target][1]["i"][1]=1
			DPSMateDeaths[cat][target][1]["i"][2]=GetRealTime()
			if cat==1 and DPSMate.Parser.TargetParty[DPSMate:GetUserById(target)] then 
				local p = DPSMateDeaths[cat][target][1][1]
				DPSMate:Broadcast(4, target, DPSMate:GetUserById(p[1]), DPSMate:GetAbilityById(p[2]), p[3]) 
			end
		end
	end
end

function DPSMate.DB:DeathHistory(target, cause, ability, amount, hit, crit, type, crush)
	if not DPSMateSettings["legacylogs"] and not DPSMate.RegistredModules["deaths"] then return end
	target = self:BuildUser(target)
	cause = self:BuildUser(cause)
	ability = self:BuildAbility(ability)
	local hitCritCrush
	for cat, val in pairs(tablemodes) do 
		if not DPSMateDeaths[cat][target] then
			DPSMateDeaths[cat][target] = {}
		end
		if not DPSMateDeaths[cat][target][1] then
			DPSMateDeaths[cat][target][1] = {
				i = {
					[1] = 0,
					[2] = "",
				},
			}
		end
		if DPSMateDeaths[cat][target][1]["i"][1]==1 then
			tinsert(DPSMateDeaths[cat][target], 1, {i = {0,""}})
		end
		hitCritCrush = 0
		if crit==1 then hitCritCrush = 1 elseif crush==1 then hitCritCrush = 2 end
		tinsert(DPSMateDeaths[cat][target][1], 1, {
			[1] = cause,
			[2] = ability,
			[3] = amount,
			[4] = hitCritCrush,
			[5] = type,
			[6] = DPSMateCombatTime[val],
			[7] = GetRealTime(),
		})
		if DPSMateDeaths[cat][target][1][21] then
			tremove(DPSMateDeaths[cat][target][1], 21)
		end
	end
end

local AwaitKick = {}
local AfflictedStun = {}
function DPSMate.DB:AwaitAfflicted(cause, ability, target, time)
	for cat, val in pairs(AfflictedStun) do
		if val[1]==cause and ((val[4]+0.5)<=time or (val[4]-0.5)>=time) then
			return
		end
	end
	tinsert(AfflictedStun, {cause,ability,target,time})
end

function DPSMate.DB:ConfirmAfflicted(target, ability, time)
	for cat, val in pairs(AfflictedStun) do	
		if val[2]==ability and val[3]==target and val[4]<=time then
			if DPSMate.Parser.Kicks[ability] then self:AssignPotentialKick(val[1], val[2], val[3], time) end
			self:EnemyDamage(true, DPSMateEDT, val[1], ability, 1, 0, 0,0,0, 0,0, target, 0, 0)
			tremove(AfflictedStun, cat)
			return 
		end
	end
end

function DPSMate.DB:RegisterPotentialKick(cause, ability, time)
	tinsert(AwaitKick, {cause, ability, time})
end

function DPSMate.DB:UnregisterPotentialKick(cause, ability, time)
	for cat, val in pairs(AwaitKick) do
		if val[1]==cause and val[2]==ability and val[3]<=time then
			tremove(AwaitKick, cat)
			break
		end
	end
end

function DPSMate.DB:AssignPotentialKick(cause, ability, target, time)
	for cat, val in pairs(AwaitKick) do
		if val[3]<=time then
			if not val[4] and val[1]==target then
				val[4] = {cause, ability}
			end
		end
	end
end

function DPSMate.DB:UpdateKicks()
	time = GetTime()
	for cat, val in pairs(AwaitKick) do
		if (time-val[3])>=2.5 then
			if val[4] then
				self:Kick(val[4][1], val[1], val[4][2], val[2])
			end
			tremove(AwaitKick, cat)
			break
		end
	end
end

function DPSMate.DB:Kick(cause, target, causeAbility, targetAbility)
	if not DPSMateSettings["legacylogs"] and not DPSMate.RegistredModules["interrupts"] then return end
	target = self:BuildUser(target)
	cause = self:BuildUser(cause)
	causeAbility = self:BuildAbility(causeAbility)
	targetAbility = self:BuildAbility(targetAbility)
	for cat, val in pairs(tablemodes) do 
		if not DPSMateInterrupts[cat][cause] then
			DPSMateInterrupts[cat][cause] = {
				i = {
					[1] = 0,
					[2] = {}
				},
			}
		end
		gen = DPSMateInterrupts[cat][cause]
		if not gen[causeAbility] then
			gen[causeAbility] = {}
		end
		if not gen[causeAbility][target] then
			gen[causeAbility][target] = {}
		end
		path = gen[causeAbility][target]
		if not path[targetAbility] then
			path[targetAbility] = 0
		end
		gen["i"][1] = gen["i"][1] + 1
		tinsert(gen["i"][2], {DPSMateCombatTime[val], GetRealTime(), targetAbility, target})
		path[targetAbility]=path[targetAbility]+1
	end
end

function DPSMate.DB:BuildBuffs(cause, target, ability, bool)
	if not DPSMateSettings["legacylogs"] and not DPSMate.RegistredModules["aurasgained"] then return end
	target = self:BuildUser(target)
	cause = self:BuildUser(cause)
	ability = self:BuildAbility(ability)
	for cat, val in pairs(tablemodes) do 
		if not DPSMateAurasGained[cat][target] then
			DPSMateAurasGained[cat][target] = {}
		end
		gen = DPSMateAurasGained[cat][target]
		if not gen[ability] then
			gen[ability] = {
				[1] = {},
				[2] = {},
				[3] = {},
				[4] = bool,
				[5] = 0,
				[6] = 0,
			}
		end
		path = gen[ability]
		if not path[3][cause] then
			path[3][cause] = 0
		end
		for i=1, (path[5]-path[6]) do
			tinsert(path[2], path[1][path[6]+1])
			path[6] = path[6] + 1
		end
		tinsert(path[1], DPSMateCombatTime[val])
		path[5] = path[5] + 1
		path[3][cause] = path[3][cause] + 1
	end
	self.NeedUpdate = true
end

function DPSMate.DB:DestroyBuffs(target, ability)
	if not DPSMateSettings["legacylogs"] and not DPSMate.RegistredModules["aurasgained"] then return end
	target = self:BuildUser(target)
	ability = self:BuildAbility(ability)
	local TL
	for cat, val in pairs(tablemodes) do 
		if not DPSMateAurasGained[cat][target] then
			DPSMateAurasGained[cat][target] = {}
		end
		gen = DPSMateAurasGained[cat][target]
		if not gen[ability] then
			gen[ability] = {
				[1] = {},
				[2] = {},
				[3] = {},
				[4] = bool,
				[5] = 0,
				[6] = 0,
			}
		end
		path = gen[ability]
		TL = path[6]+1
		if not path[1][TL] then
			path[1][TL] = DPSMateCombatTime[val]
			path[5] = path[5] + 1
		end
		tinsert(path[2], DPSMateCombatTime[val])
		path[6] = path[6] + 1
	end
	self.NeedUpdate = true
end

function DPSMate.DB:GetOptionsTrue(i,k)
	for cat,val in pairs(DPSMateSettings["windows"][k]["options"][i]) do
		if val then
			return cat
		end
	end
end

function DPSMate.DB:UnitIsSaved(unit)
	for i=1, 50 do
		local buff = UnitBuff(unit, i)
		if (not buff) then break end
		if (strfind(buff, DPSMate.L["vanish"]) or strfind(buff, DPSMate.L["feigndeath"])) or strfind(buff, DPSMate.L["divineintervention"]) or strfind(buff, DPSMate.L["stealth"]) then
			return true
		end
	end
	return false
end

function DPSMate.DB:IsWipe()
	local am = 0
	for i=1, GetNumRaidMembers() do
		if not UnitIsDead("raid"..i) then
			-- People who are saved with pala bubble or feight death or vanish
			if not DPSMate.DB:UnitIsSaved("raid"..i) then
				am = am + 1
			end
		end
	end
	if am > 3 then
		return false
	else
		return true
	end
end
function DPSMate.DB:UpdatePlayerCBT(cbt, cbt1, cbt2)
	local notInCombat = true
	local type = "raid"
	local num = GetNumRaidMembers()
	if num<=0 then
		type = "party"
		num = GetNumPartyMembers()
		if UnitAffectingCombat("player") then
			cbt1[player] = (cbt1[player] or 0) + cbt
			cbt2[player] = (cbt2[player] or 0) + cbt
			notInCombat = false
		end
	end
	local name
	for i=1, num do
		if UnitAffectingCombat(type..i) then
			name = UnitName(type..i)
			cbt1[name] = (cbt1[name] or 0) + cbt
			cbt2[name] = (cbt2[name] or 0) + cbt
			notInCombat = false
		end
	end
	return notInCombat
end

local cbt1, cbt2, notInCombat
function DPSMate.DB:OnUpdate()
	if (CombatState) then
		notInCombat = false
		LastUpdate = LastUpdate + arg1
		if LastUpdate>=UpdateTime then
			DPSMateCombatTime["total"] = DPSMateCombatTime["total"] + LastUpdate
			DPSMateCombatTime["current"] = DPSMateCombatTime["current"] + LastUpdate
			cbt1, cbt2 = DPSMateCombatTime["effective"][1], DPSMateCombatTime["effective"][2]
			notInCombat = self:UpdatePlayerCBT(LastUpdate, cbt1, cbt2)
			
			-- Check NPC E CBT Time (May be inaccurate) -> Can be used as active time later
			for cat, _ in pairs(ActiveMob) do
				cbt1[cat] = (cbt1[cat] or 0) + LastUpdate
				cbt2[cat] = (cbt2[cat] or 0) + LastUpdate
			end
			ActiveMob = {}
			LastUpdate = 0
		end
		
		if notInCombat then 
			CombatState = false
			self:Attempt(true, DPSMate.DB:IsWipe(), nil)
		end
	end
	if self.NeedUpdate then
		MainLastUpdate = MainLastUpdate + arg1
		if MainLastUpdate>=MainUpdateTime then
			self:UpdateKicks()
			DPSMate:SetStatusBarValue()
			self.NeedUpdate = false
			MainLastUpdate = 0
		end
	end
end

local oldRepopMe = RepopMe
function NewRepopMe()
	if CombatState then
		DPSMate.DB:Attempt(true, true, nil)
	else
		DPSMate.DB:Attempt(true, DPSMate.DB:IsWipe(), nil)
	end
	oldRepopMe()
end
RepopMe = NewRepopMe


-- No idea how this error occours.
function DPSMate.DB:Attempt(mode, check, tar)
	local zone = GetRealZoneText()
	local difficulty = GetInstanceDifficulty()
	if self.Zones[zone] and DPSMateSettings["legacylogs"] then -- Need to find a solution for world bosses.
		zone = zone.."x"..difficulty
		if not DPSMateAttempts[zone] then DPSMateAttempts[zone] = {} end
		if mode then
			if DPSMateAttempts[zone][1] and not DPSMateAttempts[zone][1][4] then
				local max, a = 0, 0
				-- Get name of this session
				for c, v in pairs(DPSMateEDT[2]) do
					local CV = 0
					for cat, val in pairs(v) do
						if cat~="i" then
							CV = CV+val["i"]
						end
					end
					if max<CV then
						max = CV
						a = c
					end
				end
				local name = DPSMate:GetUserById(a)
				if DPSMateAttempts[zone][1][1]=="" or DPSMateAttempts[zone][1][1]==DPSMate.L["unknown"] then
					if name == "" then
						DPSMateAttempts[zone][1][1] = DPSMate.L["unknown"]
					else
						DPSMateAttempts[zone][1][1] = name or DPSMate.L["unknown"]
					end
				end
				DPSMateAttempts[zone][1][4] = DPSMateCombatTime["total"]
				DPSMateAttempts[zone][1][5] = check
				DPSMateAttempts[zone][1]["difficulty"] = difficulty
			end
		else
			if check then
				if DPSMateAttempts[zone] and DPSMateAttempts[zone][1] then
					tinsert(DPSMateAttempts[zone][1][6], {DPSMateCombatTime["total"], tar or DPSMate.L["unknown"]})
				end
			else
				tinsert(DPSMateAttempts[zone], 1, {
					[1] = DPSMate.L["unknown"],
					[2] = DPSMateCombatTime["total"],
					[3] = GetRealTime(),
					[6] = {},
					["difficulty"] = difficulty
				})
			end
		end
	end
end

local banedItems = {
	[20725] = true,
	[18562] = true,
	[22450] = true,
	[29434] = true,
	[32229] = true, -- Lionseye yellow
	[32231] = true, -- Pyrestone orange
	[32230] = true, -- amethyst purple
	[32249] = true, -- Emeral green
	[32227] = true, -- Spinal red
	[32228] = true, -- Sapphire blue
	
	[30183] = true, -- Nethervortex
	
	-- TK Weapons
	[30317] = true,
	[30316] = true,
	[30312] = true,
	[30318] = true,
	[30319] = true,
	[30320] = true,
	[30313] = true,
	[30311] = true,
	[30314] = true,
	
	-- All Badges 
	[34057] = true,
	[45624] = true,
	[49426] = true,
	[40752] = true,
	[47241] = true,
	[40753] = true,
}
function DPSMate.DB:Loot(user, quality, itemid)
	if not DPSMateSettings["legacylogs"] and quality>3 and not banedItems[itemid] then
		local zone = GetRealZoneText()
		if not DPSMateLoot[zone] then DPSMateLoot[zone] = {} end
		if self.Zones[zone] then -- Need to find a solution for world bosses.
			tinsert(DPSMateLoot[zone], {
				[1] = DPSMateCombatTime["total"],
				[2] = itemid,
				[3] = quality,
				[4] = user
			})
		end
	end
end

-- Type: 1 => FriendlyFire, 2 => Damage taken, 3 => Debuff taken
function DPSMate.DB:BuildFail(type, user, cause, ability, amount)
	if not DPSMateSettings["legacylogs"] and not DPSMate.RegistredModules["fails"] then return end
	user = self:BuildUser(user)
	cause = self:BuildUser(cause)
	ability = self:BuildAbility(ability)
	for cat, val in pairs(tablemodes) do
		if not DPSMateFails[cat][cause] then
			DPSMateFails[cat][cause] = {}
		end
		tinsert(DPSMateFails[cat][cause], 1, {
			[1] = type,
			[2] = user,
			[3] = ability,
			[4] = amount,
			[5] = DPSMateCombatTime[val],
			[6] = GetRealTime(),
		})
	end
	DPSMate:Broadcast(3, user, cause, ability, amount, type)
	self.NeedUpdate = true
end

local ActiveCC = {}
local LastHitOnTarget = {}
function DPSMate.DB:BuildActiveCC(target, ability)
	if not ActiveCC[target] then
		ActiveCC[target] = {}
	end
	ActiveCC[target][ability] = GetTime()
	LastHitOnTarget[target] = nil
end

function DPSMate.DB:RemoveActiveCC(target, ability)
	if not ActiveCC[target] then return end
	if ActiveCC[target][ability] and LastHitOnTarget[target] then
		if (GetTime()-ActiveCC[target][ability])<=DPSMate.Parser.CC[ability] then
			self:CCBreaker(target, ability, LastHitOnTarget[target][1], LastHitOnTarget[target][2])
		end
	end
	ActiveCC[target][ability] = false;
end

function DPSMate.DB:AssignLastHit(target, cause, spellName)
	LastHitOnTarget[target] = {cause, spellName}
end

function DPSMate.DB:CCBreaker(target, ability, cause, spellName)
	if not DPSMateSettings["legacylogs"] and not DPSMate.RegistredModules["ccbreaker"] then return end
	ability = self:BuildAbility(ability)
	spellName = self:BuildAbility(spellName)
	target = self:BuildUser(target)
	cause = self:BuildUser(cause)
	for cat, val in pairs(tablemodes) do
		if not DPSMateCCBreaker[cat][cause] then
			DPSMateCCBreaker[cat][cause] = {}
		end
		tinsert(DPSMateCCBreaker[cat][cause], 1, {
			[1] = ability,
			[2] = target,
			[3] = DPSMateCombatTime[val],
			[4] = GetRealTime(),
			[5] = spellName
		})
	end
end




-- Prayer Of Mending
-- POM only 1 time per player

function DPSMate.DB:GetClass(name)
	if DPSMateUser[name] then
		if DPSMateUser[name][2] then
			return DPSMateUser[name][2]
		end
	end
	local class = UnitClass(name)
	if class then return strlower(class) end
	return false
end

local POM_Owner = {}
local LastHitWithPOM
local HasPOM = {}
function DPSMate.DB:GetPOMOwner(dstName)
	local class = self:GetClass(dstName)
	for name, target in pairs(POM_Owner) do
		if target==dstName then
			return name
		end
	end
	return false
end

function DPSMate.DB:EvaluateLastHitWithPOM(dstName)
	if HasPOM[dstName] then
		LastHitWithPOM = dstName
	end
end

function DPSMate.DB:POM_Gained(dstName)
	if LastHitWithPOM then
		local owner = self:GetPOMOwner(LastHitWithPOM)
		if owner then
			POM_Owner[owner] = dstName
		end
	end
	HasPOM[dstName] = true
end

function DPSMate.DB:POM_Faded(dstName)
	HasPOM[dstName] = false
end

function DPSMate.DB:POM_Casted(srcName,dstName) -- POM_Jumped
	local class = self:GetClass(srcName)
	if not class or class == "priest" then -- Assuming its a new one from a priest
		POM_Owner[srcName] = dstName
		return
	else -- Assuming it just jumps to the next target
		local owner = self:GetPOMOwner(srcName)
		if owner then
			POM_Owner[owner] = dstName -- Assigning new target
		end
		return -- Guess we cant do shiet then
	end
end

function DPSMate.DB:POM_Healed(srcName) -- return original source
	for c,v in pairs(POM_Owner) do
		if v==srcName then
			return c
		end
	end
	return srcName -- Return old name if you can't find it
end



-- Trying to get the guardians sorted

local GuardianWaitingForAssignment = {}
local GuardianOwnerByGGUID = {}
local validGuardians = {
	--[GetSpellInfo(1535).." I"] = true, -- Fire Nova 1
	--[GetSpellInfo(8498).." II"] = true, -- Fire Nova 2
	--[GetSpellInfo(8499).." III"] = true, -- Fire Nova 3
	--[GetSpellInfo(11314).." IV"] = true, -- Fire Nova 4
	[GetSpellInfo(11315)] = true, -- Fire Nova 5
	--[GetSpellInfo(3599).." I"] = true, -- Searing Totem 1
	--[GetSpellInfo(6363).." II"] = true, -- Searing Totem 2
	--[GetSpellInfo(6364).." III"] = true, -- Searing Totem 3
	--[GetSpellInfo(6365).." IV"] = true, -- Searing Totem 4
	--[GetSpellInfo(10437).." V"] = true, -- Searing Totem 5
	[GetSpellInfo(10438)] = true, -- Searing Totem 6
	--[GetSpellInfo(8190).." I"] = true, -- Magma Totem 1
	--[GetSpellInfo(10585).." II"] = true, -- Magma Totem 2
	--[GetSpellInfo(10586).." II"] = true, -- Magma Totem 3
	[GetSpellInfo(10587)] = true, -- Magma Totem 4
	[GetSpellInfo(25567)] = true, -- Healing Stream Totem
	[GetSpellInfo(2894)] = true, -- Greater Fire Elemental Totem
	[GetSpellInfo(2062)] = true, -- Greater Earth Elemental Totem
}

local TranslateElementalGuardians = {
	[DPSMate.L["fireelemental"]] = GetSpellInfo(2894),
	[DPSMate.L["earthelemental"]] = GetSpellInfo(2062),
}

local forceofnature = GetSpellInfo(33831)
local treant = DPSMate.L["treant"]
local treantWaitingForOwner = {}
local treantOwner = {}

function DPSMate.DB:AddPotentialGuardianForOwner(spellName, ownerGUID, ownerName)
	if spellName==forceofnature then tinsert(treantWaitingForOwner, {ownerGUID, ownerName}) end
	if not GuardianWaitingForAssignment[spellName] then GuardianWaitingForAssignment[spellName] = {} end
	tinsert(GuardianWaitingForAssignment[spellName], {ownerGUID, ownerName})
end

function DPSMate.DB:AssignGuardianToOwner(guardianGUID, guardianName)
	if GuardianWaitingForAssignment[guardianName] then
		for cat, val in pairs(GuardianWaitingForAssignment[guardianName]) do
			GuardianOwnerByGGUID[guardianGUID] = val
			tremove(GuardianWaitingForAssignment[guardianName], cat)
			break;
		end
	end
end

local guardList = {
	["Minion"] = true,
	["Guardian"] = true,
	["Wächter"] = true,
	["Diener"] = true,
	["Begleiter"] = true,
	["Pet"] = true,
}
function DPSMate.DB:GetMinionOwner(name, spellName)
	local nName, guard = name:match(DPSMate.L["minionregex"]) -- Gotta test that on the german client
	if nName and guardList[guard] then
		return nName, spellName..DPSMate.L["minion"]
	end
	return name, spellName
end

function DPSMate.DB:AssignEnslavedDemon(dstGUID, srcGUID, srcName)
	GuardianOwnerByGGUID[dstGUID] = {srcGUID, srcName}
end

function DPSMate.DB:GetGuardianOwnerByGUID(guid, name, spellName)
	if not spellName then
		return guid, name, spellName
	end
	name = name or DPSMate.L["unknown"]
	local Gname, rank = name:match("(.+) (%a%a?)")
	if TranslateElementalGuardians[name] then
		Gname = TranslateElementalGuardians[name]
	end
	if validGuardians[Gname] or GuardianOwnerByGGUID[guid] then
		if GuardianOwnerByGGUID[guid] then
			return GuardianOwnerByGGUID[guid][1], GuardianOwnerByGGUID[guid][2], spellName..DPSMate.L["guardian"]
		else
			self:AssignGuardianToOwner(guid, Gname)
			if GuardianOwnerByGGUID[guid] then
				return GuardianOwnerByGGUID[guid][1], GuardianOwnerByGGUID[guid][2], spellName..DPSMate.L["guardian"]
			else
				return guid, name, spellName
			end
		end
	end
	if name==treant then
		if treantWaitingForOwner[1] then
			if treantOwner[treantWaitingForOwner[1][2]] then
				if treantOwner[treantWaitingForOwner[1][2]]>=3 then
					tremove(treantWaitingForOwner, 1)
				end
			end
			if treantWaitingForOwner[1] then
				if not treantOwner[treantWaitingForOwner[1][2]] then
					treantOwner[treantWaitingForOwner[1][2]] = 0
				end
				GuardianOwnerByGGUID[guid] = treantWaitingForOwner[1]
				treantOwner[treantWaitingForOwner[1][2]] = treantOwner[treantWaitingForOwner[1][2]] + 1
				return GuardianOwnerByGGUID[guid][1], GuardianOwnerByGGUID[guid][2], spellName..DPSMate.L["guardian"]
			end
		end
	end
	return guid, self:GetMinionOwner(name, spellName)
end

-- earthshield

local EarthShieldByPlayer = {}
function DPSMate.DB:RegisterEarthShield(dstName, srcName)
	EarthShieldByPlayer[dstName] = srcName
end

function DPSMate.DB:GetEarthShieldOwner(srcName)
	if EarthShieldByPlayer[srcName] then
		return EarthShieldByPlayer[srcName]
	end
	return srcName
end


-- lifebloom

local LifeBloomByPlayer = {}
function DPSMate.DB:RegisterLifeBloom(dstName, srcName)
	LifeBloomByPlayer[dstName] = srcName
end

function DPSMate.DB:LifeBloomOwner(srcName)
	if LifeBloomByPlayer[srcName] then
		return LifeBloomByPlayer[srcName]
	end
	return srcName
end


-- New Resurrection

function DPSMate.DB:Resurrection(srcName, dstName, spellName)
	if not DPSMateSettings["legacylogs"] and not DPSMate.RegistredModules["ressurection"] then return end
	if not srcName or not dstName or not dstName then return end
	spellName = self:BuildAbility(spellName)
	dstName = self:BuildUser(dstName)
	srcName= self:BuildUser(srcName)
	for cat, val in pairs({[1]="total", [2]="current"}) do
		if not DPSMateRezz[cat][srcName] then
			DPSMateRezz[cat][srcName] = {}
		end
		if not DPSMateRezz[cat][srcName][dstName] then
			DPSMateRezz[cat][srcName][dstName] = {}
		end
		tinsert(DPSMateRezz[cat][srcName][dstName], {DPSMateCombatTime[val], spellName})
	end
	self.NeedUpdate = true
end

DPSMate.DB:SetScript("OnEvent", function() this[event]() end)
DPSMate.DB:SetScript("OnUpdate", function() this:OnUpdate() end)
DPSMate.DB:RegisterEvent("PLAYER_AURAS_CHANGED")
DPSMate.DB:RegisterEvent("PET_STABLE_CLOSED")
DPSMate.DB:RegisterEvent("PLAYER_PET_CHANGED")
DPSMate.DB:RegisterEvent("VARIABLES_LOADED")
DPSMate.DB:RegisterEvent("PLAYER_REGEN_DISABLED")
DPSMate.DB:RegisterEvent("PLAYER_REGEN_ENABLED")
DPSMate.DB:RegisterEvent("PLAYER_TARGET_CHANGED")
DPSMate.DB:RegisterEvent("ZONE_CHANGED_NEW_AREA")