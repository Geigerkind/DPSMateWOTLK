-- Global Variables
DPSMate.Modules.EffectiveHealing = {}
DPSMate.Modules.EffectiveHealing.Hist = "EHealing"
DPSMate.Options.Options[1]["args"]["effectivehealing"] = {
	order = 90,
	type = 'toggle',
	name = DPSMate.L["effectivehealing"],
	desc = DPSMate.L["show"].." "..DPSMate.L["effectivehealing"]..".",
	get = function() return DPSMateSettings["windows"][(DPSMate.Options.Dewdrop:GetOpenedParent() or DPSMate).Key or 1]["options"][1]["effectivehealing"] end,
	set = function() DPSMate.Options:ToggleDrewDrop(1, "effectivehealing", DPSMate.Options.Dewdrop:GetOpenedParent()) end,
}

-- Register the moodule
DPSMate:Register("effectivehealing", DPSMate.Modules.EffectiveHealing, DPSMate.L["effectivehealing"])

local tinsert = table.insert
local strformat = string.format

function DPSMate.Modules.EffectiveHealing:GetSortedTable(arr,k)
	local b, a, total = {}, {}, 0
	for c, v in pairs(arr) do
		if DPSMate:ApplyFilter(k, DPSMate:GetUserById(c)) then
			local i = 1
			while true do
				if (not b[i]) then
					tinsert(b, i, v["i"])
					tinsert(a, i, c)
					break
				else
					if b[i] < v["i"] then
						tinsert(b, i, v["i"])
						tinsert(a, i, c)
						break
					end
				end
				i=i+1
			end
			total = total + v["i"]
		end
	end
	return b, total, a
end

function DPSMate.Modules.EffectiveHealing:EvalTable(user, k)
	local a, d = {}, {}
	local arr = DPSMate:GetMode(k)
	if not arr[user[1]] then return end
	for cat, val in pairs(arr[user[1]]) do
		if cat~="i" then
			local i = 1
			while true do
				if (not d[i]) then
					tinsert(a, i, cat)
					tinsert(d, i, val[1])
					break
				else
					if (d[i] < val[1]) then
						tinsert(a, i, cat)
						tinsert(d, i, val[1])
						break
					end
				end
				i = i + 1
			end
		end
	end
	return a, arr[user[1]]["i"], d
end

function DPSMate.Modules.EffectiveHealing:GetSettingValues(arr, cbt, k,ecbt)
	local pt = ""

	local name, value, perc, sortedTable, total, a, p, strt = {}, {}, {}, {}, 0, 0, "", {[1]="",[2]=""}
	if DPSMateSettings["windows"][k]["numberformat"] == 2 or DPSMateSettings["windows"][k]["numberformat"] == 4 then p = "K"; pt="K" end
	sortedTable, total, a = DPSMate.Modules.EffectiveHealing:GetSortedTable(arr,k)
	for cat, val in pairs(sortedTable) do
		local va, tot, sort, varea, totr, sortr = DPSMate:FormatNumbers(val, total, sortedTable[1], k)
		if varea==0 then break end; if totr<=10000 then pt="" end; if varea<=10000 then p="" end
		local str = {[1]="",[2]="",[3]="",[4]=""}
		local pname = DPSMate:GetUserById(a[cat])
		if DPSMateSettings["columnsehealing"][1] then str[1] = " "..DPSMate:Commas(va, k)..p; strt[2] = " "..DPSMate:Commas(tot, k)..pt end
		if DPSMateSettings["columnsehealing"][3] then str[2] = " ("..strformat("%.1f", 100*varea/totr).."%)" end
		if DPSMateSettings["columnsehealing"][2] then str[3] = "("..strformat("%.1f", va/cbt)..p..")"; strt[1] = "("..strformat("%.1f", tot/cbt)..pt..")" end
		if DPSMateSettings["columnsehealing"][4] then str[4] = " ("..strformat("%.1f", va/(ecbt[pname] or cbt))..p..")" end
		tinsert(name, pname)
		tinsert(value, str[3]..str[1]..str[4]..str[2])
		tinsert(perc, 100*(varea/sortr))
	end
	return name, value, perc, strt
end

function DPSMate.Modules.EffectiveHealing:ShowTooltip(user, k)
	if DPSMateSettings["informativetooltips"] then
		local a,b,c = DPSMate.Modules.EffectiveHealing:EvalTable(DPSMateUser[user], k)
		local db = DPSMate:GetModeByArr(DPSMateEHealingTaken, k, "EHealingTaken")
		local abn, p, i = {}, 1, 1
		
		for cat, val in pairs(db) do
			if val[DPSMateUser[user][1]] then
				p = 0
				for _, va in pairs(val[DPSMateUser[user][1]]) do
					p = p + va[1]
				end
				if p>0 then
					i = 1
					while true do
						if (not abn[i]) then
							tinsert(abn, i, {cat, p})
							break
						else
							if (abn[i][2] < p) then
								tinsert(abn, i, {cat, p})
								break
							end
						end
						i = i + 1
					end
				end
			end
		end
		
		GameTooltip:AddLine(DPSMate.L["tttop"]..DPSMateSettings["subviewrows"]..DPSMate.L["tthealing"]..DPSMate.L["ttabilities"])
		for i=1, DPSMateSettings["subviewrows"] do
			if not a[i] then break end
			GameTooltip:AddDoubleLine(i..". "..DPSMate:GetAbilityById(a[i]),c[i].." ("..strformat("%.2f", 100*c[i]/b).."%)",1,1,1,1,1,1)
		end
		
		GameTooltip:AddLine(DPSMate.L["tttop"]..DPSMateSettings["subviewrows"]..DPSMate.L["tthealed"])
		for i=1, DPSMateSettings["subviewrows"] do
			if not abn[i] then break end
			GameTooltip:AddDoubleLine(i..". "..DPSMate:GetUserById(abn[i][1]), abn[i][2].." ("..strformat("%.2f", 100*abn[i][2]/b).."%)", 1,1,1,1,1,1)
		end
	end
end

function DPSMate.Modules.EffectiveHealing:OpenDetails(obj, key, bool)
	if bool then
		DPSMate.Modules.DetailsEHealing:UpdateCompare(obj, key, bool)
	else
		DPSMate.Modules.DetailsEHealing:UpdateDetails(obj, key)
	end
end

function DPSMate.Modules.EffectiveHealing:OpenTotalDetails(obj, key)
	DPSMate.Modules.DetailsEHealingTotal:UpdateDetails(obj, key)
end

