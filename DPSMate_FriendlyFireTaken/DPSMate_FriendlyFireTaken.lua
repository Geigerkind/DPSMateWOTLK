-- Global Variables
DPSMate.Modules.FriendlyFireTaken = {}
DPSMate.Modules.FriendlyFireTaken.Hist = "EDTaken"
DPSMate.Options.Options[1]["args"]["friendlyfiretaken"] = {
	order = 261,
	type = 'toggle',
	name = DPSMate.L["friendlyfiretaken"],
	desc = DPSMate.L["show"].." "..DPSMate.L["friendlyfiretaken"]..".",
	get = function() return DPSMateSettings["windows"][(DPSMate.Options.Dewdrop:GetOpenedParent() or DPSMate).Key or 1]["options"][1]["friendlyfiretaken"] end,
	set = function() DPSMate.Options:ToggleDrewDrop(1, "friendlyfiretaken", DPSMate.Options.Dewdrop:GetOpenedParent()) end,
}

-- Register the moodule
DPSMate:Register("friendlyfiretaken", DPSMate.Modules.FriendlyFireTaken, DPSMate.L["friendlyfiretaken"])

local tinsert = table.insert
local strformat = string.format

function DPSMate.Modules.FriendlyFireTaken:GetSortedTable(arr,k)
	local b, a, total = {}, {}, 0
	for c, v in pairs(arr) do
		local cName = DPSMate:GetUserById(c)
		local CV = 0
		for cat, val in pairs(v) do
			local catName = DPSMate:GetUserById(cat)
			if DPSMate:ApplyFilter(k, catName) and DPSMateUser[catName] and DPSMateUser[cName] then
				if DPSMateUser[cName][3] == DPSMateUser[catName][3] and DPSMateUser[catName][3] and DPSMateUser[cName][3] then
					CV = CV + val["i"]
				end
			end
		end
		if CV > 0 then
			local i = 1
			while true do
				if (not b[i]) then
					tinsert(b, i, CV)
					tinsert(a, i, c)
					break
				else
					if b[i] < CV then
						tinsert(b, i, CV)
						tinsert(a, i, c)
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

function DPSMate.Modules.FriendlyFireTaken:EvalTable(user, k)
	local a, d, total, temp = {}, {}, 0, {}
	local arr = DPSMate:GetMode(k)
	if not arr[user[1]] then return end
	for c, v in pairs(arr[user[1]]) do
		local cName = DPSMate:GetUserById(c)
		local CV = 0
		local aa,bb = {}, {}
		if DPSMateUser[cName][3] == user[3] and DPSMateUser[cName][3] then
			for cat, val in pairs(v) do
				if cat~="i" then 
					local i = 1
					while true do
						if (not bb[i]) then
							tinsert(bb, i, val[13])
							tinsert(aa, i, cat)
							break
						else
							if bb[i] < val[13] then
								tinsert(bb, i, val[13])
								tinsert(aa, i, cat)
								break
							end
						end
						i=i+1
					end
					CV = CV + val[13]
				end
			end
		end
		if CV > 0 then
			local i = 1
			while true do
				if (not d[i]) then
					tinsert(d, i, {CV, aa, bb})
					tinsert(a, i, c)
					break
				else
					if d[i][1] < CV then
						tinsert(d, i, {CV, aa, bb})
						tinsert(a, i, c)
						break
					end
				end
				i=i+1
			end
			total = total + CV
		end
	end
	return a, total, d
end

function DPSMate.Modules.FriendlyFireTaken:GetSettingValues(arr, cbt, k,ecbt)
	local pt = ""

	local name, value, perc, sortedTable, total, a, p, strt = {}, {}, {}, {}, 0, 0, "", {[1]="",[2]=""}
	if DPSMateSettings["windows"][k]["numberformat"] == 2 or DPSMateSettings["windows"][k]["numberformat"] == 4 then p = "K"; pt="K" end
	sortedTable, total, a = DPSMate.Modules.FriendlyFireTaken:GetSortedTable(arr,k)
	for cat, val in pairs(sortedTable) do
		local dmg, tot, sort, dmgr, totr, sortr = DPSMate:FormatNumbers(val, total, sortedTable[1], k)
		if dmg==0 then break end; if totr<=10000 then pt="" end; if dmgr<=10000 then p="" end
		local str = {[1]="",[2]="",[3]="",[4]=""}
		local pname = a[cat]
		if DPSMateSettings["columnsfriendlyfiretaken"][1] then str[1] = " "..DPSMate:Commas(dmg, k)..p; strt[2] = " "..DPSMate:Commas(tot, k)..pt end
		if DPSMateSettings["columnsfriendlyfiretaken"][3] then str[2] = " ("..strformat("%.1f", 100*dmgr/totr).."%)" end
		if DPSMateSettings["columnsfriendlyfiretaken"][2] then str[3] = "("..strformat("%.1f", dmg/cbt)..")"; strt[1] = "("..strformat("%.1f", tot/cbt)..pt..")" end
		if DPSMateSettings["columnsfriendlyfiretaken"][4] then str[4] = " ("..strformat("%.1f", dmg/(ecbt[pname] or cbt))..p..")" end
		tinsert(name, pname)
		tinsert(value, str[3]..str[1]..str[4]..str[2])
		tinsert(perc, 100*(dmgr/sortr))
	end
	return name, value, perc, strt
end

function DPSMate.Modules.FriendlyFireTaken:ShowTooltip(user, k)
	if DPSMateSettings["informativetooltips"] then
		local a,b,c = DPSMate.Modules.FriendlyFireTaken:EvalTable(DPSMateUser[user], k)
		local ab, abn, p, i = {}, {}, 1, 1
		
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
			end
		end
		ab = nil
		
		GameTooltip:AddLine(DPSMate.L["tttop"]..DPSMateSettings["subviewrows"]..DPSMate.L["ttdamage"]..DPSMate.L["ttabilities"])
		for i=1, DPSMateSettings["subviewrows"] do
			if not abn[i] then break end
			GameTooltip:AddDoubleLine(i..". "..DPSMate:GetAbilityById(abn[i][1]), abn[i][2].." ("..strformat("%.2f", 100*abn[i][2]/b).."%)", 1,1,1,1,1,1)
		end
		
		GameTooltip:AddLine(DPSMate.L["tttop"]..DPSMateSettings["subviewrows"]..DPSMate.L["ttattacked"])
		for i=1, DPSMateSettings["subviewrows"] do
			if not a[i] then break end
			GameTooltip:AddDoubleLine(i..". "..DPSMate:GetUserById(a[i]),c[i][1].." ("..strformat("%.2f", 100*c[i][1]/b).."%)",1,1,1,1,1,1)
		end
	end
end

function DPSMate.Modules.FriendlyFireTaken:OpenDetails(obj, key, bool)
	if bool then
		DPSMate.Modules.DetailsFFT:UpdateCompare(obj, key, bool)
	else
		DPSMate.Modules.DetailsFFT:UpdateDetails(obj, key)
	end
end

function DPSMate.Modules.FriendlyFireTaken:OpenTotalDetails(obj, key)
	DPSMate.Modules.DetailsFFTTotal:UpdateDetails(obj, key)
end

