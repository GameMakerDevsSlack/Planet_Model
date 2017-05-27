world_hex_grid[# world_hex_grid_count, world_hex.x         ] = 0;
world_hex_grid[# world_hex_grid_count, world_hex.y         ] = 0;
world_hex_grid[# world_hex_grid_count, world_hex.z         ] = 0;

world_hex_grid[# world_hex_grid_count, world_hex.radius    ] = 0;
world_hex_grid[# world_hex_grid_count, world_hex.phi       ] = 0;
world_hex_grid[# world_hex_grid_count, world_hex.theta     ] = 0;

world_hex_grid[# world_hex_grid_count, world_hex.list_ax   ] = ds_list_create();
world_hex_grid[# world_hex_grid_count, world_hex.list_ay   ] = ds_list_create();
world_hex_grid[# world_hex_grid_count, world_hex.list_az   ] = ds_list_create();

world_hex_grid[# world_hex_grid_count, world_hex.list_bx   ] = ds_list_create();
world_hex_grid[# world_hex_grid_count, world_hex.list_by   ] = ds_list_create();
world_hex_grid[# world_hex_grid_count, world_hex.list_bz   ] = ds_list_create();

world_hex_grid[# world_hex_grid_count, world_hex.list_adj  ] = ds_list_create();
world_hex_grid[# world_hex_grid_count, world_hex.list_edge ] = ds_list_create();

world_hex_grid[# world_hex_grid_count, world_hex.visited   ] = noone;
world_hex_grid[# world_hex_grid_count, world_hex.test      ] = false;

ds_list_add( hex_tri_cache, ds_list_create() );
ds_list_mark_as_list( hex_tri_cache, ds_list_size( hex_tri_cache )-1 );

return world_hex_grid_count++;