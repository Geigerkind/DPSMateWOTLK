-- Global Variables
DPSMate.Modules.Threat = {}
DPSMate.Modules.Threat.Hist = "Threat"
DPSMate.Options.Options[1]["args"]["threat"] = {
	order = 280,
	type = 'toggle',
	name = DPSMate.L["threat"],
	desc = DPSMate.L["show"].." "..DPSMate.L["threat"]..".",
	get = function() return DPSMateSettings["windows"][DPSMate.Options.Dewdrop:GetOpenedParent().Key or 1]["options"][1]["threat"] end,
	set = function() DPSMate.Options:ToggleDrewDrop(1, "threat", DPSMate.Options.Dewdrop:GetOpenedParent()) end,
}

-- Register the moodule
DPSMate:Register("threat", DPSMate.Modules.Threat, DPSMate.L["threat"])

local tinsert = table.insert
local strformat = string.format

function DPSMate.Modules.Threat:GetSortedTable(arr, k)
	local b, a, total = {}, {}, 0
	for cat, val in pairs(arr) do
		local CV = 0
		for ca, va in pairs(val) do
			for c, v in pairs(va) do
				CV = CV + v[1]
			end
		end
		local name = DPSMate:GetUserById(cat)
		local i = 1
		while true do
			if (not b[i]) then
				tinsert(b, i, CV)
				tinsert(a, i, name)
				break
			else
				if b[i] < CV then
					tinsert(b, i, CV)
					tinsert(a, i, name)
					break
				end
			end
			i=i+1
		end
		total = total + CV
	end
	return b, total, a
end

function DPSMate.Modules.Threat:EvalTable(user, k)
	local a,d, total = {}, {}, 0
	local arr = DPSMate:GetMode(k)
	if not arr[user[1]] then return end
	for cat, val in pairs(arr[user[1]]) do -- targets
		local CV, e, q = 0, {}, {}
		for ca, va in pairs(val) do -- ability
			CV = CV + va[1]
			local t = 1
			while true do
				if not e[t] then
					tinsert(e, t, va[1])
					tinsert(q, t, ca)
					break
				elseif e[t]<va[1] then
					tinsert(e, t, va[1])
					tinsert(q, t, ca)
					break
				end
				t = t + 1
			end
		end
		local i = 1
		while true do
			if not a[i] then
				tinsert(a, i, cat)
				tinsert(d, i, {CV, q, e})
				break
			elseif d[i][1]<CV then
				tinsert(a, i, cat)
				tinsert(d, i, {CV, q, e})
				break
			end
			i = i + 1
		end
		total = total + CV
	end
	return a, total, d
end

function DPSMate.Modules.Threat:GetSettingValues(arr, cbt, k,ecbt)
	local name, value, perc, sortedTable, total, a, p, strt = {}, {}, {}, {}, 0, 0, "", {[1]="",[2]=""}
	if DPSMateSettings["windows"][k]["numberformat"] == 2 then p = "K" end
	sortedTable, total, a = DPSMate.Modules.Threat:GetSortedTable(arr, k)
	for cat, val in pairs(sortedTable) do
		local dmg, tot, sort = DPSMate:FormatNumbers(val, total, sortedTable[1], k)
		if dmg==0 then break end
		local str = {[1]="",[2]="",[3]="",[4]=""}
		if DPSMateSettings["columnsthreat"][1] then str[1] = " "..strformat("%.2f", dmg)..p; strt[2] = strformat("%.2f", tot)..p end
		if DPSMateSettings["columnsthreat"][2] then str[2] = "("..strformat("%.1f", (dmg/cbt))..p..")"; strt[1] = "("..strformat("%.1f", (tot/cbt))..p..") " end
		if DPSMateSettings["columnsthreat"][3] then str[3] = " ("..strformat("%.1f", 100*dmg/tot).."%)" end
		if DPSMateSettings["columnsthreat"][4] then str[4] = " ("..strformat("%.1f", dmg/(ecbt[a[cat]] or cbt))..p..")" end
		tinsert(name, a[cat])
		tinsert(value, str[2]..str[1]..str[4]..str[3])
		tinsert(perc, 100*(dmg/sort))
	end
	return name, value, perc, strt
end

function DPSMate.Modules.Threat:ShowTooltip(user,k)
	local a,b,c = DPSMate.Modules.Threat:EvalTable(DPSMateUser[user], k)
	if DPSMateSettings["informativetooltips"] then
		for i=1, DPSMateSettings["subviewrows"] do
			if not a[i] then break end
			GameTooltip:AddDoubleLine(i..". "..DPSMate:GetUserById(a[i]),c[i][1].." ("..strformat("%.2f", 100*c[i][1]/b).."%)",1,1,1,1,1,1)
			for p=1, 3 do
				if not c[i][2][p] or c[i][3][p]==0 then break end
				GameTooltip:AddDoubleLine("       "..p..". "..DPSMate:GetAbilityById(c[i][2][p]),c[i][3][p].." ("..strformat("%.2f", 100*c[i][3][p]/a[i]).."%)",0.5,0.5,0.5,0.5,0.5,0.5)
			end
		end
	end
end

function DPSMate.Modules.Threat:OpenDetails(obj, key,bool)
	if bool then
		DPSMate.Modules.DetailsThreat:UpdateCompare(obj, key, bool)
	else
		DPSMate.Modules.DetailsThreat:UpdateDetails(obj, key)
	end
end

function DPSMate.Modules.Threat:OpenTotalDetails(obj, key)
	DPSMate.Modules.DetailsThreatTotal:UpdateDetails(obj, key)
end
