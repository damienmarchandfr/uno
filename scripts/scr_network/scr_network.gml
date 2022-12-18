function create_game(game_name,gamer_name){
	var t_buffer = buffer_create(0, buffer_grow, 1);
	buffer_write(t_buffer,buffer_text,json_stringify({
		action: "create_game",
		game_name : game_name,
		gamer_name : gamer_name
	}))
	network_send_raw(obj_game.socket, t_buffer, buffer_get_size(t_buffer),network_send_text);
	buffer_delete(t_buffer);
}

function start_game(game_id, creator_id){
	var t_buffer = buffer_create(0,buffer_grow,1);
	buffer_write(t_buffer,buffer_text,json_stringify({
		action : "start_game",
		game_id : game_id,
		creator_id : creator_id
	}))
	network_send_raw(obj_game.socket, t_buffer, buffer_get_size(t_buffer),network_send_text);
	buffer_delete(t_buffer);
}

function get_servers_list(){
	var get = http_get("http://localhost:3000/games");
	return get
}

function ping_server(){
	var ping = http_get("http://localhost:3000/ping");
	return ping;
}