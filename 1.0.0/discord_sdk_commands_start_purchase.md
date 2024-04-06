# discord_sdk_commands_start_purchase()
---
`discord_sdk_commands_start_purchase(sku_id)`

**Not yet available**

Begins the purchase flow

Required scopes:
- applications.entitlements (assumed)

| Name | Type | Required | Description |
| - | - | - | - |
| `sku_id` | String | Yes | ID of the product/SKU to purchase |

Returns: Real (Async request ID)

## Callback

Type: `DISCORD_SDK_COMMAND_START_PURCHASE`

Data: 

```ts
{
    purchases: Array<Struct.Entitlements>
}
```