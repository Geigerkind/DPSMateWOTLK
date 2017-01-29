-- Global Variables
DPSMate.Modules.DetailsRezzTotal = {}

-- Local variables
local curKey = 1
local db, cbt = {}, 0
local Buffpos = 0
local _G = getglobal
local tinsert = table.insert
local DetailsArr = {}
local DetailsArr2 = {}
local DetailsArr3 = {}
local TL = 0
local strformat = string.format

function DPSMate.Modules.DetailsRezzTotal:UpdateDetails(obj, key)
	curKey = key
	db, cbt = DPSMate:GetMode(key)
	DPSMate_Details_RezzTotal_Title:SetText(DPSMate.L["rezzsum"])
	Buffpos = 0
	DetailsArr,DetailsArr2, DetailsArr3 = self:EvalTable()
	TL = DPSMate:TableLength(DetailsArr)-6
	self:CleanTables()
	self:UpdateBuffs(0)
	DPSMate_Details_RezzTotal:Show()
	
	DPSMate_Details_RezzTotal:SetScale((DPSMateSettings["targetscale"] or 0.58)/UIParent:GetScale())
end

function DPSMate.Modules.DetailsRezzTotal:EvalTable()
	local a,b,ce = {}, {},{}
	for cat, val in pairs(db) do -- owner
		local user = DPSMate:GetUserById(cat)
		if DPSMate:ApplyFilter(curKey, user) then
			for ca, va in pairs(val) do -- targets
				local name = DPSMate:GetUserById(ca)
				for c, v in pairs(va) do -- rezzes
					local i = 1
					while true do
						if (not a[i]) then
							tinsert(a, i, v[1])
							tinsert(b, i, name)
							tinsert(ce, i, user)
							break
						elseif a[i] < v[1] then
							tinsert(a, i, v[1])
							tinsert(b, i, name)
							tinsert(ce, i, user)
							break
						end
						i=i+1
					end
				end
			end
		end
	end
	return a,b,ce
end

function DPSMate.Modules.DetailsRezzTotal:CreateGraphTable(obj)
	local lines = {}
	for i=1, 6 do
		-- Horizontal
		DPSMate.Options.graph:DrawLine(obj, 5, 223-i*30, 345, 223-i*30, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
	end
	-- Vertical
	DPSMate.Options.graph:DrawLine(obj, 80, 215, 80, 15, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
	DPSMate.Options.graph:DrawLine(obj, 195, 215, 195, 15, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
end

function DPSMate.Modules.DetailsRezzTotal:CleanTables(comp)
	local path = "DPSMate_Details_RezzTotal_Buffs_Row"
	for i=1, 6 do
		--_G(path..i.."_Icon"):SetTexture()
		_G(path..i.."_Name"):SetText()
		_G(path..i.."_Count"):SetText()
		_G(path..i.."_Count2"):SetText()
	end
end

function DPSMate.Modules.DetailsRezzTotal:Replace(text)
	local a,b = strfind(text, "%(")
	if a and b then
		return strsub(text, 1, a-1)
	end
	return text
end

function DPSMate.Modules.DetailsRezzTotal:UpdateBuffs(arg1, comp, cname)
	local path = "DPSMate_Details_RezzTotal_Buffs_Row"
	Buffpos=Buffpos-(arg1 or 0)
	if Buffpos<0 then Buffpos = 0 end
	if Buffpos>TL then Buffpos = TL end
	if TL<0 then Buffpos = 0 end
	for i=1, 6 do
		local pos = Buffpos + i
		if not DetailsArr[pos] then break end
		--local ab = DPSMate:GetAbilityById(DetailsArr[pos][2])
		--_G(path..i.."_Icon"):SetTexture(DPSMate:GetSpellIcon(self:Replace(ab)))
		_G(path..i.."_Name"):SetText(strformat("%.2f", DetailsArr[pos]).."s")
		_G(path..i.."_Count"):SetText(DetailsArr2[pos])
		_G(path..i.."_Count2"):SetText(DetailsArr3[pos])
	end
end
