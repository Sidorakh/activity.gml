// The only permitted types of presence
enum DISCORD_PRESENCE_TYPES {
    PLAYING = 0,
    // STREAMING = 1,
    LISTENING = 2,
    WATCHING = 3,
    // CUSTOM = 4,
    // COMPETING = 5,
}

function is_discord() {
	return __discord_sdk_is_discord();
}

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

function discord_sdk_get_frame_id() {
	return __discord_sdk_get_frame_id();
}

function discord_sdk_get_platform() {
	return __discord_sdk_get_platform();
}

function discord_sdk_subscribe(event, args=undefined) {
	if (args == undefined) {
		return __discord_sdk_subscribe(event);
	} else {
		return __discord_sdk_subscribe(event,json_stringify(args));
	}
}

function discord_sdk_unsubscribe(event) {
	return __discord_sdk_unsubscribe(event);
}

function discord_sdk_commands_authorize(backend_url,scopes=["identify"]) {
	__discord_sdk_scopes(scopes);
	/// feather ignore once GM1041
	__discord_sdk_commands_authorize(backend_url,scopes);
	
}

function __discord_sdk_scopes() {
	static scopes = [];
	if (argument_count > 0) {
		scopes = argument[0];
	}
	return scopes;
}


function discord_sdk_request_count() {
	static request_id = 0;
	return request_id++;
}

function discord_sdk_command_run(command,args=undefined) {
	var request_id = discord_sdk_request_count();
	var params = [command,request_id];
	if (is_array(args)) {
		for (var i=0;i<array_length(args);i++) {
			array_push(params,args[i]);
		}
	}
	show_debug_message(command);
	show_debug_message(args);
	var result = __discord_sdk_command(json_stringify(params));
	//show_message_async($"Request ID: {result}");
	if (result >= 0) {
		return request_id;
	} else {
		return result
	}
}

function discord_sdk_commnads_capture_log(message,level="info") {
	return discord_sdk_command_run("capture_log",[message,level]);
}

function discord_sdk_commands_encourage_hardware_acceleration() {
	return discord_sdk_command_run("encourage_hardware_acceleration");
}

function discord_sdk_commands_get_channel(channel_id = discord_sdk_get_channel_id()) {
	return discord_sdk_command_run("get_channel",[channel_id]);
}

function discord_sdk_commands_get_channel_permissions() {
	return discord_sdk_command_run("get_channel_permissions");
}

function discord_sdk_commands_get_entitlements() {
	return discord_sdk_command_run("get_entitlements");
}

function discord_sdk_commands_get_platform_behaviours() {
	return discord_sdk_command_run("get_platform_behaviours");
}

function discord_sdk_commands_get_skus() {
	return discord_sdk_command_run("get_skus");
}

function discord_sdk_commands_initiate_image_upload() {
	return discord_sdk_command_run("initiate_image_upload");
}

function discord_sdk_commands_open_external_link(url) {
	return discord_sdk_command_run("open_external_link",[url]);
}

function discord_sdk_commands_open_invite_dialog() {
	return discord_sdk_command_run("open_invite_dialog");
}

function discord_sdk_commands_open_share_moment_dialog(media_url) {
	return discord_sdk_command_run("open_share_moment_dialog",[media_url]);
}

function discord_sdk_commands_set_activity(activity) {
	if (is_instanceof(activity, DiscordRichPresence)) {
		activity = activity.build_data();
		show_debug_message(activity);
	}
	return discord_sdk_command_run("set_activity",[json_stringify(activity)]);
}

function discord_sdk_commands_set_config(use_interactive_pip) {
	return discord_sdk_command_run("set_config",[use_interactive_pip]);
}

function discord_sdk_commands_set_orientation_lock_state(lock_state,grid_lock_state,pip_lock_state) {
	return discord_sdk_command_run("set_orientation_lock_state",[lock_state,grid_lock_state,pip_lock_state])
}	

function discord_sdk_commands_start_purchase(sku_id) {
	return discord_sdk_command_run("start_purchase",[sku_id]);
}

function discord_sdk_commands_user_settings_get_locale() {
	return discord_sdk_command_run("user_settings_get_locale");
}

function discord_sdk_commands_get_instance_connected_participants() {
	return discord_sdk_command_run("get_instance_connected_participants");
}

