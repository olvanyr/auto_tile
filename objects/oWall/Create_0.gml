//debug variable
//show = false;

//tille size
width = 32;
height = width;
half_width = width / 2;

//collision
right =			place_meeting(x+1,y,oWall);
left =			place_meeting(x-1,y,oWall);
top =			place_meeting(x,y-1,oWall);
bottom =		place_meeting(x,y+1,oWall);

top_left =		position_meeting(bbox_left-1,bbox_top-1,oWall);
bottom_left =	position_meeting(bbox_left-1,bbox_bottom+1,oWall);
top_right =		position_meeting(bbox_right+1,bbox_top-1,oWall);
bottom_right =	position_meeting(bbox_right+1,bbox_bottom+1,oWall);

//state machin
state = "";
#region 3side
if right && !left && !top && !bottom state =						"3side_right";
if !right && left && !top && !bottom state =						"3side_left";
if !right && !left && top && !bottom state =						"3side_top";
if !right && !left && !top && bottom state =						"3side_bottom";
#endregion

#region 2side_1corner
if right && !left && top && !bottom && !bottom_left state =																	"2side_1corner_top_right";
if !right && left && top && !bottom && !bottom_right state  =																"2side_1corner_top_left";
if right && !left && !top && bottom && !top_left state =																	"2side_1corner_bottom_right";
if !right && left && !top && bottom && !top_right state =																	"2side_1corner_bottom_left";
#endregion

#region 2side
if right && !left && top && !bottom && top_right state =																	"2side_top_right";
if !right && left && top && !bottom && top_left state =																		"2side_top_left";
if right && !left && !top && bottom && bottom_right state =																	"2side_bottom_right";
if !right && left && !top && bottom && bottom_left state =																	"2side_bottom_left";
#endregion

#region 2side_op
if !right && !left && top && bottom  state =																		"2side_op_left_right";
if right && left && !top && !bottom  state =																		"2side_op_top_bottom";
#endregion


#region 4side
if !right && !left && !top && !bottom state =															"4side";
#endregion

#region 2corner diagonal
if right && left && top && bottom && !top_left && top_right && bottom_left && !bottom_right state =		"2corner_diagonal1";
if right && left && top && bottom && top_left && !top_right && !bottom_left && bottom_right state =		"2corner_diagonal2";
#endregion

#region 1corner
if right && left && top && bottom && !top_left && top_right && bottom_left && bottom_right state =		"1corner_top_left";
if right && left && top && bottom && top_left && !top_right && bottom_left && bottom_right state =		"1corner_top_right";
if right && left && top && bottom && top_left && top_right && !bottom_left && bottom_right state =		"1corner_bottom_left";
if right && left && top && bottom && top_left && top_right && bottom_left && !bottom_right state =		"1corner_bottom_right";
#endregion

#region 2corner
if right && left && top && bottom && !top_left && !top_right && bottom_left && bottom_right state =		"2corner_top";
if right && left && top && bottom && top_left && top_right && !bottom_left && !bottom_right state =		"2corner_bottom";
if right && left && top && bottom && !top_left && top_right && !bottom_left && bottom_right state =		"2corner_left";
if right && left && top && bottom && top_left && !top_right && bottom_left && !bottom_right state =		"2corner_right";
#endregion

#region 3corner
if right && left && top && bottom && top_left && !top_right && !bottom_left && !bottom_right state =	"3corner_top_left";
if right && left && top && bottom && !top_left && top_right && !bottom_left && !bottom_right state =	"3corner_top_right";
if right && left && top && bottom && !top_left && !top_right && bottom_left && !bottom_right state =	"3corner_bottom_left";
if right && left && top && bottom && !top_left && !top_right && !bottom_left && bottom_right state =	"3corner_bottom_right";
#endregion

#region 1side
if right && !left && top && bottom && top_right && bottom_right state =		"1side_left";
if !right && left && top && bottom && top_left && bottom_left state =		"1side_right";
if right && left && !top && bottom && bottom_left && bottom_right state =	"1side_top";
if right && left && top && !bottom && top_left && top_right state =			"1side_bottom";
#endregion

#region 1side_1corner
if right && !left && top && bottom && top_right && !bottom_right state =		"1side_1corner_left";
if !right && left && top && bottom && !top_left && bottom_left state =			"1side_1corner_right";
if right && left && !top && bottom && !bottom_left && bottom_right state =		"1side_1corner_top";
if right && left && top && !bottom && top_left && !top_right state =			"1side_1corner_bottom";
#endregion

