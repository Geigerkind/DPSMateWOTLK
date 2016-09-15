-- Global Variables
DPSMate.Modules.DetailsProcsTotal = {}

-- Local variables
local curKey = 1
local db, cbt = {}, 0
local Buffpos = 0
local _G = getglobal
local tinsert = table.insert
local strformat = string.format
local DetailsArr = {}
local TL = 0
local mab = {
	[GetSpellInfo(6603)] = true, -- AutoAttack
	[GetSpellInfo(1752)] = true, -- Sinister Strike
	[GetSpellInfo(2098)] = true, -- Eviscerate
	[GetSpellInfo(5308)] = true, -- Execute
	[GetSpellInfo(7384)] = true, -- Overpower
	[GetSpellInfo(23881)] = true, -- Bloodthirst
	[GetSpellInfo(12294)] = true, -- Mortal Strike
	[GetSpellInfo(78)] = true, -- Heroic Strike
	[GetSpellInfo(11609)] = true, -- Cleave
	[GetSpellInfo(9633)] = true, -- Whirlwind
	[GetSpellInfo(53)] = true, -- Backstab
	[GetSpellInfo(8242)] = true, -- Shield Slam
	[GetSpellInfo(12170)] = true, -- Revenge
	[GetSpellInfo(11971)] = true, -- Sunder Armor
	[GetSpellInfo(9080)] = true, -- Hamstring
	[GetSpellInfo(22689)] = true, -- Mangle
	[GetSpellInfo(35395)] = true, -- Crusader Strike
	[GetSpellInfo(31935)] = true, -- Avenger's Shield
	[GetSpellInfo(1329)] = true, -- Mutilate
	[GetSpellInfo(14251)] = true, -- Riposte
	[GetSpellInfo(20243)] = true -- Devastate
}
local specialSnowflakes = {
	[GetSpellInfo(14181)] = {
		[GetSpellInfo(2098)] = true, -- Eviscerate
		[GetSpellInfo(5171)] = true, -- Slice and Dice
		[GetSpellInfo(408)] = true, -- Kidney Shot
		[GetSpellInfo(1943)] = true, -- Rupture
	},
	[GetSpellInfo(14161)] = {
		[GetSpellInfo(2098)] = true, -- Eviscerate
		[GetSpellInfo(5171)] = true, -- Slice and Dice
		[GetSpellInfo(408)] = true, -- Kidney Shot
		[GetSpellInfo(1943)] = true, -- Rupture
	},
	[GetSpellInfo(22008)] = {
		[GetSpellInfo(10274)] = true, -- Arcane Missiles
		[GetSpellInfo(12466)] = true, -- Fireball
		[GetSpellInfo(12737)] = true, -- Frostbolt
	},
	[GetSpellInfo(28813)] = {
		[GetSpellInfo(1752)] = true, -- Sinister Strike
		[GetSpellInfo(53)] = true, -- Backstab
		[GetSpellInfo(17348)] = true, -- Hemorrhage
	},
	[GetSpellInfo(26128)] = {
		[GetSpellInfo(10274)] = true, -- Arcane Missiles
		[GetSpellInfo(12466)] = true, -- Fireball
		[GetSpellInfo(12737)] = true, -- Frostbolt
	},
	[GetSpellInfo(26127)] = {
		[GetSpellInfo(10)] = true, -- Blizzard
	},
	[GetSpellInfo(28762)] = {
		[GetSpellInfo(10274)] = true, -- Arcane Missiles
		[GetSpellInfo(12466)] = true, -- Fireball
		[GetSpellInfo(12737)] = true, -- Frostbolt
	},
	[GetSpellInfo(12536)] = {
		[GetSpellInfo(10274)] = true, -- Arcane Missiles
		[GetSpellInfo(12466)] = true, -- Fireball
		[GetSpellInfo(12737)] = true, -- Frostbolt
		[GetSpellInfo(12167)] = true, -- Lightning Bolt
		[GetSpellInfo(12058)] = true, -- Chain Lightning
		[GetSpellInfo(8042)] = true, -- Earth Shock
		[GetSpellInfo(8050)] = true, -- Flame Shock
		[GetSpellInfo(8056)] = true, -- Frost Shock
	},
	[GetSpellInfo(26975)] = {
		[GetSpellInfo(10321)] = true, -- Judgement
	},
	[GetSpellInfo(26121)] = {
		[GetSpellInfo(12167)] = true, -- Lightning Bolt
		[GetSpellInfo(12058)] = true, -- Chain Lightning
		[GetSpellInfo(8042)] = true, -- Earth Shock
		[GetSpellInfo(8050)] = true, -- Flame Shock
		[GetSpellInfo(8056)] = true, -- Frost Shock
	},
	[GetSpellInfo(28839)] = {
		[GetSpellInfo(12739)] = true, -- Shadow Bolt
	},
	[GetSpellInfo(18095)] = {
		[GetSpellInfo(172)] = true, -- Corruption
		[GetSpellInfo(12693)] = true, -- Drain Life
	},
	[GetSpellInfo(6150)] = {
		[GetSpellInfo(75)] = true, -- Auto Shot
	}
}
local specialSnowflakesDmgTaken = {
	[1] = { -- All
		[GetSpellInfo(28846)] = true, -- Cheat Death
		[GetSpellInfo(20137)] = true, -- Redoubt
	}, -- Just crits
	[2] = {
		[GetSpellInfo(12880)] = true, -- Enrage
		[GetSpellInfo(27818)] = true, -- Blessed Recovery
		[GetSpellInfo(14743)] = true, -- Focused Casting
	}, -- Just Parry
	[3] = {
		[GetSpellInfo(37515)] = true,
	}
}
local specialSnowflakesHealTaken = {
	[GetSpellInfo(15363)] = {
		[GetSpellInfo(2061)] = true, -- Flash Heal
		[GetSpellInfo(10965)] = true, -- Greater Heal
		[GetSpellInfo(12039)] = true, -- Heal
		[GetSpellInfo(596)] = true, -- Prayer of Healing
		[GetSpellInfo(2050)] = true, -- Lesser Heal
		[GetSpellInfo(13908)] = true, -- Desperate Prayer
	},
	[GetSpellInfo(2008)] = {
		[GetSpellInfo(1064)] = true, -- Chain Heal
		[GetSpellInfo(331)] = true, -- Healing Wave
		[GetSpellInfo(8004)] = true, -- Lesser Healing Wave
	}
}
local specialSnowflakesHealDone = {
	[GetSpellInfo(16886)] = {
		[GetSpellInfo(8936)] = true, -- Regrowth
		[GetSpellInfo(18562)] = true, -- Swiftmend
		[GetSpellInfo(5185)] = true, -- Healing Touch
	},
	[GetSpellInfo(28804)] = {
		[GetSpellInfo(2061)] = true, -- Flash Heal
		[GetSpellInfo(10965)] = true, -- Greater Heal
		[GetSpellInfo(12039)] = true, -- Heal
		[GetSpellInfo(596)] = true, -- Prayer of Healing
		[GetSpellInfo(2050)] = true, -- Lesser Heal
		[GetSpellInfo(13908)] = true, -- Desperate Prayer
	},
	[GetSpellInfo(23688)] = {
		[GetSpellInfo(2061)] = true, -- Flash Heal
		[GetSpellInfo(10965)] = true, -- Greater Heal
		[GetSpellInfo(12039)] = true, -- Heal
		[GetSpellInfo(596)] = true, -- Prayer of Healing
		[GetSpellInfo(2050)] = true, -- Lesser Heal
		[GetSpellInfo(13908)] = true, -- Desperate Prayer
		[GetSpellInfo(19750)] = true, -- Flash of Light
		[GetSpellInfo(635)] = true, -- Holy Light
		[GetSpellInfo(20473)] = true, -- Holy Shock
		[GetSpellInfo(8936)] = true, -- Regrowth
		[GetSpellInfo(18562)] = true, -- Swiftmend
		[GetSpellInfo(5185)] = true, -- Healing Touch
		[GetSpellInfo(1064)] = true, -- Chain Heal
		[GetSpellInfo(331)] = true, -- Healing Wave
		[GetSpellInfo(8004)] = true, -- Lesser Healing Wave
	},
	[GetSpellInfo(27521)] = {
		[GetSpellInfo(2061)] = true, -- Flash Heal
		[GetSpellInfo(10965)] = true, -- Greater Heal
		[GetSpellInfo(12039)] = true, -- Heal
		[GetSpellInfo(596)] = true, -- Prayer of Healing
		[GetSpellInfo(2050)] = true, -- Lesser Heal
		[GetSpellInfo(13908)] = true, -- Desperate Prayer
		[GetSpellInfo(19750)] = true, -- Flash of Light
		[GetSpellInfo(635)] = true, -- Holy Light
		[GetSpellInfo(20473)] = true, -- Holy Shock
		[GetSpellInfo(8936)] = true, -- Regrowth
		[GetSpellInfo(18562)] = true, -- Swiftmend
		[GetSpellInfo(5185)] = true, -- Healing Touch
		[GetSpellInfo(1064)] = true, -- Chain Heal
		[GetSpellInfo(331)] = true, -- Healing Wave
		[GetSpellInfo(8004)] = true, -- Lesser Healing Wave
	},
}

