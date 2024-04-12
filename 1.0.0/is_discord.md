# is_discord()
---
`is_discord()`

checks whether or not the application is currently being run inside of Discord. 

Required scopes: 
- N/A


Returns: Boolean

## Usage
This code checks if the game is running in Discord, and if so, attempts to initialise the Discord SDK
```gml
// Create
if (is_discord()) {
    discord_sdk_setup(global.client_id);
}
```

## Callback

Has Callback: Yes

Type: `DISCORD_READY`

Data:

```js
{
   ... 
}
```
