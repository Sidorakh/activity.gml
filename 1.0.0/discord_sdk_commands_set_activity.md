# discord_sdk_commands_set_activity()
---
`discord_sdk_commands_set_activity(client_id)`

Initialises the discord embedded activity SDK

Required scopes:
- rpc.activities.write

| Name | Type | Required | Description |
| - | - | - | - |
| `activity` | [Struct.DiscordRichPresence](discord-rich-presence.md) OR [Struct.DiscordActivityData](discord-rch-presence.md?id=structdiscordactivitydata)| Yes | The Client ID for your Discord application |

Returns: Real (Async event ID)

## Callback

Has Callback: Yes

Type: `DISCORD_COMMAND_SET_ACTIVITY`

Data:


```ts
{
    activity: {
        assets: {
            large_image: String | undefined,
            large_text: String | undefined,
            small_image: String | undefined,
            small_text: String | undefined,
        } | undefined,
        details: String | undefined,
        state: String | undefined,
        party: {
            id: String,
            size: [Real, Real],
        },
        secrets: {
            join: String,
            match: String,
        } | undefined,
        timestamps: {
            start: Real | undefined,
            end: Real | undefined,
        } | undefined,
        type: Real,
        name: String,
        flags: Real,
    }
}
```
