-- ZyphMuteHooves Addon
-- Mutes all footstep sounds in WoW TBC Classic

-- =============================================
-- PLAYER CHARACTER FOOTSTEPS (from Wowhead TBC)
-- =============================================
local playerFootsteps = {
    -- Character Small (Gnome, Dwarf, Goblin)
    -- Dirt
    540099, 540128, 540136, 540201, 540227,
    -- Grass
    540097, 540126, 540160, 540171, 540225,
    -- Stone
    540140, 540147, 540163, 540183, 540214,
    -- Wood
    540100, 540105, 540111, 540144, 540189,
    -- Snow
    540135, 540142, 540177, 540194, 540216,

    -- Character Medium/Large (Human, Elf, Orc, Troll, Undead, etc.)
    -- Dirt
    540127, 540155, 540156, 540159, 540168, 540180, 540196, 540206, 540210,
    -- Grass
    540118, 540124, 540138, 540202, 540230,
    -- Stone
    540092, 540120, 540131, 540139, 540193, 540199, 540208, 540209, 540224, 540229,
    -- Snow
    540109, 540125, 540154, 540204, 540215,
    -- Wood
    540121, 540145, 540149, 540151, 540164, 540172, 540181, 540198,

    -- Giant Character (Tauren, Draenei)
    -- Dirt
    540129, 540146, 540148, 540185, 540226,
    -- Grass
    540093, 540117, 540166, 540173, 540222,
    -- Stone
    540119, 540182, 540213, 540218, 540221,
    -- Snow
    540094, 540113, 540132, 540133, 540176,
    -- Wood
    540221,

    -- Huge (large creatures/mounts)
    -- Dirt
    540102, 540110, 540130, 540137, 540195,
    -- Grass
    540112, 540122, 540169, 540190, 540192,
    -- Stone
    540108, 540143, 540188, 540207, 540211,
    -- Wood
    540107, 540134, 540162, 540200, 540228,
    -- Snow
    540106, 540116, 540203, 540219,
}

-- =============================================
-- MOUNT FOOTSTEPS
-- =============================================
local mountSounds = {
    -- HORSE (confirmed from Wowhead)
    -- Dirt
    552072, 552078, 552081, 552083, 552089,
    -- Grass
    552062, 552071, 552079, 552085, 552087,
    -- Stone
    552060, 552068, 552070, 552082, 552090,
    -- Wood
    552063, 552066, 552075, 552076, 552086,
    -- Snow
    552058, 552065, 552073, 552077, 552084,

    -- SKELETAL HORSE (Undead) - similar range
    552091, 552092, 552093, 552094, 552095,
    552096, 552097, 552098, 552099, 552100,

    -- WOLF
    539830, 539831, 539832, 539833, 539834,
    539835, 539836, 539837, 539838, 539839,
    539840, 539841, 539842, 539843, 539844,

    -- RAPTOR
    545146, 545147, 545148, 545149, 545150,
    545151, 545152, 545153, 545154, 545155,

    -- MECHANOSTRIDER / SPIDER
    551697, 551698, 551699, 551700, 551701, 551702,
    555818, 555819, 555820, 555821, 555822, 555823,
    561421, 561422, 561423, 561424, 561425, -- Spider

    -- KODO
    550655, 550656, 550657, 550658, 550659,
    550660, 550661, 550662, 550663, 550664,

    -- RAM (Dwarf)
    543719, 543720, 543721, 543722, 543723,
    543724, 543725, 543726, 543727, 543728,

    -- HAWKSTRIDER (Blood Elf)
    566188, 566189, 566190, 566191, 566192,

    -- ELEKK (Draenei)
    564683, 564684, 564685, 564686, 564687,

    -- NIGHTSABER / CAT
    542402, 542403, 542404, 542405, 542406,
    542407, 542408, 542409, 542410, 542411,

    -- Generic dismount
    569026,
}

-- =============================================
-- CREATURE FOOTSTEPS (misc)
-- =============================================
local creatureFootsteps = {
    -- Murloc
    540098, 540103, 540165, 540184,
    -- Crab
    546425, 546427, 546430, 546434,
    -- Rat
    558891, 558892, 558893, 558894, 558895,
    558896, 558897, 558898, 558899,
}

