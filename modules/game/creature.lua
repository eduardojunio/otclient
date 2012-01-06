SkullNone = 0
SkullYellow = 1
SkullGreen = 2
SkullWhite = 3
SkullRed = 4
SkullBlack = 5
SkullOrange = 6

ShieldNone = 0
ShieldWhiteYellow = 1
ShieldWhiteBlue = 2
ShieldBlue = 3
ShieldYellow = 4
ShieldBlueSharedExp = 5
ShieldYellowSharedExp = 6
ShieldBlueNoSharedExpBlink = 7
ShieldYellowNoSharedExpBlink = 8
ShieldBlueNoSharedExp = 9
ShieldYellowNoSharedExp = 10

EmblemNone = 0
EmblemGreen = 1
EmblemRed = 2
EmblemBlue = 3

function Creature:onSkullChange(skullId)
  if skullId == SkullYellow then
    self:setSkullTexture(resolvepath('images/skull_yellow.png'))
  elseif skullId == SkullGreen then
    self:setSkullTexture(resolvepath('images/skull_green.png'))
  elseif skullId == SkullWhite then
    self:setSkullTexture(resolvepath('images/skull_white.png'))
  elseif skullId == SkullRed then
    self:setSkullTexture(resolvepath('images/skull_red.png'))
  elseif skullId == SkullBlack then
    self:setSkullTexture(resolvepath('images/skull_black.png'))
  elseif skullId == SkullOrange then
    self:setSkullTexture(resolvepath('images/skull_orange.png'))
  end
end

function Creature:onShieldChange(shieldId)
  if shieldId == ShieldWhiteYellow then
    self:setShieldTexture(resolvepath('images/shield_yellow_white.png'))
  elseif shieldId == ShieldWhiteBlue then
    self:setShieldTexture(resolvepath('images/shield_blue_white.png'))
  elseif shieldId == ShieldBlue then
    self:setShieldTexture(resolvepath('images/shield_blue.png'))
  elseif shieldId == ShieldYellow then
    self:setShieldTexture(resolvepath('images/shield_yellow.png'))
  elseif shieldId == ShieldBlueSharedExp then
    self:setShieldTexture(resolvepath('images/shield_blue_shared.png'))
  elseif shieldId == ShieldYellowSharedExp then
    self:setSkullTexture(resolvepath('images/shield_yellow_shared.png'))
  elseif shieldId == ShieldBlueNoSharedExpBlink then
    self:setSkullTexture(resolvepath('images/shield_blue_not_shared.png'))
  elseif shieldId == ShieldYellowNoSharedExpBlink then
    self:setSkullTexture(resolvepath('images/shield_yellow_not_shared.png'))
  elseif shieldId == ShieldBlueNoSharedExp then
    self:setSkullTexture(resolvepath('images/shield_blue_not_shared.png'))
  elseif shieldId == ShieldYellowNoSharedExp then
    self:setSkullTexture(resolvepath('images/shield_yellow_not_shared.png'))
  end
end

function Creature:onEmblemChange(emblemId)
  if emblemId == EmblemGreen then
    self:setEmblemTexture(resolvepath('images/emblem_green.png'))
  elseif emblemId == EmblemRed then
    self:setEmblemTexture(resolvepath('images/emblem_red.png'))
  elseif emblemId == EmblemBlue then
    self:setEmblemTexture(resolvepath('images/emblem_blue.png'))
  end
end

