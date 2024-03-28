/// @description 
if (is_local_player) {
	var ud = keyboard_check(ord("S")) - keyboard_check(ord("W"));
	var lr = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	
	x += lr * 4;
	y += ud * 4;
	
} else {
	x = obj_discord_sdk_example.members[$ user_id].x;
	y = obj_discord_sdk_example.members[$ user_id].y;
}