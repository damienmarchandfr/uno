if(self.action == "start_game"){
	if(room == Game && !obj_game.game_started && obj_game.is_creator){
	// Display start_game button
	self.visible = true;
	}else{
		self.visible = false;
	}
}