function DPSMate.Modules.DetailsProcsTotal:UpdateDetails(obj, key)
	curKey = key
	db, cbt = DPSMate:GetMode(key)
	DPSMate_Details_ProcsTotal_Title:SetText(DPSMate.L["procssum"])
	Buffpos = 0
	DetailsArr = self:EvalTable()
	TL = DPSMate:TableLength(DetailsArr)-6
	self:CleanTables()
	self:UpdateBuffs(0)
	DPSMate_Details_ProcsTotal:Show()
	DPSMate_Details_ProcsTotal:SetScale((DPSMateSettings["targetscale"] or 0.58)/UIParent:GetScale())
end

function DPSMate.Modules.DetailsProcsTotal:EvalTable()
	local a = {}
	for cat, val in pairs(db) do -- each user
		local user = DPSMate:GetUserById(cat)
		if DPSMate:ApplyFilter(curKey, user) then
			local z,x,y = DPSMate.Modules.Procs:EvalTable(DPSMateUser[user], curKey)
			for ca, va in pairs(z) do
				if a[va] then
					a[va] = a[va] + y[ca]
				else
					a[va] = y[ca]
				end
			end
		end
	end
	local b = {}
	for cat, val in pairs(a) do
		local i=1
		local chance = self:GetChance(cat, val)
		while true do
			if not b[i] then
				tinsert(b, i, {val, cat, chance})
				break
			elseif b[i][1]<val then
				tinsert(b, i, {val, cat, chance})
				break
			end
			i=i+1
		end
	end
	return b
