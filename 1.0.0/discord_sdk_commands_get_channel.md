# discord_sdk_commands_get_channel()
---
`discord_sdk_commands_get_channel(channel_id)`

Returns data about the given channel

Required scopes:
- `guilds` (for regular guild channels)
- `dm_channels.read` (for group DM channels - requires approval)

| Name | Type | Required | Description |
| - | - | - | - |
| `channel_id` | String | No | ID of th channel to fetch data of. Defaults to the channel the activity is running in |

Returns: Real (Async event ID)

## Callback

Has Callback: Yes

Type: `DISCORD_COMMAND_GET_CHANNEL`

Data:


```ts
{
    // channel data goes here
}
```
