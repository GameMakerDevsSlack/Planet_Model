world_hex_grid[# world_hex_grid_count, world_hex.x         ] = 0;
world_hex_grid[# world_hex_grid_count, world_hex.y         ] = 0;
world_hex_grid[# world_hex_grid_count, world_hex.z         ] = 0;

world_hex_grid[# world_hex_grid_count, world_hex.radius    ] = 0;
world_hex_grid[# world_hex_grid_count, world_hex.phi       ] = 0;
world_hex_grid[# world_hex_grid_count, world_hex.theta     ] = 0;

world_hex_grid[# world_hex_grid_count, world_hex.list_vx   ] = ds_list_create();
world_hex_grid[# world_hex_grid_count, world_hex.list_vy   ] = ds_list_create();
world_hex_grid[# world_hex_grid_count, world_hex.list_vz   ] = ds_list_create();
world_hex_grid[# world_hex_grid_count, world_hex.list_adj  ] = ds_list_create();

world_hex_grid[# world_hex_grid_count, world_hex.visited   ] = noone;
world_hex_grid[# world_hex_grid_count, world_hex.test      ] = false;

ds_list_add( hex_nested_neighbour_faces_list, ds_list_create() );
ds_list_mark_as_list( hex_nested_neighbour_faces_list, ds_list_size( hex_nested_neighbour_faces_list )-1 );

return world_hex_grid_count++;