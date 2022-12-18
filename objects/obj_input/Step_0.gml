if(obj_game.input_focused_id && obj_game.input_focused_id == self.id){
	if(string_length(keyboard_string) <= 10){
		self.input_value = keyboard_string;
	}else{
		keyboard_string = self.input_value;
	}
	
	if(self.input_type == "game_name"){
		obj_game.game_name = self.input_value;
	}
	if(self.input_type == "gamer_name"){
		obj_game.gamer_name = self.input_value;
	}
}

