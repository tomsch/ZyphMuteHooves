-- ZyphMuteHooves Addon
-- Mutes all mount footstep sounds in WoW

local mountSounds = {
    -- =====================
    -- HORSE (confirmed IDs)
    -- =====================
    552058, 552060, 552062, 552063, 552065, -- Dirt
    552066, 552068, 552070, 552071, 552072, -- Grass
    552073, 552075, 552076, 552077, 552078, -- Snow
    552079, 552081, 552082, 552083, 552084, -- Stone
    552085, 552086, 552087, 552089, 552090, -- Wood

    -- =====================
    -- WOLF
    -- =====================
    539830, 539831, 539832, 539833, 539834, -- Wolf footsteps
    539835, 539836, 539837, 539838, 539839,
    539840, 539841, 539842, 539843, 539844,

    -- =====================
    -- RAPTOR
    -- =====================
    545146, 545147, 545148, 545149, 545150, -- Raptor footsteps
    545151, 545152, 545153, 545154, 545155,

    -- =====================
    -- MECHANOSTRIDER
    -- =====================
    551697, 551698, 551699, -- GnomeSpiderTank footsteps
    551700, 551701, 551702,
    555818, 555819, 555820, -- Mechanostrider
    555821, 555822, 555823,

    -- =====================
    -- KODO
    -- =====================
    550655, 550656, 550657, 550658, 550659, -- Kodo footsteps
    550660, 550661, 550662, 550663, 550664,

    -- =====================
    -- RAM (Dwarf)
    -- =====================
    543719, 543720, 543721, 543722, 543723,
    543724, 543725, 543726, 543727, 543728,

    -- =====================
    -- HAWKSTRIDER (Blood Elf)
    -- =====================
    566188, 566189, 566190, 566191, 566192,

    -- =====================
    -- ELEKK (Draenei)
    -- =====================
    564683, 564684, 564685, 564686, 564687,

    -- =====================
    -- NIGHTSABER / CAT
    -- =====================
    542402, 542403, 542404, 542405, 542406,
    542407, 542408, 542409, 542410, 542411,

    -- =====================
    -- SKELETAL HORSE (Undead)
    -- =====================
    552091, 552092, 552093, 552094, 552095,
    552096, 552097, 552098, 552099, 552100,

    -- =====================
    -- WARP STALKER / PHASE HUNTER (Reawakened Phase-Hunter)
    -- =====================
    -- Warp Stalker uses Cat/Beast footstep sounds
    -- Cat footsteps (FileData IDs)
    542402, 542403, 542404, 542405, 542406,
    542407, 542408, 542409, 542410, 542411,
    542412, 542413, 542414, 542415, 542416,

    -- =====================
    -- Generic dismount sound
    -- =====================
    569026,
}

-- Saved variables for custom sounds
ZyphMuteHooves_CustomSounds = ZyphMuteHooves_CustomSounds or {}

local function MuteAllSounds()
    for _, sound in ipairs(mountSounds) do
        MuteSoundFile(sound)
    end
    for _, sound in ipairs(ZyphMuteHooves_CustomSounds) do
        MuteSoundFile(sound)
    end
end

local function UnmuteAllSounds()
    for _, sound in ipairs(mountSounds) do
        UnmuteSoundFile(sound)
    end
    for _, sound in ipairs(ZyphMuteHooves_CustomSounds) do
        UnmuteSoundFile(sound)
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event)
    MuteAllSounds()
    print("|cff00ff00ZyphMuteHooves:|r Mount sounds muted! Use /zyphhooves for options.")
end)

-- Slash commands
SLASH_ZYPHMUTEHOOVES1 = "/zyphhooves"
SlashCmdList["ZYPHMUTEHOOVES"] = function(msg)
    local cmd, arg = msg:match("^(%S*)%s*(.-)$")
    cmd = cmd:lower()

    if cmd == "off" then
        UnmuteAllSounds()
        print("|cffff0000ZyphMuteHooves:|r Mount sounds unmuted!")
    elseif cmd == "on" then
        MuteAllSounds()
        print("|cff00ff00ZyphMuteHooves:|r Mount sounds muted!")
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
        print("  /zyphhooves on - Mute all mount sounds")
        print("  /zyphhooves off - Unmute all mount sounds")
        print("  /zyphhooves add <ID> - Add custom sound ID")
        print("  /zyphhooves list - List custom sound IDs")
    end
end
