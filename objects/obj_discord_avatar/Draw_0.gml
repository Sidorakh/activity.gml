/// @description 
var col = c_white;
if (speaking) col = c_red;
//draw_self();
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,col,1);

draw_text(bbox_left,bbox_top-12,$"x: {obj_discord_sdk_example.members[$ user_id].x} | y: {obj_discord_sdk_example.members[$ user_id].y}");