# discord_sdk_upload_share_surface()
---
`discord_sdk_upload_share_surface(surface)`

Uploads any surface to Discord's ephemeral attachment URL. Should work with any surface, including the application surface

| Name | Type | Required | Description |
| - | - | - | - |
| surface_data | Id.Surface | Yes | Surface/image to upload to Discords servers |

## Usage

This code uploads the `application_surface` to Discords attachment endpoint using this function and opens a share dialog using [discord_sdk_commands_open_share_moment_dialog()](discord_sdk_commands_open_share_moment_dialog.md)
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

Has callback: Yes

Type: `DISCORD_SHARE_MEDIA_UPLOADED`

Data:

```ts
{
    attachment: {
        id: String,
        filename: String,
        size: Real,
        url: String,
        proxy_url: String,
        width: Real,
        height: Real,
        content_type: String,
        ephemeral: Boolean,
        placeholder: String,
        placeholder_version: Real
    }
}
```