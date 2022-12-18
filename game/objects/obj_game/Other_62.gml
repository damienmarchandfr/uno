var request_id = ds_map_find_value(async_load, "id");
var request_status =  ds_map_find_value(async_load, "status");

var data_str = ds_map_find_value(async_load, "result");

if(request_status == -1){
	self.server_down = true;
	self.http_loading = false;
	return;
}

var data = json_parse(data_str);

show_debug_message("HTTP");
show_debug_message(data);


if(request_id == get_game_request){
	
}


if (request_id == self.get_server_list_request){
	if(room == Servers_list){
		for(var i=0; i<array_length(data);i++){
			var x_i = camera_get_view_width(view_camera[0]) / 2;
			instance_create_layer(x_i,70 + i*50,"Instances",obj_server_list,{
				game_id : data[i].id,
				creator_name : data[i].creator_name,
				game_name: data[i].game_name,
				number_of_gamers: data[i].number_of_gamers
			});
		}
	}   
}


self.http_loading = false;



