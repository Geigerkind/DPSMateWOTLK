-- Global Variables
DPSMate.Modules.CureDisease = {}
DPSMate.Modules.CureDisease.Hist = "Dispels"
DPSMate.Options.Options[1]["args"]["curedisease"] = {
	order = 200,
	type = 'toggle',
	name = DPSMate.L["curedisease"],
	desc = DPSMate.L["show"].." "..DPSMate.L["curedisease"]..".",
	get = function() return DPSMateSettings["windows"][(DPSMate.Options.Dewdrop:GetOpenedParent() or DPSMate).Key or 1]["options"][1]["curedisease"] end,
	set = function() DPSMate.Options:ToggleDrewDrop(1, "curedisease", DPSMate.Options.Dewdrop:GetOpenedParent()) end,
}

-- Register the moodule
DPSMate:Register("curedisease", DPSMate.Modules.CureDisease, DPSMate.L["curedisease"])

local tinsert = table.insert
local strformat = string.format

function DPSMate.Modules.CureDisease:IsValid(ab, cast)
	if DPSMateAbility[ab][2]==DPSMate.L["disease"] or (DPSMate.Parser.DeDisease[cast] and DPSMateAbility[ab][2]=="") or (DPSMate.Parser.DeDisease[cast] and DPSMateAbility[ab][2]==DPSMate.L["disease"]) then
		return true
	end
	return false
end

function DPSMate.Modules.CureDisease:GetSortedTable(arr,k)
	local b, a, total = {}, {}, 0
	if arr then
		for cat, val in pairs(arr) do -- 3 Owner
			if DPSMate:ApplyFilter(k, DPSMate:GetUserById(cat)) then
				local CV = 0
				for ca, va in pairs(val) do -- 42 Ability
					if ca~="i" then
						for c, v in pairs(va) do -- 3 Target
							for ce, ve in pairs(v) do -- 10 Cured Ability
								if self:IsValid(DPSMate:GetAbilityById(ce), DPSMate:GetAbilityById(ca)) then
									CV=CV+ve
								end
							end
						end
					end
				end
				if CV>0 then
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
		end
	end
	return b, total, a
end

function DPSMate.Modules.CureDisease:EvalTable(user, k)
	local a, b, total, temp = {}, {}, 0, {}
	local arr = DPSMate:GetMode(k)
	if not arr[user[1]] then return end
	for cat, val in pairs(arr[user[1]]) do -- 41 Ability
		if cat~="i" then
			for ca, va in pairs(val) do -- 3 Target
				for c, v in pairs(va) do -- 10 Cured Ability
					if self:IsValid(DPSMate:GetAbilityById(c), DPSMate:GetAbilityById(cat)) then
						if temp[c] then temp[c]=temp[c]+v else temp[c]=v end
					end
				end
			end
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

function DPSMate.Modules.CureDisease:GetSettingValues(arr, cbt, k)
	local pt = ""

	local name, value, perc, sortedTable, total, a, p, strt = {}, {}, {}, {}, 0, 0, "", {[1]="",[2]=""}

	if DPSMateSettings["windows"][k]["numberformat"] == 2 or DPSMateSettings["windows"][k]["numberformat"] == 4 then p = "K"; pt="K" end
	sortedTable, total, a = DPSMate.Modules.CureDisease:GetSortedTable(arr,k)
	for cat, val in pairs(sortedTable) do
		local dmg, tot, sort = val, total, sortedTable[1]
		if dmg==0 then break end; if tot<=10000 then pt="" end
		local str = {[1]="",[2]="",[3]=""}
		if DPSMateSettings["columnsdisease"][1] then str[1] = " "..DPSMate:Commas(dmg, k)..p; strt[2] = " "..DPSMate:Commas(tot, k)..pt end
		if DPSMateSettings["columnsdisease"][2] then str[3] = " ("..strformat("%.1f", 100*dmg/tot).."%)" end
		tinsert(name, DPSMate:GetUserById(a[cat]))
		tinsert(value, str[1]..str[3])
		tinsert(perc, 100*(dmg/sort))
	end
	return name, value, perc, strt
end

function DPSMate.Modules.CureDisease:ShowTooltip(user,k)
	if DPSMateSettings["informativetooltips"] then
		local p, sum = 0, 0
		local a, b, abn, abnt = {}, {}, {}, {}
		local arr = DPSMate:GetMode(k)
		if arr[DPSMateUser[user][1]] then 
			for cat, val in pairs(arr[DPSMateUser[user][1]]) do -- 41 Ability
				if cat~="i" then
					for ca, va in pairs(val) do -- Cleansed guy
						for c, v in pairs(va) do -- Cleansed ability
							if self:IsValid(DPSMate:GetAbilityById(c), DPSMate:GetAbilityById(cat)) then
								if b[c] then b[c] = b[c] + v else b[c] = v end
								if a[ca] then a[ca] = a[ca] + v else a[ca] = v end
							end
						end
					end
				end
			end
		end
		
		for cat, val in pairs(a) do
			i = 1
			while true do
				if not abn[i] then
					tinsert(abn, i, {cat, val})
					break
				else
					if abn[i][2]<val then
						tinsert(abn, i, {cat, val})
						break
					end
				end
				i = i + 1
			end
		end
		for cat, val in pairs(b) do
			i = 1
			while true do
				if not abnt[i] then
					tinsert(abnt, i, {cat, val})
					break
				else
					if abnt[i][2]<val then
						tinsert(abnt, i, {cat, val})
						break
					end
				end
				i = i + 1
			end
			sum = sum + val
		end
		a = nil
		b = nil
		
		GameTooltip:AddLine(DPSMate.L["tttop"]..DPSMateSettings["subviewrows"]..DPSMate.L["ttdispelled"]..DPSMate.L["ttabilities"])
		for i=1, DPSMateSettings["subviewrows"] do
			if not abnt[i] then break end
			GameTooltip:AddDoubleLine(i..". "..DPSMate:GetAbilityById(abnt[i][1]),abnt[i][2].." ("..strformat("%.2f", 100*abnt[i][2]/sum).."%)",1,1,1,1,1,1)
		end
		
		GameTooltip:AddLine(DPSMate.L["tttop"]..DPSMateSettings["subviewrows"]..DPSMate.L["ttdispelled"])
		for i=1, DPSMateSettings["subviewrows"] do
			if not abn[i] then break end
			GameTooltip:AddDoubleLine(i..". "..DPSMate:GetUserById(abn[i][1]), abn[i][2].." ("..strformat("%.2f", 100*abn[i][2]/sum).."%)", 1,1,1,1,1,1)
		end
	end
end

function DPSMate.Modules.CureDisease:OpenDetails(obj, key, bool)
	if bool then
		DPSMate.Modules.DetailsCureDisease:UpdateCompare(obj, key, bool)
	else
		DPSMate.Modules.DetailsCureDisease:UpdateDetails(obj, key)
	end
end

function DPSMate.Modules.CureDisease:OpenTotalDetails(obj, key)
	DPSMate.Modules.DetailsCureDiseaseTotal:UpdateDetails(obj, key)
end

