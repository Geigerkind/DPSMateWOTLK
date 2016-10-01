-- Global Variables
DPSMate.Modules.CurePoison = {}
DPSMate.Modules.CurePoison.Hist = "Dispels"
DPSMate.Options.Options[1]["args"]["curepoison"] = {
	order = 210,
	type = 'toggle',
	name = DPSMate.L["curepoison"],
	desc = DPSMate.L["show"].." "..DPSMate.L["curepoison"]..".",
	get = function() return DPSMateSettings["windows"][(DPSMate.Options.Dewdrop:GetOpenedParent() or DPSMate).Key or 1]["options"][1]["curepoison"] end,
	set = function() DPSMate.Options:ToggleDrewDrop(1, "curepoison", DPSMate.Options.Dewdrop:GetOpenedParent()) end,
}

-- Register the moodule
DPSMate:Register("curepoison", DPSMate.Modules.CurePoison, DPSMate.L["curepoison"])

local tinsert = table.insert
local strformat = string.format

function DPSMate.Modules.CurePoison:IsValid(ab, cast)
	if DPSMateAbility[ab][2]==DPSMate.L["poison"] or (DPSMate.Parser.DePoison[cast] and DPSMateAbility[ab][2]=="") or (DPSMate.Parser.DePoison[cast] and DPSMateAbility[ab][2]==DPSMate.L["poison"]) then
		return true
	end
	return false
end

function DPSMate.Modules.CurePoison:GetSortedTable(arr,k)
	local b, a, total = {}, {}, 0
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
	return b, total, a
end

function DPSMate.Modules.CurePoison:EvalTable(user, k)
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

function DPSMate.Modules.CurePoison:GetSettingValues(arr, cbt, k)
	local name, value, perc, sortedTable, total, a, p, strt = {}, {}, {}, {}, 0, 0, "", {[1]="",[2]=""}
	
	sortedTable, total, a = DPSMate.Modules.CurePoison:GetSortedTable(arr,k)
	for cat, val in pairs(sortedTable) do
		local dmg, tot, sort = val, total, sortedTable[1]
		if dmg==0 then break end
		local str = {[1]="",[2]="",[3]=""}
		if DPSMateSettings["columnspoison"][1] then str[1] = " "..DPSMate:Commas(dmg, k)..p; strt[2] = " "..DPSMate:Commas(tot, k)..p end
		if DPSMateSettings["columnspoison"][2] then str[3] = " ("..strformat("%.1f", 100*dmg/tot).."%)" end
		tinsert(name, DPSMate:GetUserById(a[cat]))
		tinsert(value, str[1]..str[3])
		tinsert(perc, 100*(dmg/sort))
	end
	return name, value, perc, strt
end

function DPSMate.Modules.CurePoison:ShowTooltip(user,k)
	local a,b,c = DPSMate.Modules.CurePoison:EvalTable(DPSMateUser[user], k)
	if DPSMateSettings["informativetooltips"] then
		for i=1, DPSMateSettings["subviewrows"] do
			if not a[i] then break end
			GameTooltip:AddDoubleLine(i..". "..DPSMate:GetAbilityById(a[i]),c[i].." ("..strformat("%.2f", 100*c[i]/b).."%)",1,1,1,1,1,1)
		end
	end
end

function DPSMate.Modules.CurePoison:OpenDetails(obj, key,bool)
	if bool then
		DPSMate.Modules.DetailsCurePoison:UpdateCompare(obj, key, bool)
	else
		DPSMate.Modules.DetailsCurePoison:UpdateDetails(obj, key)
	end
end

function DPSMate.Modules.CurePoison:OpenTotalDetails(obj, key)
	DPSMate.Modules.DetailsCurePoisonTotal:UpdateDetails(obj, key)
end

