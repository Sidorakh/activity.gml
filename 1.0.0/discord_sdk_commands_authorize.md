# discord_sdk_commands_authorize()
---
`discord_sdk_commands_authorize(backend_url,scopes)`

Authenticates the currently logged in user with your application

Required scopes: 
- N/A

## Parameters

| Name | Type | Required | Description |
| - | - | - | - |
| `backend_url` | String | Yes | The backend URL (relative path) for the authentication endpoint |
| `scopes` | String | No | A comma separated list of scopes you request. Default: `'identify'` |

Returns: N/A

## Callback

Has Callback: Yes

Type: `DISCORD_AUTHORIZE_SUCCESS`

Data:

```js
{
    token_type: "Bearer",
    access_token: String,               // Used to authenticate with Discords API's
    refresh_token: String,              // Used to fetch anotehr access token
    expires_in: Number,                 // Time until the access token expires in seconds
    scope: String,                      // Scopes granted to the application
    user_data: {
        id: String,                     // user's global Discord ID
        username: String,               // user's username/handle
        global_name: String | null,     // user's global nickname
        discriminator: String,          // users discriminator, or "0" if they don't have one
        avatar: String | null,          // Avatar URL or null
        verified: boolean,              // Whether or not this user verified their email address
        email: String,                  // The user's Email address - only present if you pass in the `email` scope
        flags: Number,                  // Flags associated with this users account
        banner: String | null,          // Banner image if present
        accent_color: Number,           // Profile colour
        premium_type: Number,           // Type of Discord Nitro attached
        public_flags: Number,           // Flags associated with this users account
        mfa_enabled: Boolean,           // Whether 2fa is enabled for this account
    },
    websocket_token: String,            // Websocket token, used for authenticating with the backend server (not discord)
}
```


## Valid scopes

| Name | Description |
| - | - |
| identify | Allows the application to retrieve basic user information |
| email | Allows the application to retrieve the users email address |
| guilds | Allows the application to view guilds the user is in |

.. and more