#region 1side_1corner_mirror
if right && !left && top && bottom && !top_right && bottom_right state =		"1side_1corner_mirror_left";
if !right && left && top && bottom && top_left && !bottom_left state =			"1side_1corner_mirror_right";
if right && left && !top && bottom && bottom_left && !bottom_right state =		"1side_1corner_mirror_top";
if right && left && top && !bottom && !top_left && top_right state =			"1side_1corner_mirror_bottom";
#endregion

#region 1side_2corner
if right && !left && top && bottom && !top_right && !bottom_right state =		"1side_2corner_left";
if !right && left && top && bottom && !top_left && !bottom_left state =			"1side_2corner_right";
if right && left && !top && bottom && !bottom_left && !bottom_right state =		"1side_2corner_top";
if right && left && top && !bottom && !top_left && !top_right state =			"1side_2corner_bottom";
#endregion

#region 4corner
if right && left && top && bottom && !top_left && !top_right && !bottom_left && !bottom_right state =	"4corner";
#endregion

#region borderless
if right && left && top && bottom && top_left && top_right && bottom_left && bottom_right state =	"borderless";
#endregion

//check if coord is not on the grid
if x mod width != 0 && y mod height != 0
{
	state = "free";
}


var splits = split_string(string(room_get_name(room)),"_");

zone = splits[0];

switch (state)
{
	
#region 1side
	case "1side_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side");
		auto_tile_random_sprite();
		image_angle = 270;
		x += width;
		//y += height;
	break;
	case "1side_left":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side");
		auto_tile_random_sprite();
		image_angle = 90;
		//x += width;
		y += height;
	break;
	case "1side_top":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side");
		auto_tile_random_sprite();
		
	break;
	case "1side_bottom":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side");
		auto_tile_random_sprite();
		image_angle = 180;
		x += width;
		y += height;
	break;
#endregion

#region 1side_1corner
	case "1side_1corner_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side_1corner");
		auto_tile_random_sprite();
		image_angle = 180;
		x += width;
		y += height;
	break;
	case "1side_1corner_left":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side_1corner");
		auto_tile_random_sprite();
		
	break;
	case "1side_1corner_top":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side_1corner");
		auto_tile_random_sprite();
		image_angle = 270;
		x += width;
		//y += height;
	break;
	case "1side_1corner_bottom":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side_1corner");
		auto_tile_random_sprite();
		image_angle = 90;
		//x += width;
		y += height;
	break;
#endregion

#region 1side_1corner_mirror
	case "1side_1corner_mirror_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side_1corner_mirror");
		auto_tile_random_sprite();
		image_angle = 180;
		x += width;
		y += height;
	break;
	case "1side_1corner_mirror_left":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side_1corner_mirror");
		auto_tile_random_sprite();
		
	break;
	case "1side_1corner_mirror_top":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side_1corner_mirror");
		auto_tile_random_sprite();
		image_angle = 270;
		x += width;
		//y += height;
	break;
	case "1side_1corner_mirror_bottom":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side_1corner_mirror");
		auto_tile_random_sprite();
		image_angle = 90;
		//x += width;
		y += height;
	break;
#endregion

#region 1side_2corner
	case "1side_2corner_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side_2corner");
		auto_tile_random_sprite();
		image_angle = 270;
		x += width;
		//y += height;
	break;
	case "1side_2corner_left":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side_2corner");
		auto_tile_random_sprite();
		image_angle = 90;
		//x += width;
		y += height;
	break;
	case "1side_2corner_top":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side_2corner");
		auto_tile_random_sprite();
		
	break;
	case "1side_2corner_bottom":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1side_2corner");
		auto_tile_random_sprite();
		image_angle = 180;
		x += width;
		y += height;
	break;
#endregion

#region 2side
	case "2side_top_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2side");
		auto_tile_random_sprite();
		image_angle = 90;
		//x += width;
		y += height;
	break;
	case "2side_top_left":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2side");
		auto_tile_random_sprite();
		image_angle = 180;
		x += width;
		y += height;
	break;
	case "2side_bottom_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2side");
		auto_tile_random_sprite();
		
	break;
	case "2side_bottom_left":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2side");
		auto_tile_random_sprite();
		image_angle = 270;
		x += width;
		//y += height;
	break;
#endregion

#region 2side_op
	case "2side_op_left_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2side_op");
		auto_tile_random_sprite();
		image_angle = 90;
		//x += width;
		y += height;
	break;
	case "2side_op_top_bottom":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2side_op");
		auto_tile_random_sprite();
	break;
