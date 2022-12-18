var type = ds_map_find_value(async_load,"type");

if(type == network_type_non_blocking_connect){
	
}

if(type == network_type_disconnect){
	
}

if(type == network_type_data){
	var buffer = ds_map_find_value(async_load,"buffer");
	var cmd = buffer_read(buffer,buffer_text);
	
	var data = json_parse(cmd);
	
	show_debug_message(data);
	
	switch (data.action)
	{
	    case "created_game":
			self.gamer_id = data.gamer_id;
			self.gamer_name = data.gamer_name;
			self.game_id = data.game_id;
			self.game_name = data.game_name;
			self.game_started = data.game_started;
			self.is_creator = true;
			room_goto(Game);
			break;
		case "started_game":
			show_debug_message("Game started from WS");
			self.game_started = true;
			self.hand = data.hand;
			break;

	    default:
	        break;
	} 
}


