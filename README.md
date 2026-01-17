# ZyphMuteHooves

WoW addon that mutes mount footstep sounds. Compatible with TBC Classic and Anniversary Edition.

## Supported Mounts

- Horse (all terrain types)
- Skeletal Horse (Undead)
- Wolf
- Raptor
- Mechanostrider
- Kodo
- Ram (Dwarf)
- Hawkstrider (Blood Elf)
- Elekk (Draenei)
- Nightsaber / Cat
- Warp Stalker / Phase Hunter

## Installation

1. Download or clone this repository
2. Copy the `ZyphMuteHooves` folder to your WoW AddOns directory:
   - **TBC Classic:** `World of Warcraft/_classic_/Interface/AddOns/`
   - **Anniversary:** `World of Warcraft/_anniversary_/Interface/AddOns/`
3. Restart WoW or type `/reload`

## Commands

| Command | Description |
|---------|-------------|
| `/zyphhooves` | Show help |
| `/zyphhooves on` | Mute all mount sounds |
| `/zyphhooves off` | Unmute all mount sounds |
| `/zyphhooves add <ID>` | Add custom FileData ID |
| `/zyphhooves list` | List custom sound IDs |

## Adding Custom Sounds

If a mount still makes sounds, you can add custom FileData IDs:

```
/zyphhooves add 123456
```

Custom IDs are saved and persist across sessions.

## Finding Sound IDs

Use [wow.tools](https://wow.tools/files/) to search for sound FileData IDs, or check [Wowhead](https://www.wowhead.com/sounds) for sound databases.

## License

MIT
