# discord_sdk_commands_open_share_moment_dialog()
---
`discord_sdk_commands_open_share_moment_dialog(media_url)`

Required scopes:
- N/A

Opens a share moment dialog box. Media URL must be on the Discord CDN, which can be obtained from [`discord_sdk_upload_share_surface`](discord_sdk_upload_share_surface.md), or more directly by uploading to the `https://discord.com/api/applications/<CLIENT_ID>/attachment` endpoint in the Discord API for other types of file. 

| Name | Type | Required | Description |
| - | - | - | - |
| media_url | String | Yes | A URL on the Discord CDN - the media to be shared |

## Callback

Has callback: No