-- Saved variables
ZyphMuteHooves_CustomSounds = ZyphMuteHooves_CustomSounds or {}
ZyphMuteHooves_PlayerMuted = ZyphMuteHooves_PlayerMuted or false
ZyphMuteHooves_AllMuted = ZyphMuteHooves_AllMuted or false

local function MuteMounts()
    for _, sound in ipairs(mountSounds) do
        MuteSoundFile(sound)
    end
    for _, sound in ipairs(ZyphMuteHooves_CustomSounds) do
        MuteSoundFile(sound)
    end
end

local function UnmuteMounts()
    for _, sound in ipairs(mountSounds) do
        UnmuteSoundFile(sound)
    end
    for _, sound in ipairs(ZyphMuteHooves_CustomSounds) do
        UnmuteSoundFile(sound)
    end
end

local function MutePlayer()
    for _, sound in ipairs(playerFootsteps) do
        MuteSoundFile(sound)
    end
end

local function UnmutePlayer()
    for _, sound in ipairs(playerFootsteps) do
        UnmuteSoundFile(sound)
    end
end

local function MuteAll()
    MuteMounts()
    MutePlayer()
    for _, sound in ipairs(creatureFootsteps) do
        MuteSoundFile(sound)
    end
end

local function UnmuteAll()
    UnmuteMounts()
    UnmutePlayer()
    for _, sound in ipairs(creatureFootsteps) do
        UnmuteSoundFile(sound)
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event)
    MuteMounts()
    if ZyphMuteHooves_PlayerMuted then
        MutePlayer()
    end
    if ZyphMuteHooves_AllMuted then
        MuteAll()
    end
    print("|cff00ff00ZyphMuteHooves:|r Loaded! Use /zyphhooves for options.")
end)

-- Slash commands
SLASH_ZYPHMUTEHOOVES1 = "/zyphhooves"
SlashCmdList["ZYPHMUTEHOOVES"] = function(msg)
    local cmd, arg = msg:match("^(%S*)%s*(.-)$")
    cmd = cmd:lower()

    if cmd == "off" then
        UnmuteAll()
        ZyphMuteHooves_PlayerMuted = false
        ZyphMuteHooves_AllMuted = false
        print("|cffff0000ZyphMuteHooves:|r All footsteps unmuted!")
    elseif cmd == "on" then
        MuteMounts()
        print("|cff00ff00ZyphMuteHooves:|r Mount footsteps muted!")
    elseif cmd == "player" then
        if ZyphMuteHooves_PlayerMuted then
            UnmutePlayer()
            ZyphMuteHooves_PlayerMuted = false
            print("|cffff0000ZyphMuteHooves:|r Player footsteps unmuted!")
        else
            MutePlayer()
            ZyphMuteHooves_PlayerMuted = true
            print("|cff00ff00ZyphMuteHooves:|r Player footsteps muted!")
        end
    elseif cmd == "all" then
        if ZyphMuteHooves_AllMuted then
            UnmuteAll()
            ZyphMuteHooves_AllMuted = false
            ZyphMuteHooves_PlayerMuted = false
            print("|cffff0000ZyphMuteHooves:|r ALL footsteps unmuted!")
        else
            MuteAll()
            ZyphMuteHooves_AllMuted = true
            ZyphMuteHooves_PlayerMuted = true
            print("|cff00ff00ZyphMuteHooves:|r ALL footsteps muted!")
        end
    elseif cmd == "add" and arg ~= "" then
        local id = tonumber(arg)
        if id then
            table.insert(ZyphMuteHooves_CustomSounds, id)
            MuteSoundFile(id)
            print("|cff00ff00ZyphMuteHooves:|r Added sound ID: " .. id)
        else
            print("|cffff0000ZyphMuteHooves:|r Invalid sound ID")
        end
    elseif cmd == "list" then
        print("|cff00ff00ZyphMuteHooves:|r Custom sounds:")
        for i, id in ipairs(ZyphMuteHooves_CustomSounds) do
            print("  " .. i .. ": " .. id)
        end
    else
        print("|cff00ff00ZyphMuteHooves Commands:|r")
        print("  /zyphhooves on - Mute mount footsteps")
        print("  /zyphhooves off - Unmute all footsteps")
        print("  /zyphhooves player - Toggle player footsteps")
        print("  /zyphhooves all - Toggle ALL footsteps")
        print("  /zyphhooves add <ID> - Add custom sound ID")
        print("  /zyphhooves list - List custom sound IDs")
    end
end
