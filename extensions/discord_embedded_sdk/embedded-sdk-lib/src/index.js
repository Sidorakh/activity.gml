import { DiscordSDK } from "@discord/embedded-app-sdk";

let access_token = null;
let refresh_token = null;
let expires_in = null;
let expires_at = null;

window.discord_sdk_is_ready = function() {
    return window.discord_sdk_ready;
}
  
function sdk() {
    /** @type {DiscordSDK} */
    const discord_sdk = window.discord_sdk;
    return discord_sdk;
}
  
window.discord_sdk_get_client_id = function() {
    if (sdk()) return sdk().clientId || "";
}
  
window.discord_sdk_get_channel_id = function() {
    if (sdk()) return sdk().channelId || "";
}
  
window.discord_sdk_get_guild_id = function() {
    if (sdk()) return sdk().guildId || "";
}
  
window.discord_sdk_get_instance_id = function() {
    if (sdk()) return sdk().instanceId;
}
  
window.discord_sdk_get_frame_id = function() {
    const p = new URLSearchParams(window.location.href);
    return p.get('frame_id');
}
  
window.discord_sdk_get_platform = function() {
    if (sdk()) return sdk().platform;
}
  
window.discord_sdk_commands_authorize = async function(backend_url,scopes=['identify']) {
    const { code } = await sdk().commands.authorize({
        client_id: sdk().clientId,
        response_type: "code",
        state: '',
        prompt: 'none',
        scope: scopes,
    });
    console.log(`Discord OAuth code obtained`)
    //window.gml_Script_gmcallback_discord_sdk_callback(null,null,'DISCORD_OAUTH_CODE',JSON.stringify({code}));
  
    const result = await fetch(backend_url,{
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            code
        }),
    });
  
    const json = await result.json();
    console.log(json);
    access_token = json.access_token;
    refresh_token = json.refresh_token;
    expires_in = json.expires_in;
    expires_at = Date.now() + (expires_in*1000);
  
    //token = access_token; // store for later use
    //refresh = refresh_token;
  
    const auth = await sdk().commands.authenticate({ access_token });
    if (auth == null) {
        console.log('Authentication failed')
    }
    window.gml_Script_gmcallback_discord_sdk_callback(null,null,`DISCORD_AUTHORIZE_SUCCESS`,JSON.stringify(json));
}
  
const discord_sdk_commands = {
    async capture_log(message,level='info'){
        await sdk().commands.captureLog({
            level,  // debug, error, info, log, warn
            message,
        });
    },
    async encourage_hardware_acceleration(request_id){
        const result = await sdk().commands.encourageHardwareAcceleration();
        console.log(`Encourage hw acceleration`);
        console.log(result);
        window.gml_Script_gmcallback_discord_sdk_callback(null,null,`DISCORD_COMMAND_ENCOURAGE_HARDWARE_ACCELERATION`,JSON.stringify({result}),request_id);
    },
    async get_channel(request_id, channel_id = sdk().channelId){
        const result = await sdk().commands.getChannel({ channel_id });
        window.gml_Script_gmcallback_discord_sdk_callback(null,null,`DISCORD_COMMAND_GET_CHANNEL`,JSON.stringify({channel: result}),request_id);
    },
    async get_channel_permissions(request_id){
        const result = await sdk().commands.getChannelPermissions();
        window.gml_Script_gmcallback_discord_sdk_callback(null,null,`DISCORD_COMMAND_GET_CHANNEL`,JSON.stringify({permissions: result}),request_id);
    },
    async get_entitlements(request_id){
        const result = await sdk().commands.getEntitlements();
        window.gml_Script_gmcallback_discord_sdk_callback(null,null,`DISCORD_COMMAND_GET_ENTITLEMENTS`,JSON.stringify({entitlements: result.entitlements}),request_id);
    },
    async get_platform_behaviours(request_id){
        const result = await sdk().commands.getPlatformBehaviors();
        window.gml_Script_gmcallback_discord_sdk_callback(null,null,`DISCORD_COMMAND_GET_PLATFORM_BEHAVIOURS`,JSON.stringify({behaviours: result}),request_id);
    },
    async get_skus(request_id){
        const result = await sdk().commands.getSkus();
        window.gml_Script_gmcallback_discord_sdk_callback(null,null,`DISCORD_COMMAND_GET_SKUS`,JSON.stringify({skus: result.skus}),request_id);
    },
    async initiate_image_upload(request_id){
        const result = await sdk().commands.initiateImageUpload();
        window.gml_Script_gmcallback_discord_sdk_callback(null,null,`DISCORD_COMMAND_INITIATE_IMAGE_UPLOAD`,JSON.stringify({image: result.image_url}),request_id);
    },
    async open_external_link(request_id, url){
        const result = await sdk().commands.openExternalLink({ url });
  
    },
    async open_invite_dialog(request_id){
        const result = await sdk().commands.openInviteDialog();
  
    },
    async open_share_moment_dialog(request_id, media_url) {
        const result = await sdk().commands.openShareMomentDialog({mediaUrl: media_url});
  
    },
    async set_activity(request_id, activity){
        const result = await sdk().commands.setActivity({ activity: JSON.parse(activity) });
        window.gml_Script_gmcallback_discord_sdk_callback(null,null,`DISCORD_COMMAND_SET_ACTIVITY`,JSON.stringify({activity: result}),request_id);
    },
    async set_config(request_id, use_interactive_pip){
        const result = await sdk().commands.setConfig({use_interactive_pip});
        window.gml_Script_gmcallback_discord_sdk_callback(null,null,`DISCORD_COMMAND_SET_CONFIG`,JSON.stringify({config: result}),request_id);
    },
    async set_orientation_lock_state(request_id, lock_state, grid_lock_state, picture_in_picture_lock_state){
        const result = await sdk().commands.setOrientationLockState({lock_state, grid_lock_state, picture_in_picture_lock_state});
      
    },
    async start_purchase(request_id, sku_id){
        const result = await sdk().commands.startPurchase({sku_id});
        window.gml_Script_gmcallback_discord_sdk_callback(null,null,`DISCORD_COMMAND_START_PURCHASE`,JSON.stringify({purchases: result}),request_id);
    },
    async user_settings_get_locale(request_id){
        const result = await sdk().commands.userSettingsGetLocale();
        window.gml_Script_gmcallback_discord_sdk_callback(null,null,`DISCORD_COMMAND_USER_SETTINGS_GET_LOCALE`,JSON.stringify({locale: result.locale}),request_id);
    }
  }
  