#endregion

#region 2side_1corner
	case "2side_1corner_top_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2side_1corner");
		auto_tile_random_sprite();
		image_angle = 90;
		//x += width;
		y += height;
	break;
	case "2side_1corner_top_left":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2side_1corner");
		auto_tile_random_sprite();
		image_angle = 180;
		x += width;
		y += height;
	break;
	case "2side_1corner_bottom_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2side_1corner");
		auto_tile_random_sprite();
		
	break;
	case "2side_1corner_bottom_left":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2side_1corner");
		auto_tile_random_sprite();
		image_angle = 270;
		x += width;
		//y += height;
	break;
#endregion

#region 3side
	case "3side_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_3side");
		auto_tile_random_sprite();
	break;
	case "3side_left":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_3side");
		auto_tile_random_sprite();
		image_angle = 180;
		x += width;
		y += height;
	break;
	case "3side_top":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_3side");
		auto_tile_random_sprite();
		image_angle = 90;
		//x += width;
		y += height;
	break;
	case "3side_bottom":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_3side");
		auto_tile_random_sprite();
		image_angle = 270;
		x += width;
		//y += height;
	break;
#endregion

#region 4side
	case "4side":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_4side");
		auto_tile_random_sprite();
	break;
#endregion

#region 3corner
	case "1corner_top_left":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1corner");
		auto_tile_random_sprite();
		image_angle = 180;
		x += width;
		y += height;
	break;
	case "1corner_top_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1corner");
		auto_tile_random_sprite();
		image_angle = 90;
		//x += width;
		y += height;
	break;
	case "1corner_bottom_left":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1corner");
		auto_tile_random_sprite();
		image_angle = 270;
		x += width;
		//y += height;
	break;
	case "1corner_bottom_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_1corner");
		auto_tile_random_sprite();
		
	break;
#endregion

#region 2corner diagonal
	case "2corner_diagonal1":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2corner_diagonal");
		auto_tile_random_sprite();
	break;
	case "2corner_diagonal2":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2corner_diagonal");
		auto_tile_random_sprite();
		image_angle = 270;
		x += width;
		//y += height;
	break;
#endregion

#region 2corner
	case "2corner_top":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2corner");
		auto_tile_random_sprite();
		image_angle = 90;
		//x += width;
		y += height;
	break;
	case "2corner_bottom":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2corner");
		auto_tile_random_sprite();
		image_angle = 270;
		x += width;
		//y += height;
	break;
	case "2corner_left":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2corner");
		auto_tile_random_sprite();
		image_angle = 180;
		x += width;
		y += height;
		
	break;
	case "2corner_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_2corner");
		auto_tile_random_sprite();
	break;
#endregion

#region 3corner
	case "3corner_top_left":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_3corner");
		auto_tile_random_sprite();
	break;
	case "3corner_top_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_3corner");
		auto_tile_random_sprite();
		image_angle = 270;
		x += width;
		//y += height;
	break;
	case "3corner_bottom_left":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_3corner");
		auto_tile_random_sprite();
		image_angle = 90;
		//x += width;
		y += height;
	break;
	case "3corner_bottom_right":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_3corner");
		auto_tile_random_sprite();
		image_angle = 180;
		x += width;
		y += height;
	break;
#endregion

#region 4corner
	case "4corner":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_4corner");
		auto_tile_random_sprite();
	break;
#endregion

#region borderless
	case "borderless":
		sprite_index = asset_get_index("sTille_" + string(zone) + "_borderless");
		auto_tile_random_sprite();
	break;
#endregion
}



//debug

//show_debug_message(string(zone));


if show
{
	show_debug_message("++++++++++++++++++++++++++++++++++++++++++");
	show_debug_message("state : " + string(state));

	show_debug_message("++++++++++++++++++++++++++++++++++++++++++");
	/*
	show_debug_message("++++++++++++++++++++++++++++++++++++++++++");
	show_debug_message("left : " + string(left));
	show_debug_message("right : " + string(right));
	show_debug_message("top : " + string(top));
	show_debug_message("bottom : " + string(bottom));
	show_debug_message("top_left : " + string(top_left));
	show_debug_message("bottom_left : " + string(bottom_left));
	show_debug_message("top_right : " + string(top_right));
	show_debug_message("bottom_right : " + string(bottom_right));
	show_debug_message("++++++++++++++++++++++++++++++++++++++++++");
	*/
	
}

