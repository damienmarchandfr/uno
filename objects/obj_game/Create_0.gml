self.socket = network_create_socket(network_socket_ws);
network_connect_raw_async(self.socket, "127.0.0.1", 8080);

self.gamer_id = noone;
self.game_id = noone;
self.game_started = false;
self.is_creator = false;
self.hand = [];

// HTTP
self.get_server_list_request = noone;
self.get_game_request = noone;
ping_server();

self.http_loading = true;
self.server_down = false;

// Inputs
self.input_focused_id = noone;
self.gamer_name = "";
self.game_name = "";

// Trigger loading in servers list
self.current_room = room;

// Cards sprites mapping
self.sprites_map = ds_map_create();

ds_map_set(self.sprites_map, "BACK", 1);

ds_map_set(self.sprites_map, "A+4", 2);
ds_map_set(self.sprites_map, "A", 3);

// RED
ds_map_set(self.sprites_map, "RP", 4);
ds_map_set(self.sprites_map, "RR", 5);
ds_map_set(self.sprites_map, "R+2", 6);

ds_map_set(self.sprites_map, "R0", 7);
ds_map_set(self.sprites_map, "R1", 8);
ds_map_set(self.sprites_map, "R2", 9);
ds_map_set(self.sprites_map, "R3", 10);
ds_map_set(self.sprites_map, "R4", 11);
ds_map_set(self.sprites_map, "R5", 12);
ds_map_set(self.sprites_map, "R6", 13);
ds_map_set(self.sprites_map, "R7", 14);
ds_map_set(self.sprites_map, "R8", 15);
ds_map_set(self.sprites_map, "R9", 16);

// YELLOW
ds_map_set(self.sprites_map, "YP", 17);
ds_map_set(self.sprites_map, "YR", 18);
ds_map_set(self.sprites_map, "Y+2", 19);

ds_map_set(self.sprites_map, "Y0", 20);
ds_map_set(self.sprites_map, "Y1", 21);
ds_map_set(self.sprites_map, "Y2", 22);
ds_map_set(self.sprites_map, "Y3", 23);
ds_map_set(self.sprites_map, "Y4", 24);
ds_map_set(self.sprites_map, "Y5", 25);
ds_map_set(self.sprites_map, "Y6", 26);
ds_map_set(self.sprites_map, "Y7", 27);
ds_map_set(self.sprites_map, "Y8", 28);
ds_map_set(self.sprites_map, "Y9", 29);

// GREEN
ds_map_set(self.sprites_map, "GP", 30);
ds_map_set(self.sprites_map, "GR", 31);
ds_map_set(self.sprites_map, "G+2", 32);

ds_map_set(self.sprites_map, "G0", 33);
ds_map_set(self.sprites_map, "G1", 34);
ds_map_set(self.sprites_map, "G2", 35);
ds_map_set(self.sprites_map, "G3", 36);
ds_map_set(self.sprites_map, "G4", 37);
ds_map_set(self.sprites_map, "G5", 38);
ds_map_set(self.sprites_map, "G6", 39);
ds_map_set(self.sprites_map, "G7", 40);
ds_map_set(self.sprites_map, "G8", 41);
ds_map_set(self.sprites_map, "G9", 42);

// BLUE
ds_map_set(self.sprites_map, "BP", 43);
ds_map_set(self.sprites_map, "BR", 44);
ds_map_set(self.sprites_map, "B+2", 45);

ds_map_set(self.sprites_map, "B0", 46);
ds_map_set(self.sprites_map, "B1", 47);
ds_map_set(self.sprites_map, "B2", 48);
ds_map_set(self.sprites_map, "B3", 49);
ds_map_set(self.sprites_map, "B4", 50);
ds_map_set(self.sprites_map, "B5", 51);
ds_map_set(self.sprites_map, "B6", 52);
ds_map_set(self.sprites_map, "B7", 53);
ds_map_set(self.sprites_map, "B8", 54);
ds_map_set(self.sprites_map, "B9", 55);