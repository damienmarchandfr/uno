if(obj_game.server_down){
	self.sprite_index = spr_server_error;
	self.visible = true;
	return;
}

self.visible = obj_game.http_loading;

