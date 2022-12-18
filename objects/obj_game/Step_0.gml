if(room != self.current_room){
	if(room == Servers_list && self.current_room != Servers_list){
		self.get_server_list_request = get_servers_list()
		self.http_loading = true;
	}
	
	self.current_room = room;
}

