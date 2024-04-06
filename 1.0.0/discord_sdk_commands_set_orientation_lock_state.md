# discord_sdk_commands_set_orientation_lock_state()
---
`discord_sdk_commands_set_orientation_lock_state(lock_state,grid_lock_state,pip_lock_state)`

Locks the application to specific orientations for each layout mode

Required scopes:
- guilds.members.read

| Name | Type | Required | Description |
| - | - | - | - | 
| `lock_state` | `"landscape"` OR `"portrait"` OR `"unlocked"` | Yes | Rotation lock when the activity is focused |
| `grid_lock_state` | `"landscape"` OR `"portrait"` OR `"unlocked"` | Yes | Rotation lock when the activity is shown in grid view |
| `pip_lock_state` | `"landscape"` OR `"portrait"` OR `"unlocked"` | Yes | Rotation lock when the activity is in piture-in-picture mode |

Returns: N/A

