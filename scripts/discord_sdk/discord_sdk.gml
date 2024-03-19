function discord_sdk_setup(client_id) {
	return __discord_sdk_setup(client_id)
}

function discord_sdk_is_ready() {
	return __discord_sdk_is_ready();
}

function discord_sdk_get_client_id() {
	return __discord_sdk_get_client_id();
}

function discord_sdk_get_guild_id() {
	return __discord_sdk_get_guild_id();
}
function discord_sdk_get_channel_id() {
	return __discord_sdk_get_channel_id();
}


function discord_sdk_get_instance_id() {
	return __discord_sdk_get_instance_id();
}

function discord_sdk_get_platform() {
	return __discord_sdk_get_platform();
}

function discord_sdk_subscribe(event) {
	return __discord_sdk_subscribe(event);
}

function discord_sdk_unsubscribe(event) {
	return __discord_sdk_unsubscribe(event);
}

function gmcallback_discord_sdk_callback(type,data){
	var map = ds_map_create();
	map[? "type"] = type;
	map[? "data"] = json_parse(data);
	event_perform_async(ev_async_social,map);
}