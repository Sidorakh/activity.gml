/// @description 

if (async_load[? "id"] != socket) return;

var type = async_load[? "type"];

if (type == network_type_connect || type == network_type_non_blocking_connect) {
	var succeeded = true;
	if (type == network_type_non_blocking_connect) {
		succeeded = async_load[? "succeeded"];
	}
	if (succeeded = false) {
		show_message_async("Connection failed. Try again later");
		return;
	}
	
	send_position_call_later = call_later(0.1,time_source_units_seconds,send_position,true);
}

if (type == network_type_data) {
	var buffer = async_load[? "buffer"];
	var body = buffer_read(buffer,buffer_text);
	var packet = json_parse(body);
	//show_debug_message(body);
	if (packet.type == "update-position") {
		var names = variable_struct_get_names(packet.parameters);
		//show_debug_message(json_stringify(names));
		for (var i=0;i<array_length(names);i++) {
			members[$ names[i]].x = packet.parameters[$ names[i]].x;
			members[$ names[i]].y = packet.parameters[$ names[i]].y;
		}
	}
	//show_debug_message(json_stringify(members));
}