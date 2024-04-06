# discord_sdk_commands_get_channel_permissions()
---
`discord_sdk_commands_get_channel_permissions(channel_id)`

Returns permissions bitfield for the current user in the activities channel

Required scopes:
- guild.members.read

Returns: Real (Async event ID)

## Callback

Has Callback: Yes

Type: `DISCORD_COMMAND_GET_CHANNEL_PERMISSIONS`

Data:


```ts
{
    permissions: String
}
```
