-- Global Variables
DPSMate.Modules.Rezz = {}
DPSMate.Modules.Rezz.Hist = "Rezz"
DPSMate.Options.Options[1]["args"]["rezz"] = {
	order = 500,
	type = 'toggle',
	name = DPSMate.L["rezz"],
	desc = DPSMate.L["show"].." "..DPSMate.L["rezz"]..".",
	get = function() return DPSMateSettings["windows"][(DPSMate.Options.Dewdrop:GetOpenedParent() or DPSMate).Key or 1]["options"][1]["rezz"] end,
	set = function() DPSMate.Options:ToggleDrewDrop(1, "rezz", DPSMate.Options.Dewdrop:GetOpenedParent()) end,
}

-- Register the moodule
DPSMate:Register("rezz", DPSMate.Modules.Rezz, DPSMate.L["rezz"])

local tinsert = table.insert
local strformat = string.format

function DPSMate.Modules.Rezz:GetSortedTable(arr, k)
	local b, a, total = {}, {}, 0
	local temp = {}
	for cat, val in pairs(arr) do -- owner
		local name = DPSMate:GetUserById(cat)
		if DPSMate:ApplyFilter(k, name) then
			local CV = 0
			for ca, va in pairs(val) do
				CV = CV + DPSMate:TableLength(va)
			end
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
	end
	return b, total, a
end

function DPSMate.Modules.Rezz:EvalTable(user, k)
	local b, a, total = {}, {}, 0
	local temp = {}
	local arr = DPSMate:GetMode(k)
	if not arr[user[1]] then return end
	for c, v in pairs(arr[user[1]]) do
		local ab = DPSMate:GetUserById(c)
		if temp[ab] then
			temp[ab] = temp[ab] + DPSMate:TableLength(v)
		else
			temp[ab] = DPSMate:TableLength(v)
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
	return b, total, a
end

function DPSMate.Modules.Rezz:GetSettingValues(arr, cbt, k)
	local name, value, perc, sortedTable, total, a, p, strt = {}, {}, {}, {}, 0, 0, "", {[1]="",[2]=""}
	
	sortedTable, total, a = DPSMate.Modules.Rezz:GetSortedTable(arr, k)
	for cat, val in pairs(sortedTable) do
		local dmg, tot, sort = val, total, sortedTable[1]
		if dmg==0 then break end
		local str = {[1]="",[2]="",[3]=""}
		if DPSMateSettings["columnsrezz"][1] then str[1] = " "..DPSMate:Commas(dmg, k)..p; strt[2] = DPSMate:Commas(tot, k)..p end
		if DPSMateSettings["columnsrezz"][2] then str[3] = " ("..strformat("%.1f", 100*dmg/tot).."%)" end
		tinsert(name, a[cat])
		tinsert(value, str[2]..str[1]..str[3])
		tinsert(perc, 100*(dmg/sort))
	end
	return name, value, perc, strt
end

function DPSMate.Modules.Rezz:ShowTooltip(user,k)
	local a,b,c = DPSMate.Modules.Rezz:EvalTable(DPSMateUser[user], k)
	if DPSMateSettings["informativetooltips"] then
		for i=1, DPSMateSettings["subviewrows"] do
			if not c[i] then break end
			GameTooltip:AddDoubleLine(i..". "..c[i],a[i].." ("..strformat("%.2f", 100*a[i]/b).."%)",1,1,1,1,1,1)
		end
	end
end

function DPSMate.Modules.Rezz:OpenDetails(obj, key, bool)
	if bool then
		DPSMate.Modules.DetailsRezz:UpdateCompare(obj, key, bool)
	else
		DPSMate.Modules.DetailsRezz:UpdateDetails(obj, key)
	end
end

function DPSMate.Modules.Rezz:OpenTotalDetails(obj, key)
	DPSMate.Modules.DetailsRezzTotal:UpdateDetails(obj, key)
end
