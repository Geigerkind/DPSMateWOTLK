-- Local Variables
local GetTime = GetTime

local voteCount = 1
local participants = 1
local abort = 0
local Exec = {}
local voteTime = 0
local bc, am = 0, 1
local old = 0

function DPSMate.Sync:GetSummarizedTable(arr)
	local newArr, i, dmg, time, dis = {}, 1, 0, nil, 1
	local TL = DPSMate:TableLength(arr)
	if TL>100 then dis = floor(TL/100) end
	for cat, val in pairs(arr) do
		if dis>1 then
			dmg=dmg+val[2]
			if time then
				if i>dis and (val[1]-time)>0 then
					tinsert(newArr, {(val[1]+time)/2, dmg/(val[1]-time)}) -- last time val // subtracting from each other to get the time in which the damage is being done
					time, dmg, i = nil, 0, 1
				end
			else
				time=val[1]
			end
		else
			tinsert(newArr, val)
		end
		i=i+1
	end
	return newArr
end

function DPSMate.Sync:OnLoad()
	local _, playerclass = UnitClass("player")
	pid = DPSMate.DB:BuildUser(UnitName("player"), strlower(playerclass))
end

local function Vote()
	DPSMate_Vote:Hide()
	SendAddonMessage("DPSMate_Vote", nil, "RAID")
end

local function StartVote()
	if not voteStarter then
		SendAddonMessage("DPSMate_StartVote", nil, "RAID")
		voteStarter = true
		participants = 1
	else
		DPSMate:SendMessage(DPSMate.L["votestartederror"])
	end
end

local function CountVote()
	if voteStarter then
		voteCount=voteCount+1
		if voteCount >= (participants/2) and (GetTime()-abort)>=30 then
			SendAddonMessage("DPSMate_VoteSuccess", nil, "RAID")
			voteStarter = false
			voteCount = 1
			participants = 1
			self:VoteSuccess()
		end
	end
end

local function DismissVote()
	if voteStarter then
		voteTime=voteTime+arg1
		if voteTime>=30 then
			SendAddonMessage("DPSMate_VoteFail", nil, "RAID")
			voteStarter = false
			voteCount = 1
			voteTime = 0
			participants = 1
			DPSMate:SendMessage(DPSMate.L["votefailederror"])
		elseif voteTime>=3 and participants==1 then
			voteStarter = false
			voteCount = 1
			voteTime = 0
			self:VoteSuccess()
		end
	end
end

local function VoteSuccess(key)
	DPSMate:SendMessage(DPSMate.L["votesuccess"])
	DPSMate.Options:PopUpAccept(true, true)
end

local function CountParticipants()
	if voteStarter then
		participants=participants+1
	end
end

local function Participate()
	SendAddonMessage("DPSMate_Participate", nil, "RAID")
end

local function ReceiveStartVote() 
	Participate()
	if DPSMateSettings["dataresetssync"] == 3 then
		DPSMate_Vote:Show()
	elseif DPSMateSettings["dataresetssync"] == 1 then
		Vote()
	end
end

function DPSMate.Sync:AbortVote()
	if IsPartyLeader() or IsRaidOfficer() or IsRaidLeader() then
		SendAddonMessage("DPSMate_AbortVote", "NaN", "RAID")
		DPSMate:SendMessage(DPSMate.L["resetaborted"])
	end
end

local function ReceiveAbort()
	DPSMate:SendMessage(DPSMate.L["resetaborted"])
	abort = GetTime()
	participants = 1000000
	voteCount = 1
end

function DPSMate.Sync:HelloWorld()
	if (GetTime()-bc)>=3 then
		bc = GetTime()
		am = 1
		SendAddonMessage("DPSMate_HelloWorld", "NaN", "RAID")
	end
end

local function GreetBack()
	SendAddonMessage("DPSMate_Greet", DPSMate.SYNCVERSION, "RAID")
end

local function ReceiveGreet(arg2, arg4)
	if (GetTime()-bc)<=3 then
		DPSMate:SendMessage(am..". "..arg4.." (v"..arg2..")")
		am = am + 1
	else
		if (GetTime()-old)>=3 then
			local ver = tnbr(arg2:match("%d+") or 0)
			if ver>DPSMate.VERSION then
				DPSMate:SendMessage(DPSMate.L["versionisold"])
				old = GetTime()
			end
		end
	end
end
local function OnEvent(event)
	Exec[arg1](arg2, arg4)
end

Exec = {
	["DPSMate_HelloWorld"] = function() GreetBack() end,
	["DPSMate_Greet"] = function(arg2,arg4) ReceiveGreet(arg2, arg4) end,
	["DPSMate_AbortVote"] = function() ReceiveAbort() end,
	["DPSMate_Vote"] = function() CountVote() end,
	["DPSMate_StartVote"] = function() ReceiveStartVote() end,
	["DPSMate_VoteSuccess"] = function() VoteSuccess() end,
	["DPSMate_VoteFail"] = function() DPSMate:SendMessage(DPSMate.L["votefailederror"]) end,
	["DPSMate_Participate"] = function() CountParticipants() end,
}

DPSMate.Sync:SetScript("OnEvent", OnEvent)
DPSMate.Sync:SetScript("OnUpdate", DismissVote)