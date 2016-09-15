-- Global Variables
DPSMate.Modules.DetailsProcs = {}

-- Local variables
local DetailsUser, DetailsUserComp = "", ""
local curKey = 1
local db, cbt = {}, 0
local Buffpos = 0
local BuffposComp = 0
local _G = getglobal
local tinsert = table.insert
local strformat = string.format
local hits = 1
local hitsComp = 1
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

function DPSMate.Modules.DetailsProcs:UpdateDetails(obj, key)
	DPSMate_Details_CompareProcs:Hide()
	curKey = key
	db, cbt = DPSMate:GetMode(key)
	DetailsUser = obj.user
	DetailsUserComp = nil
	DPSMate_Details_Procs_Title:SetText(DPSMate.L["procsof"]..obj.user)
	Buffpos = 0
	self:CleanTables("")
	hits = 1
	hits = self:GetTotalHits()
	self:UpdateBuffs(0, "")
	DPSMate_Details_Procs:Show()
	DPSMate_Details_Procs:SetScale((DPSMateSettings["targetscale"] or 0.58)/UIParent:GetScale())
end

function DPSMate.Modules.DetailsProcs:UpdateCompare(obj, key, comp)
	self:UpdateDetails(obj, key)
	
	DetailsUserComp = comp
	DPSMate_Details_CompareProcs_Title:SetText(DPSMate.L["procsof"]..comp)
	BuffposComp = 0
	self:CleanTables("Compare")
	hitsComp = 1
	hitsComp = self:GetTotalHits(comp)
	self:UpdateBuffs(0, "Compare")
	DPSMate_Details_CompareProcs:Show()
end

function DPSMate.Modules.DetailsProcs:GetTotalHits(cname)
	if hits == 1 or (cname and hitsComp == 1) then
		for cat, val in pairs(DPSMateDamageDone[1][DPSMateUser[cname or DetailsUser][1]]) do
			if cat~="i" then
				if mab[DPSMate:GetAbilityById(cat)] then
					if cname then
						hitsComp = hitsComp + val[1] + val[5]
					else
						hits = hits + val[1] + val[5]
					end
				end
			end
		end
	end
	if cname then
		return hitsComp
	end
	return hits
end

function DPSMate.Modules.DetailsProcs:GetSpecialSnowFlakeHits(ability, cname)
	local num = 0;
	if specialSnowflakes[ability] then
		for cat, val in pairs(DPSMateDamageDone[1][DPSMateUser[cname or DetailsUser][1]]) do
			if cat~="i" then
				if specialSnowflakes[ability][DPSMate:GetAbilityById(cat)] then
					num = num + val[1] + val[5]
				end
			end
		end
	elseif specialSnowflakesDmgTaken[1][ability] then
		for cat, val in pairs(DPSMateDamageTaken[1][DPSMateUser[cname or DetailsUser][1]]) do
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
		for cat, val in pairs(DPSMateDamageTaken[1][DPSMateUser[cname or DetailsUser][1]]) do
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
		for cat, val in pairs(DPSMateDamageTaken[1][DPSMateUser[cname or DetailsUser][1]]) do
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
	elseif specialSnowflakesHealTaken[ability] then
		for cat, val in pairs(DPSMateHealingTaken[1][DPSMateUser[cname or DetailsUser][1]]) do
			if cat~="i" then
				for ca, va in pairs(val) do
					if specialSnowflakesHealTaken[ability][DPSMate:GetAbilityById(ca)] then
						num = num + va[2] + va[3]
					end
				end
			end
		end
	elseif specialSnowflakesHealDone[ability] then
		for cat, val in pairs(DPSMateTHealing[1][DPSMateUser[cname or DetailsUser][1]]) do
			if cat~="i" then
				if specialSnowflakesHealDone[ability][DPSMate:GetAbilityById(cat)] then
					num = num + val[2] + val[3]
				end
			end
		end
	elseif ability == GetSpellInfo(8602) or ability == GetSpellInfo(12974) then
		for cat, val in pairs(DPSMateDamageDone[1][DPSMateUser[cname or DetailsUser][1]]) do
			if cat~="i" then
				num = num + val[5]
			end
		end
	else
		if cname then
			return hitsComp
		end
		return hits;
	end
	if ability == GetSpellInfo(14181) then
		for cat, val in pairs(DPSMateAurasGained[1][DPSMateUser[cname or DetailsUser][1]]) do
			if specialSnowflakes[ability][DPSMate:GetAbilityById(cat)] then
				num = num + DPSMate:TableLength(val[2])
			end
		end
	end
	return num;
