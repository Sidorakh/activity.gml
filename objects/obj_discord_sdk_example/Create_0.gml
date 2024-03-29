/// @description 
// Discord Client ID
client_id = "1219424590342782987";
discord_sdk_setup(client_id);

width = 0;
height = 0;

cmd = noone;

user_id = "";

share_request = -1;

socket = network_create_socket(network_socket_wss);

// basic multiplayer stuff

function send_position() {
	var inst = noone;
	with (obj_discord_avatar) {
		if (user_id == other.user_id) {
			inst = self;
		}
	}
	if (instance_exists(inst)) {
		var packet = json_stringify({type: "update-position", parameters: {x: inst.x, y: inst.y}});
		//show_debug_message(packet);
		var buff = buffer_create(string_length(packet),buffer_fixed,1);
		buffer_write(buff,buffer_text,packet);
		network_send_raw(socket,buff,buffer_tell(buff),network_send_text);
		buffer_delete(buff);
	}
}

send_position_call_later = undefined;

function add_member(data) {
	var member = {
		name: data[$ "nickname"] ?? (data[$ "global_name"]),
		id: data.id,
		avatar_url: discord_avatar_url(data.id,data.avatar,64),
		instance: noone,
		x: room_width/2,
		y: room_height/2,
	};
	member.instance = instance_create_layer(room_width/2,room_height/2,"Instances",obj_discord_avatar,{avatar_url: member.avatar_url, user_id: member.id, is_local_player: member.id == user_id});
	members[$ data.id] = member;
}

function update_member(data) {
	members[$ data.id].name = data[$ "nickname"] ?? (data[$ "global_name"] ?? data[$ "username"]);
	avatar_url = discord_avatar_url(data.id,data.avatar,64);
}


members = {};