function discord_sdk_upload_share_surface(surface_data) {
	var request_id = discord_sdk_request_count();
	var w = surface_get_width(surface_data);
	var h = surface_get_height(surface_data);
	var buff = buffer_create(w*h*4,buffer_fixed,1);
	buffer_get_surface(buff,surface_data,0);
	/// feather ignore once GM1041
	__discord_sdk_upload_share_surface(request_id,buffer_get_address(buff),w,h);
	/// feather ignore once GM1041
	
	buffer_delete(buff);
	return request_id;
}

function discord_avatar_url(user_id, avatar, size=undefined) {
	if (avatar == undefined) {
		if (size == undefined) {
			return $"https://cdn.discordapp.com/embed/avatars/{(int64(user_id) >> 22) mod 6}.png";
		} else {
			return $"https://cdn.discordapp.com/embed/avatars/{(int64(user_id) >> 22) mod 6}.png?size={size}";
		}
	}
	if (size == undefined) {
		return $"https://cdn.discordapp.com/avatars/{user_id}/{avatar}.png";
	} else {
		return $"https://cdn.discordapp.com/avatars/{user_id}/{avatar}.png?size={size}";
	}
}


// validates requested scopes
function discord_sdk_check_scopes(event) {
	static event_scope_lut = {
		"READY": "",
		"ERROR": "",
		"VOICE_STATE_UPDATE": "rpc.voice.read",
		"SPEAKING_START": "rpc.voice.read",
		"SPEAKING_STOP": "rpc.voice.read",
		"ACTIVITY_MODE_LAYOUT_UPDATE": "",
		"ORIENTATION_UPDATE": "",
		"CURRENT_USER_UPDATE": "identity",
		"THERMAL_STATE_UPDATE": "",
		"ACTIVITY_INSTANCE_PARTICIPANTS_UPDATE":"",
		"ENTITLEMENT_CREATE": "",
	};
	
	var scope = event_scope_lut[$ event];
	if (scope == "") return true;
	return (array_contains(__discord_sdk_scopes(),scope));
}

function DiscordRichPresence() constructor {
	type = undefined;
	details = undefined;
	state = undefined;
	timestamps = undefined;
	secrets = undefined;
	party = undefined;
	large_asset = undefined;
	small_asset = undefined;
	static set_type = function(_type) {
		self.type = _type;
		return self;
	}
	static set_details = function(_details) {
		self.details = _details;
		return self;
	}
	static set_state = function(_state) {
		self.state = _state;
		return self;
	}
	static set_timestamps = function(start, finish) {
		self.timestamps = {
			"start": start,
			"end": finish,
		};
		return self;
	}
	static set_secrets = function(join,match) {
		self.secrets = {
			join: join,
			match: match,
		}
		return self;
	}
	static set_party = function (party_id,current_size,max_size) {
		self.party = {
			id: party_id,
			size: [current_size,max_size],
		}
		return self;
	}
	static set_large_asset = function(key,text){
		self.large_asset = {
			key: key,
			text: text,
		}
		return self;
	}
	static set_small_asset = function(key,text){
		self.small_asset = {
			key: key,
			text: text,
		}
		return self;
	}
	static build_data = function() {
		var data = {};
		if (self.type != undefined) {
			data.type = self.type;
		}
		if (self.details != undefined) {
			data.details = self.details;
		}
		if (self.state != undefined) {
			data.state = self.state;
		}
		if (self.timestamps != undefined) {
			data.timestamps = self.timestamps;
		}
		if (self.secrets != undefined) {
			data.secrets = self.secrets;
		}
		if (self.party != undefined) {
			data.party = self.party;
		}
		if (self.large_asset != undefined) {
			data.assets = {
				large_image: large_asset.key,
				large_text: large_asset.text,
			}
		}
		if (self.small_asset != undefined) {
			if (data.assets == undefined) {
				data.assets = {}
			}
			data.assets.small_image = small_asset.key;
			data.assets.small_text = small_asset.text;
		}
		return data;
	}
	
}



function gmcallback_discord_sdk_callback(type,data,request_id = undefined){
	//show_message_async("Discord SDK event received")
	show_debug_message($"SDK event received: \nType: {type}\nData: {data}\nReq. ID: {request_id ?? -1}");
	var map = ds_map_create();
	map[? "type"] = type;
	map[? "is_discord_event"] = true;
	map[? "data"] = json_parse(data);
	if (request_id != undefined) { 
		map[? "id"] = request_id;
	}
	event_perform_async(ev_async_social,map);
}