end

function DPSMate.Modules.DetailsProcs:CreateGraphTable(obj)
	local lines = {}
	for i=1, 6 do
		-- Horizontal
		DPSMate.Options.graph:DrawLine(obj, 5, 223-i*30, 655, 223-i*30, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
	end
	-- Vertical
	DPSMate.Options.graph:DrawLine(obj, 235, 215, 235, 15, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
	DPSMate.Options.graph:DrawLine(obj, 300, 215, 300, 15, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
end

function DPSMate.Modules.DetailsProcs:CleanTables(comp)
	local path = "DPSMate_Details_"..comp.."Procs_Buffs_Row"
	for i=1, 6 do
		_G(path..i.."_Icon"):SetTexture()
		_G(path..i.."_Name"):SetText()
		_G(path..i.."_Count"):SetText()
		_G(path..i.."_Chance"):SetText()
	end
end

function DPSMate.Modules.DetailsProcs:RoundToH(val)
	if val>100 then
		return 100
	end
	return val
end

function DPSMate.Modules.DetailsProcs:UpdateBuffs(arg1, comp, cname)
	if comp~="" and comp then
		cname = DetailsUserComp
	end
	local a,b,c = DPSMate.Modules.Procs:EvalTable(DPSMateUser[cname or DetailsUser], curKey)
	local t1TL = DPSMate:TableLength(a)-6
	local path = "DPSMate_Details_"..comp.."Procs_Buffs_Row"
	if comp~="" and comp then
		BuffposComp=BuffposComp-(arg1 or 0)
		if BuffposComp<0 then BuffposComp = 0 end
		if BuffposComp>t1TL then BuffposComp = t1TL end
		if t1TL<0 then BuffposComp = 0 end
		for i=1, 6 do
			local pos = BuffposComp + i
			if not a[pos] then break end
			local ab = DPSMate:GetAbilityById(a[pos])
			_G(path..i).id = a[pos]
			_G(path..i.."_Icon"):SetTexture(DPSMate:GetSpellIcon(ab))
			_G(path..i.."_Name"):SetText(ab)
			_G(path..i.."_Count"):SetText(c[pos])
			_G(path..i.."_Chance"):SetText(strformat("%.2f", self:RoundToH(100*c[pos]/self:GetSpecialSnowFlakeHits(ab, cname))).."%")
		end
	else
		Buffpos=Buffpos-(arg1 or 0)
		if Buffpos<0 then Buffpos = 0 end
		if Buffpos>t1TL then Buffpos = t1TL end
		if t1TL<0 then Buffpos = 0 end
		for i=1, 6 do
			local pos = Buffpos + i
			if not a[pos] then break end
			local ab = DPSMate:GetAbilityById(a[pos])
			_G(path..i).id = a[pos]
			_G(path..i.."_Icon"):SetTexture(DPSMate:GetSpellIcon(ab))
			_G(path..i.."_Name"):SetText(ab)
			_G(path..i.."_Count"):SetText(c[pos])
			_G(path..i.."_Chance"):SetText(strformat("%.2f", self:RoundToH(100*c[pos]/self:GetSpecialSnowFlakeHits(ab))).."%")
		end
	end
end

function DPSMate.Modules.DetailsProcs:ShowTooltip(obj)
	if obj.id then
		local user = DetailsUser
		if string.find(obj:GetName(), "Compare") then
			user = DetailsUserComp
		end
		if db[DPSMateUser[user][1]][obj.id] then
			GameTooltip:SetOwner(obj)
			GameTooltip:AddLine(DPSMate:GetAbilityById(obj.id))
			for cat, val in pairs(db[DPSMateUser[user][1]][obj.id][3]) do
				GameTooltip:AddDoubleLine(DPSMate:GetUserById(cat),val,1,1,1,1,1,1)
			end
			GameTooltip:Show()
		end
	end
end
