# discord_sdk_setup()
---
`discord_sdk_setup(client_id)`

Initialises the discord embedded activity SDK

| Name | Type | Required | Description |
| - | - | - | - |
| `client_id` | String | Yes | The Client ID for your Discord application |

Returns: N/A

## Callback

Has Callback: Yes

Type: `DISCORD_READY`

Data:

```ts
{
    v: 1,
    config: {
        cdn_host: "cdn.discordapp.com",
        api_endpoint: "//discord.com/api",
        environment: "production"
    }
}
```

