// Load sprite
if(self.input_type == "game_name"){
	self.sprite_index = spr_input_game_name;
}
if(self.input_type == "gamer_name"){
	self.sprite_index = spr_input_gamer_name;
}

self.input_value = "";

self.cursor = "|";
alarm[0] = self.cursor_delay;