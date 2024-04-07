# discord_sdk_commands_open_share_moment_dialog()
---
`discord_sdk_commands_open_share_moment_dialog(media_url)`

Required scopes:
- N/A

Opens a share moment dialog box. Media URL must be on the Discord CDN, which can be obtained from the [`discord_sdk_upload_share_surface()`](discord_sdk_upload_share_surface.md) function, or more directly by uploading to the `https://discord.com/api/applications/<CLIENT_ID>/attachment` endpoint in the Discord API for other types of file. 

| Name | Type | Required | Description |
| - | - | - | - |
| media_url | String | Yes | A URL on the Discord CDN - the media to be shared |

## Usage

This code uploads the `application_surface` to Discords attachment endpoint using [`discord_sdk_upload_share_surface()`](discord_sdk_upload_share_surface()) and opens a share dialog using this function
```gml
// Step
if (keyboard_check_pressed(vk_space)) {
    discord_sdk_upload_share_surface(application_surface);
}

// Async - Social
var type = async_load[? "type"];
var data = async_load[? "data"];

if (type == "DISCORD_SHARE_MEDIA_UPLOADED") {
    var url = data.attachment.url;
    discord_sdk_open_share_moment_dialog(url);
}

```

## Callback

Has callback: No
