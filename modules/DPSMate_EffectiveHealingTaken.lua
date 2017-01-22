-- Global Variables
DPSMate.Modules.EffectiveHealingTaken = {}
DPSMate.Modules.EffectiveHealingTaken.Hist = "EHealingTaken"
DPSMate.Options.Options[1]["args"]["effectivehealingtaken"] = {
	order = 95,
	type = 'toggle',
	name = DPSMate.L["effectivehealingtaken"],
	desc = DPSMate.L["show"].." "..DPSMate.L["effectivehealingtaken"]..".",
	get = function() return DPSMateSettings["windows"][(DPSMate.Options.Dewdrop:GetOpenedParent() or DPSMate).Key or 1]["options"][1]["effectivehealingtaken"] end,
	set = function() DPSMate.Options:ToggleDrewDrop(1, "effectivehealingtaken", DPSMate.Options.Dewdrop:GetOpenedParent()) end,
}

-- Register the moodule
DPSMate:Register("effectivehealingtaken", DPSMate.Modules.EffectiveHealingTaken, DPSMate.L["effectivehealingtaken"])

local tinsert = table.insert
local strformat = string.format

function DPSMate.Modules.EffectiveHealingTaken:GetSortedTable(arr,k)
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

function DPSMate.Modules.EffectiveHealingTaken:EvalTable(user, k)
	local a, d, total = {}, {}, 0
	local arr = DPSMate:GetMode(k)
	if arr[user[1]] then
		for cat, val in pairs(arr[user[1]]) do
			if cat~="i" then
				local CV, ta, tb = 0, {}, {}
				for ca, va in pairs(val) do
					CV=CV+va[1]
					local i = 1
					while true do
						if (not tb[i]) then
							tinsert(ta, i, ca)
							tinsert(tb, i, va[1])
							break
						else
							if (tb[i] < va[1]) then
								tinsert(ta, i, ca)
								tinsert(tb, i, va[1])
								break
							end
						end
						i = i + 1
					end
				end
				local i = 1
				while true do
					if (not d[i]) then
						tinsert(a, i, cat)
						tinsert(d, i, {CV, ta, tb})
						break
					else
						if (d[i][1] < CV) then
							tinsert(a, i, cat)
							tinsert(d, i, {CV, ta, tb})
							break
						end
					end
					i = i + 1
				end
			end
			total=total+arr[user[1]]["i"]
		end
	end
	return a, total, d
end

function DPSMate.Modules.EffectiveHealingTaken:GetSettingValues(arr, cbt, k,ecbt)
	local pt = ""

	local name, value, perc, sortedTable, total, a, p, strt = {}, {}, {}, {}, 0, 0, "", {[1]="",[2]=""}
	if DPSMateSettings["windows"][k]["numberformat"] == 2 or DPSMateSettings["windows"][k]["numberformat"] == 4 then p = "K"; pt="K" end
	sortedTable, total, a = DPSMate.Modules.EffectiveHealingTaken:GetSortedTable(arr,k)
	for cat, val in pairs(sortedTable) do
		local va, tot, sort, varea, totr, sortr = DPSMate:FormatNumbers(val, total, sortedTable[1], k)
		if varea==0 then break end; if totr<=10000 then pt="" end; if varea<=10000 then p="" end
		local str = {[1]="",[2]="",[3]="",[4]=""}
		local pname = DPSMate:GetUserById(a[cat])
		if DPSMateSettings["columnsehealingtaken"][1] then str[1] = " "..DPSMate:Commas(va, k)..p; strt[2] = " "..DPSMate:Commas(tot, k)..pt end
		if DPSMateSettings["columnsehealingtaken"][3] then str[2] = " ("..strformat("%.1f", 100*varea/totr).."%)" end
		if DPSMateSettings["columnsehealingtaken"][2] then str[3] = " ("..strformat("%.1f", va/cbt)..")"; strt[1] = " ("..strformat("%.1f", tot/cbt)..pt..")" end
		if DPSMateSettings["columnsehealingtaken"][4] then str[4] = " ("..strformat("%.1f", va/(ecbt[pname] or cbt))..p..")" end
		tinsert(name, pname)
		tinsert(value, str[3]..str[1]..str[4]..str[2])
		tinsert(perc, 100*(varea/sortr))
	end
	return name, value, perc, strt
end

function DPSMate.Modules.EffectiveHealingTaken:ShowTooltip(user, k)
	if DPSMateSettings["informativetooltips"] then
		local a,b,c = DPSMate.Modules.EffectiveHealingTaken:EvalTable(DPSMateUser[user], k)
		local ab, abn, p, i = {}, {}, 1, 1
		b = 0
		
		while a[i] do
			p = 1
			while c[i][2][p] do
				if ab[c[i][2][p]] then
					ab[c[i][2][p]] = ab[c[i][2][p]] + c[i][3][p]
				else
					ab[c[i][2][p]] = c[i][3][p]
				end
				p = p + 1
			end
			i = i + 1
		end
		for cat, val in pairs(ab) do
			if val>0 then
				i = 1
				while true do
					if (not abn[i]) then
						tinsert(abn, i, {cat, val})
						break
					else
						if (abn[i][2] < val) then
							tinsert(abn, i, {cat, val})
							break
						end
					end
					i = i + 1
				end
				b = b + val
			end
		end
		ab = nil
		
		GameTooltip:AddLine(DPSMate.L["tttop"]..DPSMateSettings["subviewrows"]..DPSMate.L["tthealing"]..DPSMate.L["ttabilities"])
		for i=1, DPSMateSettings["subviewrows"] do
			if not abn[i] then break end
			GameTooltip:AddDoubleLine(i..". "..DPSMate:GetAbilityById(abn[i][1]), abn[i][2].." ("..strformat("%.2f", 100*abn[i][2]/b).."%)", 1,1,1,1,1,1)
		end
		
		GameTooltip:AddLine(DPSMate.L["tttop"]..DPSMateSettings["subviewrows"]..DPSMate.L["tthealed"])
		for i=1, DPSMateSettings["subviewrows"] do
			if not a[i] then break end
			GameTooltip:AddDoubleLine(i..". "..DPSMate:GetUserById(a[i]),c[i][1].." ("..strformat("%.2f", 100*c[i][1]/b).."%)",1,1,1,1,1,1)
		end
	end
end

function DPSMate.Modules.EffectiveHealingTaken:OpenDetails(obj, key, bool)
	if bool then
		DPSMate.Modules.DetailsEHealingTaken:UpdateCompare(obj, key, bool)
	else
		DPSMate.Modules.DetailsEHealingTaken:UpdateDetails(obj, key)
	end
end

function DPSMate.Modules.EffectiveHealingTaken:OpenTotalDetails(obj, key)
	DPSMate.Modules.DetailsEHealingTakenTotal:UpdateDetails(obj, key)
end

