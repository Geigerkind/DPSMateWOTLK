-- Global Variables
DPSMate.Modules.Procs = {}
DPSMate.Modules.Procs.Hist = "Auras"
DPSMate.Options.Options[1]["args"]["procs"] = {
	order = 234,
	type = 'toggle',
	name = DPSMate.L["procs"],
	desc = DPSMate.L["show"].." "..DPSMate.L["procs"]..".",
	get = function() return DPSMateSettings["windows"][(DPSMate.Options.Dewdrop:GetOpenedParent() or DPSMate).Key or 1]["options"][1]["procs"] end,
	set = function() DPSMate.Options:ToggleDrewDrop(1, "procs", DPSMate.Options.Dewdrop:GetOpenedParent()) end,
}

-- Register the moodule
DPSMate:Register("procs", DPSMate.Modules.Procs, DPSMate.L["procs"])

local tinsert = table.insert
local strformat = string.format
local nonProcProcs = {
	[GetSpellInfo(20007)] = true, -- Holy Strength
	[GetSpellInfo(16551)] = true, -- Felstriker
	[GetSpellInfo(22850)] = true, -- Sanctuary
	[GetSpellInfo(15494)] = true, -- Fury of Forgewright
	[GetSpellInfo(24255)] = true, -- Primal Blessing
	[GetSpellInfo(21186)] = true, -- Spinal Reaper
	[GetSpellInfo(22008)] = true, -- Netherwind Focus
	[GetSpellInfo(23548)] = true, -- Parry
	[GetSpellInfo(23719)] = true, -- Untamed Fury
	[GetSpellInfo(23688)] = true, -- Aura of the Blue Dragon
	[GetSpellInfo(8065)] = true, -- Invigorate
	[GetSpellInfo(28813)] = true, -- Head Rush
	[GetSpellInfo(26128)] = true, -- Enigma Resist Bonus
	[GetSpellInfo(26127)] = true, -- Enigma Blizzard Bonus
	[GetSpellInfo(28762)] = true, -- Not There
	[GetSpellInfo(28804)] = true, -- Epiphany
	[GetSpellInfo(15363)] = true, -- Inspiration
	[GetSpellInfo(27818)] = true, -- Blessed Recovery
	[GetSpellInfo(14743)] = true, -- Focused Casting
	[GetSpellInfo(12536)] = true, -- Clearcasting
	[GetSpellInfo(16886)] = true, -- Nature's Grace
	[GetSpellInfo(26975)] = true, -- Battlegear of Eternal Justice
	--[GetSpellInfo(20137)] = true, -- Redoubt
	[GetSpellInfo(8602)] = true, -- Vengeance
	[GetSpellInfo(26121)] = true, -- Stormcaller's Wrath
	[GetSpellInfo(16240)] = true, -- Ancestral Healing
	[GetSpellInfo(28839)] = true, -- Vampirism
	[GetSpellInfo(18095)] = true, -- Nightfall
	[GetSpellInfo(28846)] = true, -- Cheat Death
	[GetSpellInfo(12974)] = true, -- Flurry
	[GetSpellInfo(12880)] = true, -- Enrage
	[GetSpellInfo(6150)] = true, -- Quick Shots
	[GetSpellInfo(27521)] = true, -- Mana Restore
	[GetSpellInfo(28093)] = true, -- Lightning Speed
	[GetSpellInfo(37515)] = true, -- Blade Turning -- proc on parry
}

function DPSMate.Modules.Procs:GetSortedTable(arr,k)
	local b, a, total = {}, {}, 0
	for cat, val in pairs(arr) do -- 2 Target
		if DPSMate:ApplyFilter(k, DPSMate:GetUserById(cat)) then
			local CV = 0
			for ca, va in pairs(val) do -- 3 ability
				local name = DPSMate:GetAbilityById(ca)
				if (DPSMate.Parser.procs[name] and va[4]) or nonProcProcs[name] or DPSMate.Parser.DmgProcs[name] then
					for c, v in pairs(va[1]) do -- 1 Ability
						CV=CV+1
					end
				end
			end
			local i = 1
			while true do
				if (not b[i]) then
					tinsert(b, i, CV)
					tinsert(a, i, cat)
					break
				else
					if b[i] < CV then
						tinsert(b, i, CV)
						tinsert(a, i, cat)
						break
					end
				end
				i=i+1
			end
			total = total + CV
		end
	end
	return b, total, a
