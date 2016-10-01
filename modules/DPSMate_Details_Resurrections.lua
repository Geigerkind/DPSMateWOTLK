-- Global Variables
DPSMate.Modules.DetailsRezz = {}

-- Local variables
local DetailsUser, DetailsUserComp = "", ""
local curKey = 1
local db, cbt = {}, 0
local Buffpos, BuffposComp = 0, 0
local _G = getglobal
local tinsert = table.insert
local strformat = string.format

function DPSMate.Modules.DetailsRezz:UpdateDetails(obj, key)
	DPSMate_Details_CompareRezz:Hide()
	
	curKey = key
	db, cbt = DPSMate:GetMode(key)
	DetailsUser = obj.user
	DetailsUserComp = nil
	DPSMate_Details_Rezz_Title:SetText(DPSMate.L["rezzof"]..obj.user)
	Buffpos = 0
	self:CleanTables("")
	self:UpdateBuffs(0, "")
	DPSMate_Details_Rezz:Show()
	
	DPSMate_Details_Rezz:SetScale((DPSMateSettings["targetscale"] or 0.58)/UIParent:GetScale())
end

function DPSMate.Modules.DetailsRezz:UpdateCompare(obj, key, comp)
	self:UpdateDetails(obj, key)

	DetailsUserComp = comp
	DPSMate_Details_CompareRezz_Title:SetText(DPSMate.L["rezzof"]..comp)
	BuffposComp = 0
	self:CleanTables("Compare")
	self:UpdateBuffs(0, "Compare")
	DPSMate_Details_CompareRezz:Show()
end

function DPSMate.Modules.DetailsRezz:CreateGraphTable(obj)
	local lines = {}
	for i=1, 6 do
		-- Horizontal
		DPSMate.Options.graph:DrawLine(obj, 5, 223-i*30, 345, 223-i*30, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
	end
	-- Vertical
	DPSMate.Options.graph:DrawLine(obj, 80, 215, 80, 15, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
end

function DPSMate.Modules.DetailsRezz:CleanTables(comp)
	local path = "DPSMate_Details_"..comp.."Rezz_Buffs_Row"
	for i=1, 6 do
		--_G(path..i.."_Icon"):SetTexture()
		_G(path..i.."_Name"):SetText()
		_G(path..i.."_Count"):SetText()
	end
end

function DPSMate.Modules.DetailsRezz:Replace(text)
	local a,b = strfind(text, "%(")
	if a and b then
		return strsub(text, 1, a-1)
	end
	return text
end

function DPSMate.Modules.DetailsRezz:GetTable(user, key)
	local a,b = {}, {}
	for cat, val in pairs(db[user[1]]) do -- targets
		local name = DPSMate:GetUserById(cat)
		for ca, va in pairs(val) do -- rezzes
			local i = 1
			while true do
				if (not a[i]) then
					tinsert(a, i, va[1])
					tinsert(b, i, name)
					break
				elseif a[i] < va[1] then
					tinsert(a, i, va[1])
					tinsert(b, i, name)
					break
				end
				i=i+1
			end
		end
	end
	return a,b
end

function DPSMate.Modules.DetailsRezz:UpdateBuffs(arg1, comp, cname)
	if comp~="" and comp then
		cname = DetailsUserComp
	end
	local a,b = self:GetTable(DPSMateUser[cname or DetailsUser], curKey)
	local t1TL = DPSMate:TableLength(a)-6
	local path = "DPSMate_Details_"..comp.."Rezz_Buffs_Row"
	if comp~="" and comp then
		BuffposComp=BuffposComp-(arg1 or 0)
		if BuffposComp<0 then BuffposComp = 0 end
		if BuffposComp>t1TL then BuffposComp = t1TL end
		if t1TL<0 then BuffposComp = 0 end
		for i=1, 6 do
			local pos = BuffposComp + i
			if not a[pos] then break end
			--_G(path..i).id = c[pos]
			--_G(path..i.."_Icon"):SetTexture(DPSMate:GetSpellIcon(self:Replace(ab)))
			_G(path..i.."_Name"):SetText(strformat("%.2f", a[pos]).."s")
			_G(path..i.."_Count"):SetText(b[pos])
		end
	else
		Buffpos=Buffpos-(arg1 or 0)
		if Buffpos<0 then Buffpos = 0 end
		if Buffpos>t1TL then Buffpos = t1TL end
		if t1TL<0 then Buffpos = 0 end
		for i=1, 6 do
			local pos = Buffpos + i
			if not a[pos] then break end
			--local ab = DPSMate:GetAbilityById(c[pos])
			--_G(path..i).id = c[pos]
			--_G(path..i.."_Icon"):SetTexture(DPSMate:GetSpellIcon(self:Replace(ab)))
			_G(path..i.."_Name"):SetText(strformat("%.2f", a[pos]).."s")
			_G(path..i.."_Count"):SetText(b[pos])
		end
	end
end
