# discord_sdk_commands_set_config()
---
`discord_sdk_commands_set_config(use_interactive_pip)`

Sets whether or not the picture-in-picture display is interactive

Required scopes:
- N/A

| Name | Type | Required | Description | 
| - | - | - | - |
| `use_interactive_pip` | Boolean | Yes | Whether or not the picture-in-picture display should be active |

Returns: Real (Async event ID)

## Callback

Has callback: Yes

Type: `DISCORD_COMMAND_SET_CONFIG`

Data:

```ts
{
    use_interactive_pip: Boolean,
}
```