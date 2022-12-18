if(self.action == "exit"){
	game_end();
}


if(self.action == "start_server"){
	room_goto(Create_game);
}

if(self.action == "servers_list"){
	room_goto(Servers_list);
}

if(self.action == "start"){
	// Make a request to create a server
	create_game(obj_game.game_name,obj_game.gamer_name);
}

if(self.action == "start_game"){
	start_game(obj_game.game_id,obj_game.gamer_id);
}