if(room != self.current_room){
	if(room == Servers_list && self.current_room != Servers_list){
		self.get_server_list_request = get_servers_list()
		self.http_loading = true;
	}
	self.current_room = room;
}

if(room == Game){
	if(array_length(self.hand) && array_length(self.hand) != array_length(self.cards)){
		array_foreach(self.hand,function(card,i){
			var c = instance_create_layer(i * (inst_card.sprite_width/3)*2,window_get_height() - (inst_card.sprite_height /3)*2,"Instances",obj_card);
			c.card_type = card.type;
			c.in_hand = true;
			array_push(self.cards,c);
		})
	}
}

