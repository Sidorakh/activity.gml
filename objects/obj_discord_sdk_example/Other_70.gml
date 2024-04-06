/// @description 
//if (async_load[? "is_discord_event"] != true) return;

var type = async_load[? "type"];
var data = async_load[? "data"];
//show_debug_message($"Type: {type}");
//show_debug_message($"Data: {json_stringify(data)}");
show_debug_message($"Type: {type}\nData: {json_stringify(data)}")
if (type == "DISCORD_READY") {
    //show_message_async(type)
    //show_message_async(data)
	// code exchange for OAuth - should be a relative URL
	discord_sdk_commands_authorize("/api/auth/token",["identify","guilds","rpc.voice.read","rpc.activities.write"]);
} else {
	//show_message_async($"Type: {type}");
	//show_message_async($"Data: {json_stringify(data)}");
}

if (type == "DISCORD_AUTHORIZE_SUCCESS") {
	user_id = data.user_data.id;
	show_message_async($"Data: {json_stringify(data,true)}");
	// subscribe to relevant events
	discord_sdk_subscribe("VOICE_STATE_UPDATE");
	discord_sdk_subscribe("SPEAKING_START");
	discord_sdk_subscribe("SPEAKING_STOP")
	discord_sdk_subscribe("ACTIVITY_LAYOUT_MODE_UPDATE");
	discord_sdk_subscribe("ORIENTATION_UPDATE");
	discord_sdk_subscribe("CURRENT_USER_UPDATE");
	discord_sdk_subscribe("THERMAL_STATE_UPDATE");
	discord_sdk_subscribe("ACTIVITY_INSTANCE_PARTICIPANTS_UPDATE");
	discord_sdk_subscribe("ENTITLEMENT_CREATE");
	
	
	network_connect_raw_async(socket,$"wss://{client_id}.discordsays.com/{data.user_data.id}/{data.websocket_token}/{discord_sdk_get_instance_id()}/",443);
}

if (string_starts_with(type,"DISCORD_COMMAND")) {
	//show_message_async($"Type: {type}\nData: {json_stringify(data,true)}");
}

if (type == "DISCORD_ACTIVITY_INSTANCE_PARTICIPANTS_UPDATE") {
	for (var i=0;i<array_length(data.participants);i++) {
		var member = data.participants[i]
		if (members[$ member.id] == undefined) {
			add_member(member);
		}
		
	}
}

if (async_load[? "id"] == share_request && share_request != -1) {
	discord_sdk_commands_open_share_moment_dialog(data.attachment.url);
}