end

function DPSMate.Modules.DetailsProcsTotal:GetTotalHits(user)
	local hits = 0
	if DPSMateDamageDone[1][user] then
		for cat, val in pairs(DPSMateDamageDone[1][user]) do
			if cat~="i" then
				if mab[DPSMate:GetAbilityById(cat)] then
					hits = hits + val[1] + val[5]
				end
			end
		end
	end
	return hits
end

function DPSMate.Modules.DetailsProcsTotal:GetChance(ab, amount)
	local hits = 0.0000001
	local abname = DPSMate:GetAbilityById(ab)
	for cat, val in pairs(db) do
		if val[ab] then
			hits = hits + self:GetSpecialSnowFlakeHits(abname, cat)
		end
	end
	return 100*amount/hits
end

function DPSMate.Modules.DetailsProcsTotal:GetSpecialSnowFlakeHits(ability, user)
	local num = 0;
	if specialSnowflakes[ability] then
		for cat, val in pairs(DPSMateDamageDone[1][user]) do
			if cat~="i" then
				if specialSnowflakes[ability][DPSMate:GetAbilityById(cat)] then
					num = num + val[1] + val[5]
				end
			end
		end
	elseif specialSnowflakesDmgTaken[1][ability] then
		for cat, val in pairs(DPSMateDamageTaken[1][user]) do
			if cat~="i" then
				for ca, va in pairs(val) do
					if ca~="i" then
						if DPSMate:GetAbilityById(ca) == DPSMate.L["AutoAttack"] then
							num = num + va[1] + va[5] + va[15]
						end
					end
				end
			end
		end
	elseif specialSnowflakesDmgTaken[2][ability] then
		for cat, val in pairs(DPSMateDamageTaken[1][user]) do
			if cat~="i" then
				for ca, va in pairs(val) do
					if ca~="i" then
						if DPSMate:GetAbilityById(ca) == DPSMate.L["AutoAttack"] then
							num = num + va[5]
						end
					end
				end
			end
		end
	elseif specialSnowflakesDmgTaken[3][ability] then
		for cat, val in pairs(DPSMateDamageTaken[1][user]) do
			if cat~="i" then
				for ca, va in pairs(val) do
					if ca~="i" then
						if DPSMate:GetAbilityById(ca) == DPSMate.L["AutoAttack"] then
							num = num + va[10]
						end
					end
				end
			end
		end
	elseif specialSnowflakesHealTaken[ability] and DPSMateHealingTaken[1][user] then
		for cat, val in pairs(DPSMateHealingTaken[1][user]) do
			if cat~="i" then
				for ca, va in pairs(val) do
					if specialSnowflakesHealTaken[ability][DPSMate:GetAbilityById(ca)] then
						num = num + va[2] + va[3]
					end
				end
			end
		end
	elseif specialSnowflakesHealDone[ability] and DPSMateTHealing[1][user] then
		for cat, val in pairs(DPSMateTHealing[1][user]) do
			if cat~="i" then
				if specialSnowflakesHealDone[ability][DPSMate:GetAbilityById(cat)] then
					num = num + val[2] + val[3]
				end
			end
		end
	elseif ability == GetSpellInfo(8602) or ability == GetSpellInfo(12974) then
		if DPSMateDamageDone[1][user] then
			for cat, val in pairs(DPSMateDamageDone[1][user]) do
				if cat~="i" then
					num = num + val[5]
				end
			end
		end
	else
		return self:GetTotalHits(user);
	end
	if ability == GetSpellInfo(14181) then
		for cat, val in pairs(DPSMateAurasGained[1][user]) do
			if specialSnowflakes[ability][DPSMate:GetAbilityById(cat)] then
				num = num + DPSMate:TableLength(val[2])
			end
		end
	end
	return num;
