-- Global Variables
DPSMate.Modules.Auras = {}

-- Local variables
local DetailsUser = ""
local g, g2
local curKey = 1
local db, cbt = {}, 0
local Buffpos, Debuffpos = 0, 0
local BuffposComp, DebuffposComp = 0, 0
local t1, t2, t3, t4
local t1TL, t2TL, t3TL, t4TL = 0, 0
local _G = getglobal
local tinsert = table.insert
local strformat = string.format

function DPSMate.Modules.Auras:UpdateDetails(obj, key)
	DPSMate_Details_CompareAuras:Hide()
	
	curKey = key
	db, cbt = DPSMate:GetMode(key)
	DetailsUser = obj.user
	DetailsUserComp = nil
	DPSMate_Details_Auras_Title:SetText(DPSMate.L["aurasof"]..obj.user)
	t2, t1 = DPSMate.Modules.Auras:SortTable()
	t1TL = DPSMate:TableLength(t1)-6
	t2TL = DPSMate:TableLength(t2)-6
	Buffpos, Debuffpos = 0, 0
	
	if not g then
		g = DPSMate.Options.graph:CreateStackedGraph("AurasStackedGraph",DPSMate_Details_Auras_DiagramLine,"CENTER","CENTER",0,0,660,170)
		g:SetGridColor({0.5,0.5,0.5,0.5})
		g:SetAxisDrawing(true,true)
		g:SetAxisColor({1.0,1.0,1.0,1.0})
		g:SetAutoScale(true)
		g:SetYLabels(true, false)
		g:SetXLabels(true)
		g:Show()
	end
	
	self:CleanTables("")
	self:UpdateBuffs(0, "")
	self:UpdateDebuffs(0, "")
	self:UpdateStackedGraph(g)
	DPSMate_Details_Auras:Show()
	DPSMate_Details_Auras:SetScale((DPSMateSettings["targetscale"] or 0.58)/UIParent:GetScale())
end

function DPSMate.Modules.Auras:UpdateCompare(obj, key, comp)
	self:UpdateDetails(obj, key)
	
	DetailsUserComp = comp
	DPSMate_Details_CompareAuras_Title:SetText(DPSMate.L["aurasof"]..comp)
	t4, t3 = DPSMate.Modules.Auras:SortTable(comp)
	t3TL = DPSMate:TableLength(t3)-6
	t4TL = DPSMate:TableLength(t4)-6
	BuffposComp, DebuffposComp = 0, 0
	
	if not g2 then
		g2 = DPSMate.Options.graph:CreateStackedGraph("AurasStackedGraphComp",DPSMate_Details_CompareAuras_DiagramLine,"CENTER","CENTER",0,0,660,170)
		g2:SetGridColor({0.5,0.5,0.5,0.5})
		g2:SetAxisDrawing(true,true)
		g2:SetAxisColor({1.0,1.0,1.0,1.0})
		g2:SetAutoScale(true)
		g2:SetYLabels(true, false)
		g2:SetXLabels(true)
		g2:Show()
	end
	
	self:CleanTables("Compare")
	self:UpdateBuffs(0, "Compare")
	self:UpdateDebuffs(0, "Compare")
	self:UpdateStackedGraph(g2, comp)
	DPSMate_Details_CompareAuras:Show()
end