window.discord_sdk_command = function(arg_array) {
    const [command,request_id,...args] = JSON.parse(arg_array);
  
    const cmd = discord_sdk_commands[command];
    console.log(arg_array);
    console.log(`Calling discord_sdk_commands.${cmd}`)
    if (cmd) {
        cmd(request_id,...args);
        return request_id;
    } else {
        return -1;
    }
}
  
  
window.discord_sdk_ready = false;
window.discord_sdk_setup = async function (id) {
    window.discord_sdk = new DiscordSDK(id);
    window.discord_sdk.ready();
  
    window.discord_sdk_ready = true;
    window.discord_sdk_subscribe('READY');
    window.discord_sdk_subscribe('ERROR');
    console.log(`Discord SDK initialised`);
}
  
window.discord_sdk_set_share_surface_size = function(width,height) {
    const canvas = document.querySelector('#gmsurface');
    canvas.width = width;
    canvas.height = height;
}
  
window.discord_sdk_upload_share_surface = function(request_id, surface_data,width,height) {
    // discord.com/api/applications/${applicationId}/attachment
    const canvas = document.createElement('canvas');
    canvas.width = width;
    canvas.height = height;
    const ctx = canvas.getContext('2d');
    const uint8_data = new Uint8ClampedArray(surface_data);
    const image = new ImageData(uint8_data,width,height,{});
    ctx.putImageData(image,0,0);
    // and then throw the canvas off to Discord
  
    canvas.toBlob(async(blob)=>{
        const body = new FormData();
        const file = new File([await blob.arrayBuffer()],'share.png', {type: blob.type});
        body.append('file',file);
        const response = await fetch(`https://discord.com/api/applications/${sdk().clientId}/attachment`, {
            method: 'POST',
            headers: {
                Authorization: `Bearer ${access_token}`,
            },
            body
        });
        const json = await response.json();
        window.gml_Script_gmcallback_discord_sdk_callback(null,null,`DISCORD_SHARE_MEDIA_UPLOADED`,JSON.stringify(json),request_id);
    },'image/png');
}
  
window.discord_sdk_subscribe = function(event) {
    sdk().subscribe(event, (data)=>{
        window.gml_Script_gmcallback_discord_sdk_callback(null,null,`DISCORD_${event}`,JSON.stringify(data))
    });
} 
window.discord_sdk_unsubscribe = function(event) {
    sdk().unsubscribe(event)
}