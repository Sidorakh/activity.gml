# discord_sdk_commands_get_instance_connected_participants()
---
`discord_sdk_commands_get_instance_connected_participants()`

Returns entitlements available to the current user

Required scopes:
- N/A

Returns: Real (Async event ID)

## Callback

Has Callback: Yes

Type: `DISCORD_COMMAND_GET_CONNECTED_PARTICIPANTS`

Data:


```ts
{
    participants: Array<Struct.VoiceParticipant>
}
```


## Struct.VoiceParticipant

```ts
{
    username: String;
    discriminator: String;
    id: String;
    bot: Boolean;
    flags: Real;
    global_name?: String | undefined;
    avatar?: String | undefined;
    premium_type?: Real
    nickname?: String | undefined
    }[];
```