function DPSMate.Modules.Auras:CreateGraphTable(obj)
	local lines = {}
	for i=1, 6 do
		-- Horizontal
		DPSMate.Options.graph:DrawLine(obj, 5, 223-i*30, 655, 223-i*30, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
	end
	-- Vertical
	DPSMate.Options.graph:DrawLine(obj, 235, 215, 235, 15, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
	DPSMate.Options.graph:DrawLine(obj, 300, 215, 300, 15, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
end

function DPSMate.Modules.Auras:UpdateStackedGraph(gg, cname)
	local Data1 = {}
	local maxX, maxY = 0, 0
	local label = {}
	
	for cat, val in pairs(db[DPSMateUser[cname or DetailsUser][1]]) do -- ability
		local temp = {}
		for ca, va in pairs(val[1]) do
			tinsert(temp, {va, 1})
		end
		tinsert(Data1, temp)
		tinsert(label, DPSMate:GetAbilityById(cat))
	end
	
	gg:ResetData()
	gg:SetGridSpacing(800/7,10/7)
	
	gg:AddDataSeries(Data1,{1.0,0.0,0.0,0.8}, {}, label)
end

function DPSMate.Modules.Auras:SortTable(cname)
	local t, u = {}, {}
	local a,_,b,c = DPSMate.Modules.AurasUptimers:EvalTable(DPSMateUser[cname or DetailsUser], curKey)
	local p1,p2 = 1, 1
	for cat, val in pairs(a) do
		local name = DPSMate:GetAbilityById(val)
		local obj = {name, b[cat], c[cat]}
		if DPSMateAbility[name][5] then
			tinsert(t, p1, obj)
			p1 = p1 + 1
		else
			tinsert(u, p2, obj)
			p2 = p2 + 1
		end
	end	
	return t, u
end

function DPSMate.Modules.Auras:CleanTables(comp)
	for _, val in pairs({"Buffs", "Debuffs"}) do
		local path = "DPSMate_Details_"..comp.."Auras_"..val.."_Row"
		for i=1, 6 do
			_G(path..i.."_Icon"):SetTexture()
			_G(path..i.."_Name"):SetText()
			_G(path..i.."_Count"):SetText()
			_G(path..i.."_CBT"):SetText()
			_G(path..i.."_CBTPerc"):SetText()
			_G(path..i.."_StatusBar"):SetValue(0)
		end
	end
end

function DPSMate.Modules.Auras:UpdateBuffs(arg1, comp)
	comp = comp or DPSMate_Details_Auras.LastScroll
	local path = "DPSMate_Details_"..comp.."Auras_Buffs_Row"
	Buffpos=Buffpos-(arg1 or 0)
	local arr = t1
	if comp~="" and comp then
		if Buffpos<0 then Buffpos = 0 end
		if Buffpos>t3TL then Buffpos = t3TL end
		if t3TL<0 then Buffpos = 0 end
		arr = t3
		for i=1, 6 do
			local pos = BuffposComp + i
			if not arr[pos] then break end
			_G(path..i).id = arr[pos][1]
			_G(path..i.."_Icon"):SetTexture(DPSMate:GetSpellIcon(arr[pos][1]))
			_G(path..i.."_Name"):SetText(arr[pos][1])
			_G(path..i.."_Count"):SetText(arr[pos][3])
			_G(path..i.."_CBT"):SetText(strformat("%.2f", arr[pos][2]*cbt/100).."s")
			_G(path..i.."_CBTPerc"):SetText(strformat("%.2f", arr[pos][2]).."%")
			_G(path..i.."_StatusBar"):SetValue(arr[pos][2])
		end
	else
		if Buffpos<0 then Buffpos = 0 end
		if Buffpos>t1TL then Buffpos = t1TL end
		if t1TL<0 then Buffpos = 0 end
		for i=1, 6 do
			local pos = Buffpos + i
			if not arr[pos] then break end
			_G(path..i).id = arr[pos][1]
			_G(path..i.."_Icon"):SetTexture(DPSMate:GetSpellIcon(arr[pos][1]))
			_G(path..i.."_Name"):SetText(arr[pos][1])
			_G(path..i.."_Count"):SetText(arr[pos][3])
			_G(path..i.."_CBT"):SetText(strformat("%.2f", arr[pos][2]*cbt/100).."s")
			_G(path..i.."_CBTPerc"):SetText(strformat("%.2f", arr[pos][2]).."%")
			_G(path..i.."_StatusBar"):SetValue(arr[pos][2])
		end
	end
end

function DPSMate.Modules.Auras:UpdateDebuffs(arg1, comp)
	comp = comp or DPSMate_Details_Auras.LastScroll
	local path = "DPSMate_Details_"..comp.."Auras_Debuffs_Row"
	Debuffpos=Debuffpos-(arg1 or 0)
	local arr = t2
	if comp~="" and comp then
		if Debuffpos<0 then Debuffpos = 0 end
		if Debuffpos>t4TL then Debuffpos = t4TL end
		if t4TL<0 then Debuffpos = 0 end
		arr = t4
		for i=1, 6 do
			local pos = DebuffposComp + i
			if not arr[pos] then break end
			_G(path..i).id = arr[pos][1]
			_G(path..i.."_Icon"):SetTexture(DPSMate:GetSpellIcon(arr[pos][1]))
			_G(path..i.."_Name"):SetText(arr[pos][1])
			_G(path..i.."_Count"):SetText(arr[pos][3])
			_G(path..i.."_CBT"):SetText(strformat("%.2f", arr[pos][2]*cbt/100).."s")
			_G(path..i.."_CBTPerc"):SetText(strformat("%.2f", arr[pos][2]).."%")
			_G(path..i.."_StatusBar"):SetValue(arr[pos][2])
		end
	else
		if Debuffpos<0 then Debuffpos = 0 end
		if Debuffpos>t2TL then Debuffpos = t2TL end
		if t2TL<0 then Debuffpos = 0 end
		for i=1, 6 do
			local pos = Debuffpos + i
			if not arr[pos] then break end
			_G(path..i).id = arr[pos][1]
			_G(path..i.."_Icon"):SetTexture(DPSMate:GetSpellIcon(arr[pos][1]))
			_G(path..i.."_Name"):SetText(arr[pos][1])
			_G(path..i.."_Count"):SetText(arr[pos][3])
			_G(path..i.."_CBT"):SetText(strformat("%.2f", arr[pos][2]*cbt/100).."s")
			_G(path..i.."_CBTPerc"):SetText(strformat("%.2f", arr[pos][2]).."%")
			_G(path..i.."_StatusBar"):SetValue(arr[pos][2])
		end
	end
end

function DPSMate.Modules.Auras:ShowTooltip(obj)
	local user = DetailsUser
	if obj and string.find(obj:GetName(), "Compare") then
		user = DetailsUserComp
	end
	if obj.id and db[DPSMateUser[user][1]][DPSMateAbility[obj.id][1]] then
		GameTooltip:SetOwner(obj)
		GameTooltip:AddLine(obj.id)
		for cat, val in pairs(db[DPSMateUser[user][1]][DPSMateAbility[obj.id][1]][3]) do
			GameTooltip:AddDoubleLine(DPSMate:GetUserById(cat),val,1,1,1,1,1,1)
		end
		GameTooltip:Show()
	end
end
