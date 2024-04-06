# discord_sdk_commands_get_entitlements()
---
`discord_sdk_commands_get_entitlements()`

**Not yet available**

Returns entitlements available to the current user

Requires scopes:
- applications.entitlements (assumed)

Returns: Real (Async event ID)

## Callback

Has Callback: Yes

Type: `DISCORD_COMMAND_GET_ENTITLEMENTS`

Data:


```ts
{
    entitlements: Array<Struct.Entitlement>
}
```


## Struct.Entitlement

```ts
{
    id: String,
    sku_id: String,
    application_id: String,
    user_id: String,
    gift_code_flags: Real,
    type: Enum.ENTITLEMENT_TYPE | Real,
    gifter_user_id: String | undefined,
    branches: Array<String> | undefined,
    starts_at: String | undefined,           // ISO datetime string
    ends_at: String | undefined,             // ISO datetime string
    parent_id: String | undefined,
    consumed: Boolean | undefined,
    deleted: boolean | undefined,
    gift_code_batch_id: String | undefined,
}
```

## Enum.ENTITLEMENT_TYPE

```ts
enum ENTITLEMENT_TYPE {
    UNHANDLED: -1,
    PURCHASE: 1,
    PREIUM_SUBSCRIPTION: 2,
    DEVELOPER_GIFT: 3,
    TEST_MODE_PURCHASE: 4,
    FREE_PURCHASE: 5,
    USER_GIFT: 6,
    PREMIUM_PURCHASE: 7,
}
```