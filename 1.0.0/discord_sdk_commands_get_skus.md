# discord_sdk_commands_get_platform_behaviours()
---
`discord_sdk_commands_get_platform_behaviours(client_id)`

**Not currently available** 

Gets a list of available SKU's

Required scopes:
- N/A (assumed)

Returns: Real (Async event ID)



## Callback

Has Callback: Yes

Type: `DISCORD_COMMAND_GET_SKUS`

Data:


```ts
{
    skus: Array<Struct.Sku>
}
```


## Struct.Sku


```ts
{
    id: string,
    name: String,
    type: Enum.SKU_TYPE | Real,
    price: {
        amount: Real,
        currency: String,
    },
    application_id: String,
    flags: Real,
    release_date: String | undefined,        // likely an ISO stirng, won't know for sure until release
}
```


## Enum.SKU_TYPE

```ts
enum SKU_TYPE {
    UNHANDLED: -1,
    APPLICATION:  1,
    DLC: 2,
    CONSUMABLE: 3, 
    BUNDLE: 4,
    SUBSCRIPTION: 5,
}
```