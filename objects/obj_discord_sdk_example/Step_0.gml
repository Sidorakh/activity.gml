/// @description 




if (width != browser_width || height != browser_height) {
	width = browser_width;
	height = browser_height;
	window_set_size(width, height);
}

if (keyboard_check_pressed(ord("1"))) {
	discord_sdk_commands_encourage_hardware_acceleration();
}
if (keyboard_check_pressed(ord("2"))) {
	discord_sdk_commands_get_channel();
}
if (keyboard_check_pressed(ord("3"))) {
	discord_sdk_commands_get_channel_permissions();
}
if (keyboard_check_pressed(ord("4"))) {
	discord_sdk_commands_get_entitlements();
}
if (keyboard_check_pressed(ord("5"))) {
	discord_sdk_commands_get_platform_behaviours();
}
if (keyboard_check_pressed(ord("6"))) {
	discord_sdk_commands_get_skus();
}
if (keyboard_check_pressed(ord("7"))) {
	discord_sdk_commands_initiate_image_upload();
}
if (keyboard_check_pressed(ord("8"))) {
	discord_sdk_commands_open_external_link("https://example.com");
}
if (keyboard_check_pressed(ord("9"))) {
	discord_sdk_commands_open_invite_dialog();
}
if (keyboard_check_pressed(ord("0"))) {
	discord_sdk_commands_open_share_moment_dialog("")
}
if (keyboard_check_pressed(ord("Q"))) {
	discord_sdk_commands_set_activity({type: 0, details: "Details, details.. Who needs 'em",state: "a real estate hah gottem"});
}
if (keyboard_check_pressed(ord("W"))) {
	discord_sdk_commands_set_config(true);
}
if (keyboard_check_pressed(ord("E"))) {
	discord_sdk_commands_set_orientation_lock_state(1,1,1);	// who knows
}
if (keyboard_check_pressed(ord("R"))) {
	discord_sdk_commands_start_purchase("6942069");
}
if (keyboard_check_pressed(ord("T"))) {
	discord_sdk_commands_user_settings_get_locale();
}

