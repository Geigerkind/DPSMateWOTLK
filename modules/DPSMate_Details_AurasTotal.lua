-- Global Variables
DPSMate.Modules.DetailsAurasTotal = {}

-- Local variables
local g
local curKey = 1
local db, cbt = {}, 0
local Buffpos, Debuffpos = 0, 0
local t1, t2, t3, t4
local t1TL, t2TL = 0, 0
local _G = getglobal
local tinsert = table.insert
local strformat = string.format
local tnbr = tonumber

function DPSMate.Modules.DetailsAurasTotal:UpdateDetails(obj, key)
	curKey = key
	db, cbt = DPSMate:GetMode(key)
	DPSMate_Details_AurasTotal_Title:SetText(DPSMate.L["aurassum"])
	t2, t1 = self:SortTable()
	t1TL = DPSMate:TableLength(t1)-6
	t2TL = DPSMate:TableLength(t2)-6
	Buffpos, Debuffpos = 0, 0
	
	if not g then
		g = DPSMate.Options.graph:CreateStackedGraph("AurasTotalStackedGraph",DPSMate_Details_AurasTotal_DiagramLine,"CENTER","CENTER",0,0,660,170)
		g:SetGridColor({0.5,0.5,0.5,0.5})
		g:SetAxisDrawing(true,true)
		g:SetAxisColor({1.0,1.0,1.0,1.0})
		g:SetAutoScale(true)
		g:SetYLabels(true, false)
		g:SetXLabels(true)
		g:Show()
	end
	
	self:CleanTables()
	self:UpdateBuffs(0)
	self:UpdateDebuffs(0)
	self:UpdateStackedGraph(g)
	DPSMate_Details_AurasTotal:Show()
	DPSMate_Details_AurasTotal:SetScale((DPSMateSettings["targetscale"] or 0.58)/UIParent:GetScale())
end

function DPSMate.Modules.DetailsAurasTotal:CreateGraphTable(obj)
	local lines = {}
	for i=1, 6 do
		-- Horizontal
		DPSMate.Options.graph:DrawLine(obj, 5, 223-i*30, 655, 223-i*30, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
	end
	-- Vertical
	DPSMate.Options.graph:DrawLine(obj, 235, 215, 235, 15, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
	DPSMate.Options.graph:DrawLine(obj, 300, 215, 300, 15, 20, {0.5,0.5,0.5,0.5}, "BACKGROUND")
end

function DPSMate.Modules.DetailsAurasTotal:UpdateStackedGraph(gg, cname)
	local Data1 = {}
	local maxX, maxY = 0, 0
	local label = {}
	local temp = {}
	
	for cat, val in pairs(db) do -- ability
		local user = DPSMate:GetUserById(cat)
		if DPSMate:ApplyFilter(curKey, user) then
			for ca,va in pairs(val) do 
				local abname = DPSMate:GetAbilityById(ca)
				if not temp[abname] then temp[abname]={} end
				for c, v in pairs(va[1]) do
					local time = floor(v) -- Performance
					if temp[abname][time] then 
						temp[abname][time]=temp[abname][time]+1
					else
						temp[abname][time]=0
					end
				end
			end
		end
	end
	for cat, val in pairs(temp) do
		local arr = {}
		for ca, va in pairs(val) do
			tinsert(arr, {ca,va})
		end
		tinsert(Data1, arr)
		tinsert(label, cat)
	end
	temp = nil
	
	gg:ResetData()
	gg:SetGridSpacing(800/7,10/7)
	
	gg:AddDataSeries(Data1,{1.0,0.0,0.0,0.8}, {}, label)
end

-- Making an average uptime
function DPSMate.Modules.DetailsAurasTotal:SortTable()
	local t, u = {}, {}
	for cat, _ in pairs(db) do
		local user = DPSMate:GetUserById(cat)
		if DPSMate:ApplyFilter(curKey, user) then
			local a,_,b,c = DPSMate.Modules.AurasUptimers:EvalTable(DPSMateUser[user], curKey)
			for ca,va in pairs(a) do
				local name = DPSMate:GetAbilityById(va)
				if DPSMateAbility[name][5] then
					if t[name] then
						t[name][2] = DPSMate.DB:WeightedAverage(t[name][2], b[ca], t[name][3], c[ca])
						t[name][3] = t[name][3] + c[ca]
					else
						t[name] = {name, b[ca], c[ca]}
					end
				else
					if u[name] then
						u[name][2] = DPSMate.DB:WeightedAverage(u[name][2], b[ca], u[name][3], c[ca])
						u[name][3] = u[name][3] + c[ca]
					else
						u[name] = {name, b[ca], c[ca]}
					end
				end
			end
		end
	end
	-- Sorting it by amount
	local z,y = {}, {}
	for cat, val in pairs(t) do
		local i=1
		while true do
			if not z[i] then
				tinsert(z, i, val)
				break
			elseif z[i][3]<val[3] then
				tinsert(z, i, val)
				break
			end
			i=i+1
		end
	end
	for cat, val in pairs(u) do
		local i=1
		while true do
			if not y[i] then
				tinsert(y, i, val)
				break
			elseif y[i][3]<val[3] then
				tinsert(y, i, val)
				break
			end
			i=i+1
		end
	end
	t, u = nil, nil
	return z, y
end

function DPSMate.Modules.DetailsAurasTotal:CleanTables()
	for _, val in pairs({"Buffs", "Debuffs"}) do
		local path = "DPSMate_Details_AurasTotal_"..val.."_Row"
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

function DPSMate.Modules.DetailsAurasTotal:UpdateBuffs(arg1)
	local path = "DPSMate_Details_AurasTotal_Buffs_Row"
	Buffpos=Buffpos-(arg1 or 0)
	local arr = t1
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

function DPSMate.Modules.DetailsAurasTotal:UpdateDebuffs(arg1)
	local path = "DPSMate_Details_AurasTotal_Debuffs_Row"
	Debuffpos=Debuffpos-(arg1 or 0)
	local arr = t2
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
