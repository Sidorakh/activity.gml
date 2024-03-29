/// @description 
var str = "if you can see this, discord has worked\n";

if (discord_sdk_is_ready()) {
	str += $"client id: {discord_sdk_get_client_id()}\n";
	str += $"channel id: {discord_sdk_get_channel_id()}\n";
	str += $"guild id: {discord_sdk_get_guild_id()}\n";
	str += $"instance id: {discord_sdk_get_instance_id()}\n";
	str += $"frame id: {discord_sdk_get_frame_id()}\n";
	str += $"platform: {discord_sdk_get_platform()}\n";
}

draw_text(4,4,str);
