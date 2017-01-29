-- Global Variables
DPSMate.Modules.AurasGained = {}
DPSMate.Modules.AurasGained.Hist = "Auras"
DPSMate.Options.Options[1]["args"]["aurasgained"] = {
	order = 230,
	type = 'toggle',
	name = DPSMate.L["aurasgained"],
	desc = DPSMate.L["show"].." "..DPSMate.L["aurasgained"]..".",
	get = function() return DPSMateSettings["windows"][(DPSMate.Options.Dewdrop:GetOpenedParent() or DPSMate).Key or 1]["options"][1]["aurasgained"] end,
	set = function() DPSMate.Options:ToggleDrewDrop(1, "aurasgained", DPSMate.Options.Dewdrop:GetOpenedParent()) end,
}

-- Register the moodule
DPSMate:Register("aurasgained", DPSMate.Modules.AurasGained, DPSMate.L["aurasgained"])

local tinsert = table.insert
local strformat = string.format

function DPSMate.Modules.AurasGained:GetSortedTable(arr,k)
	local b, a, total = {}, {}, 0
	for cat, val in pairs(arr) do -- 2 Target
		if DPSMate:ApplyFilter(k, DPSMate:GetUserById(cat)) then
			local CV = 0
			for ca, va in pairs(val) do -- 3 ability
				for c, v in pairs(va) do -- 1 Ability
					if c==1 then
						for ce, ve in pairs(v) do
							CV=CV+1
						end
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

function DPSMate.Modules.AurasGained:EvalTable(user, k)
	local a, b, temp, total = {}, {}, {}, 0
	local arr = DPSMate:GetMode(k)
	for cat, val in pairs(arr[user[1]]) do -- 3 Ability
		local CV = 0
		for ca, va in pairs(val) do -- each one
			if ca==1 then
				for ce, ve in pairs(va) do
					CV=CV+1
				end
			end
		end
		if temp[cat] then temp[cat]=temp[cat]+CV else temp[cat]=CV end
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

function DPSMate.Modules.AurasGained:GetSettingValues(arr, cbt, k)
	local pt = ""

	local name, value, perc, sortedTable, total, a, p, strt = {}, {}, {}, {}, 0, 0, "", {[1]="",[2]=""}

	if DPSMateSettings["windows"][k]["numberformat"] == 2 or DPSMateSettings["windows"][k]["numberformat"] == 4 then p = "K"; pt="K" end
	sortedTable, total, a = DPSMate.Modules.AurasGained:GetSortedTable(arr,k)
	for cat, val in pairs(sortedTable) do
		local dmg, tot, sort = val, total, sortedTable[1]
		if dmg==0 then break end; if tot<=10000 then pt="" end
		local str = {[1]="",[2]="",[3]=""}
		if DPSMateSettings["columnsaurasgained"][1] then str[1] = " "..DPSMate:Commas(dmg, k)..p; strt[2] = DPSMate:Commas(tot, k)..pt end
		if DPSMateSettings["columnsaurasgained"][2] then str[3] = " ("..strformat("%.1f", 100*dmg/tot).."%)" end
		tinsert(name, DPSMate:GetUserById(a[cat]))
		tinsert(value, str[1]..str[3])
		tinsert(perc, 100*(dmg/sort))
	end
	return name, value, perc, strt
end

function DPSMate.Modules.AurasGained:ShowTooltip(user,k)
	if DPSMateSettings["informativetooltips"] then
		local a,b,c = DPSMate.Modules.AurasGained:EvalTable(DPSMateUser[user], k)
		GameTooltip:AddLine(DPSMate.L["tttop"]..DPSMateSettings["subviewrows"]..DPSMate.L["ttabilities"])
		for i=1, DPSMateSettings["subviewrows"] do
			if not a[i] then break end
			GameTooltip:AddDoubleLine(i..". "..DPSMate:GetAbilityById(a[i]),c[i].." ("..strformat("%.2f", 100*c[i]/b).."%)",1,1,1,1,1,1)
		end
	end
end

function DPSMate.Modules.AurasGained:OpenDetails(obj, key, bool)
	if bool then
		DPSMate.Modules.Auras:UpdateCompare(obj, key, bool)
	else
		DPSMate.Modules.Auras:UpdateDetails(obj, key)
	end
end

function DPSMate.Modules.AurasGained:OpenTotalDetails(obj, key)
	DPSMate.Modules.DetailsAurasTotal:UpdateDetails(obj, key)
end


