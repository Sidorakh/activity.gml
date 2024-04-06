# Struct.DiscordRichpresence
---

`new DiscordRichPresence()`

A constructor that helps you build Discord Rich Presence data

# new DiscordRichPresence()

The DiscordRichPresence constructor

Returns: [Struct.DiscordRichPresence](discord-rich-presence.md)

## DiscordRichPresence.set_type(type)
Sets the activity type in the rich presence struct

| Name | Type | Required | Description
| - | - | - | - |
| type | [Enum.DISCORD_PRESENCE_TYPES](discord-rich-presence.md?id=enumdiscord_presence_types) | Yes | The type of activity the user is participating in. Only Playing, Listening, and Watchign are allowed right now |

Returns: self

## DiscordRichPresence.set_details(details)
Sets the details line in the rich presence struct

| Name | Type | Required | Description |
| - | - | - | - |
| details | String | Yes | Short text that describes the players current activity |

Returns: self

## DiscordRichPresence.set_state(state)
Sets the state line in the rich presence struct

| Name | Type | Required | Description |
| - | - | - | - |
| state | String | Yes | Short text that describes the players current status |

Returns: self


## DiscordRichPresence.set_timestamps(start,finish)
Sets the timestamps in the rich presence struct

| Name | Type | Required | Description |
| - | - | - | - |
| start | Real | Yes | When the acitvity was started (Unix time) | 
| finish | Real | Yes | When the activity will end (unix time) |

Returns: self


## DiscordRichPresence.set_secrets(join,match)
Sets join and match secrets in the Rich presence struct (unsure if they're actually used for discord activities)

| Name | Type | Required | Description |
| - | - | - | - |
| join | String | Yes | Join secret for the players current game |
| match | String | Yes | Match secret for the players current game |

Returns: self


## DiscordRichPresence.set_party(party_id,current_size,max_size)
Sets details about the current party in the Rich Presence struct

| Name | Type | Required | Description |
| - | - | - | - |
| party_id | String | Yes | Unique identifier for each party |
| current_size | Real | Yes | Number of players currently in the party |
| max_size | Real | Yes | Maximum number of players in the party |

Returns: self


## DiscordRichPresence.set_large_asset(key,text)
Sets the large asset key and text

| Name | Type | Required | Description |
| - | - | - | - | 
| key | String | Yes | Discord application asset key |
| text | String | Yes | Tooltip text |

Returns: self


## DiscordRichPresence.set_small_asset(key,text)
Sets the small asset key and text

| Name | Type | Required | Description |
| - | - | - | - | 
| key | String | Yes | Discord application asset key |
| text | String | Yes | Tooltip text |

Returns: self


## DiscordRichPresence.build_data()
Builds and returns a formatted DiscordActivityData struct

Returns: [DiscordActivityData](discord-rich-presence.md?id=structdiscordactivitydata)




# Struct.DiscordActivityData


```ts
{
    assets: {
        large_image: String,
        large_text: String,
        small_image: String,
        small_text: String,
    },
    details: String,
    party: {
        id: String,
        size: [Real, Real],
    },
    secrets: {
        join: String,
        match: String,
    },
    state: String,
    timestamps: {
        start: Real,
        end: real,
    }
    type: Real,
}
```



# Enum.DISCORD_PRESENCE_TYPES

Types of activity verb to use

| Name | Value |
| - | - | 
| DISCORD_PRESENCE_TYPES.PLAYING | 0 |
| DISCORD_PRESENCE_TYPES.LISTENING | 2 |
| DISCORD_PRESENCE_TYPES.WATCHING | 3 |

