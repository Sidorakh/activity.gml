# The Social Async Event
---

Used for any Discord-related callbacks. `async_load` will be accessible in this events and will contain the following keys

| Name | type | Description | 
| - | - | - |
| `type` | String\<DISCORD_EVENT_TYPE> | Type of event |
| `is_discord_event` | Boolean | Present and set to `true` in any calls from this library |
| `data` | Struct | if present, contains data relevant to the event |
| `request_id` | Number | Request ID, either -1 for subscription events or returned by various calls |

For further information on what this struct will contain, check the functions that call each event

## Event types

| Name | Source Function |
| - | - |
| `"DISCORD_EVENT_READY"` | [`discord_sdk_setup()`](discord_sdk_setup.md) |
| `"DISCORD_AUTHORIZE_SUCCESS"` | [`discord_sdk_commands_authorize()`](discord_sdk_commands_authorize.md) |
| `"DISCORD_COMMAND_ENCOURAGE_HARDWARE_ACCELERATION"` | `discord_sdk_commands_encourage_hardware_acceleration()` | 
| `"DISCORD_COMMAND_GET_CHANNEL"` | `discord_sdk_commands_get_channel()` |
| `"DISCORD_COMMAND_GET_CHANNEL_PERMISSIONS"` | `discord_sdk_commands_get_channel_permissions()` |
| `"DISCORD_COMMAND_GET_ENTITLEMENTS"` | `discord_sdk_commands_get_entitlements()` |
| `"DISCORD_COMMAND_GET_PLATFORM_BEHAVIOURS"` | `discord_sdk_commands_get_platform_behaviours()` |
| `"DISCORD_COMMAND_GET_SKUS"` | `discord_sdk_commands_get_skus()` |
| `"DISCORD_COMMAND_INITIATE_IMAGE_UPLOAD"` | `discord_sdk_commands_initiate_image_upload()` |
| `"DISCORD_COMMAND_SET_ACTIVITY"` | `discord_sdk_command_set_activity()` |
| `"DISCORD_COMMAND_SET_CONFIG"` | `discord_sdk_command_set_config()` |
| `"DISCORD_COMMAND_SET_ORIENTATION_LOCK_STATE"` | `discord_sdk_command_set_orientation_lock_state()` |
| `"DISCORD_COMMAND_START_PURCHASE"` | `discord_sdk_command_start_purchase()` |
| `"DISCORD_USER_SETTINGS_GET_LOCALE"` | `discord_sdk_command_user_settings_get_locale()` |