end

function DPSMate.Modules.DetailsProcsTotal:CreateGraphTable(obj)
	local lines = {}
	for i=1, 6 do
		-- Horizontal
		DPSMate.Options.graph:DrawLine(obj, 5, 223-i*30, 655, 223-i*30, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
	end
	-- Vertical
	DPSMate.Options.graph:DrawLine(obj, 235, 215, 235, 15, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
	DPSMate.Options.graph:DrawLine(obj, 300, 215, 300, 15, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
end

function DPSMate.Modules.DetailsProcsTotal:CleanTables()
	local path = "DPSMate_Details_ProcsTotal_Buffs_Row"
	for i=1, 6 do
		_G(path..i.."_Icon"):SetTexture()
		_G(path..i.."_Name"):SetText()
		_G(path..i.."_Count"):SetText()
		_G(path..i.."_Chance"):SetText()
	end
end

function DPSMate.Modules.DetailsProcsTotal:RoundToH(val)
	if val>100 then
		return 100
	end
	return val
end

function DPSMate.Modules.DetailsProcsTotal:UpdateBuffs(arg1)
	local path = "DPSMate_Details_ProcsTotal_Buffs_Row"
	Buffpos=Buffpos-(arg1 or 0)
	if Buffpos<0 then Buffpos = 0 end
	if Buffpos>TL then Buffpos = TL end
	if TL<0 then Buffpos = 0 end
	for i=1, 6 do
		local pos = Buffpos + i
		if not DetailsArr[pos] then break end
		local ab = DPSMate:GetAbilityById(DetailsArr[pos][2])
		_G(path..i.."_Icon"):SetTexture(DPSMate:GetSpellIcon(ab))
		_G(path..i.."_Name"):SetText(ab)
		_G(path..i.."_Count"):SetText(DetailsArr[pos][1])
		_G(path..i.."_Chance"):SetText(strformat("%.2f", self:RoundToH(DetailsArr[pos][3])).."%")
	end
end