end

function DPSMate.Modules.Procs:EvalTable(user, k)
	local a, b, temp, total = {}, {}, {}, 0
	local arr = DPSMate:GetMode(k)
	for cat, val in pairs(arr[user[1]]) do -- 3 Ability
		local name = DPSMate:GetAbilityById(cat)
		if (DPSMate.Parser.procs[name] and val[4]) or nonProcProcs[name] or DPSMate.Parser.DmgProcs[name] then
			local CV = 0
			for c, v in pairs(val[1]) do -- 1 Ability
				CV=CV+1
			end
			if temp[cat] then temp[cat]=temp[cat]+CV else temp[cat]=CV end
		end
	end
	for cat, val in pairs(temp) do
		local i = 1
		while true do
			if (not b[i]) then
				tinsert(b, i, val)
				tinsert(a, i, cat)
				break
			else
				if b[i] < val then
					tinsert(b, i, val)
					tinsert(a, i, cat)
					break
				end
			end
			i=i+1
		end
		total = total + val
	end
	return a, total, b
end

function DPSMate.Modules.Procs:GetSettingValues(arr, cbt, k)
	local pt = ""

	local name, value, perc, sortedTable, total, a, p, strt = {}, {}, {}, {}, 0, 0, "", {[1]="",[2]=""}

	if DPSMateSettings["windows"][k]["numberformat"] == 2 or DPSMateSettings["windows"][k]["numberformat"] == 4 then p = "K"; pt="K" end
	sortedTable, total, a = DPSMate.Modules.Procs:GetSortedTable(arr,k)
	for cat, val in pairs(sortedTable) do
		local dmg, tot, sort = val, total, sortedTable[1]
		if dmg==0 then break end; if tot<=10000 then pt="" end
		local str = {[1]="",[2]="",[3]=""}
		if DPSMateSettings["columnsprocs"][1] then str[1] = " "..DPSMate:Commas(dmg, k)..p; strt[2] = DPSMate:Commas(tot, k)..pt end
		if DPSMateSettings["columnsprocs"][2] then str[3] = " ("..strformat("%.1f", 100*dmg/tot).."%)" end
		tinsert(name, DPSMate:GetUserById(a[cat]))
		tinsert(value, str[1]..str[3])
		tinsert(perc, 100*(dmg/sort))
	end
	return name, value, perc, strt
end

function DPSMate.Modules.Procs:ShowTooltip(user,k)
	if DPSMateSettings["informativetooltips"] then
		local a,b,c = DPSMate.Modules.Procs:EvalTable(DPSMateUser[user], k)
		GameTooltip:AddLine(DPSMate.L["tttop"]..DPSMateSettings["subviewrows"]..DPSMate.L["ttabilities"])
		for i=1, DPSMateSettings["subviewrows"] do
			if not a[i] then break end
			GameTooltip:AddDoubleLine(i..". "..DPSMate:GetAbilityById(a[i]),c[i].." ("..strformat("%.2f", 100*c[i]/b).."%)",1,1,1,1,1,1)
		end
	end
end

function DPSMate.Modules.Procs:OpenDetails(obj, key, bool)
	if bool then
		DPSMate.Modules.DetailsProcs:UpdateCompare(obj, key, bool)
	else
		DPSMate.Modules.DetailsProcs:UpdateDetails(obj, key)
	end
end

function DPSMate.Modules.Procs:OpenTotalDetails(obj, key)
	DPSMate.Modules.DetailsProcsTotal:UpdateDetails(obj, key)
end


