local Locked = true;
local Frames = { 
	"PlayerFrame", 
	"TargetFrame", 
	"FocusFrame", 
	"ObjectiveTrackerFrame", 
	"MinimapCluster",
	"MenuFrame",
	"CastingBarFrame",
	"TargetFrameSpellBar"
}


BuffFrame:SetMovable(true)
BuffFrame:SetUserPlaced(true)
BuffFrame:ClearAllPoints();
BuffFrame:SetPoint("TOP", MinimapCluster, "BOTTOM", 98, -10)

  
-- Drag
function dragFrame(frame)
	self = _G[frame]
	local dragFrame = CreateFrame("Frame", "DragFrame", self)
	dragFrame:SetAllPoints(self)
	dragFrame:SetFrameStrata("HIGH")
	dragFrame:SetHitRectInsets(0,0,0,0)
	dragFrame:SetScript("OnDragStart", function(self) if IsAltKeyDown() then self:GetParent():StartMoving() end end)
	dragFrame:SetScript("OnDragStop", function(self) self:GetParent():StopMovingOrSizing() end)
	dragFrame:SetScript("OnMouseDown", function (self, button)
		if IsShiftKeyDown() then
			if (button == "LeftButton") then 
				self:GetParent():SetScale(self:GetParent():GetScale() + 0.1)
			elseif (button == "RightButton") then
				self:GetParent():SetScale(self:GetParent():GetScale() - 0.1)
			end
		end
	end)

	dragFrame.texture = dragFrame:CreateTexture("ARTWORK")
	dragFrame.texture:SetAllPoints(dragFrame)
	dragFrame.texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
	dragFrame.texture:SetColorTexture(.035, .035, .035, .3)

    dragFrame.texture.text = dragFrame.text or dragFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
	dragFrame.texture.text:SetAllPoints(true)
	dragFrame.texture.text:SetJustifyH("TOP")
	dragFrame.texture.text:SetJustifyV("TOP")
    dragFrame.texture.text:SetText(self:GetName())
	dragFrame.texture.text:SetFont("Fonts\\FRIZQT__.TTF", 14, "THICKOUTLINE")

	dragFrame:Hide()
	self.dragframe = dragFrame
	self:SetClampedToScreen(true)
	self:SetMovable(true)
	self:SetUserPlaced(true)
end

-- Unlock
local function unlockFrame(frame)	
	self = _G[frame]
	if not self:IsUserPlaced() then return end
	if (Locked) then
		self:Show()
		self:SetAlpha(1)
		self.dragframe:Show()
		self.dragframe:EnableMouse(true)
		self.dragframe:RegisterForDrag("LeftButton")
		self.dragframe:SetScript("OnEnter", function(self)
		  GameTooltip:SetOwner(self, "ANCHOR_TOP")
		  GameTooltip:AddLine(self:GetParent():GetName(), 0, 1, 0.5, 1, 1, 1)
		  GameTooltip:AddLine("Hold down ALT to drag!", 1, 1, 1, 1, 1, 1)
		  GameTooltip:Show()
		end)
		self.dragframe:SetScript("OnLeave", function() GameTooltip:Hide() end)


		MenuFrame:SetScript('OnUpdate', function()
			MoveMicroButtons('BOTTOMLEFT', MenuFrame, 'BOTTOMLEFT', 6, 3)
		end)

		CastingBarFrame:SetScript('OnUpdate', function(self)
			self:Show()
		end)
		
		TargetFrameSpellBar:SetScript('OnUpdate', function(self)
			self:Show()
		end)

	else
		self.dragframe:Hide()

		MenuFrame:SetScript("OnUpdate", nil)
		CastingBarFrame:SetScript("OnUpdate", nil)
		TargetFrameSpellBar:SetScript("OnUpdate", nil)
	end
end

-- Init
for i , v in pairs (Frames) do 
	print(v)
	dragFrame(v)
end

-- Slash
SLASH_DRAG1 = '/drag'
function SlashCmdList.DRAG()
	if (Locked) then
		for i , v in pairs (Frames) do unlockFrame(v) end
		Locked = false
	else 
		for i , v in pairs (Frames) do unlockFrame(v) end
		Locked = true
	end
end
MoveMicroButtons('BOTTOMLEFT', MenuFrame, 'BOTTOMLEFT', 6, 3)