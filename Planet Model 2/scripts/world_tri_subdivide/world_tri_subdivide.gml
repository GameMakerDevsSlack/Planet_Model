/// @param index

var _index = argument0;
    
//Get the vertex coordinates
var _ax = world_tri_grid_a[# _index, world_tri.a_x ];
var _ay = world_tri_grid_a[# _index, world_tri.a_y ];
var _az = world_tri_grid_a[# _index, world_tri.a_z ];

var _bx = world_tri_grid_a[# _index, world_tri.b_x ];
var _by = world_tri_grid_a[# _index, world_tri.b_y ];
var _bz = world_tri_grid_a[# _index, world_tri.b_z ];

var _cx = world_tri_grid_a[# _index, world_tri.c_x ];
var _cy = world_tri_grid_a[# _index, world_tri.c_y ];
var _cz = world_tri_grid_a[# _index, world_tri.c_z ];
    
//And the central point
var _centre_x = world_tri_grid_a[# _index, world_tri.o_x ];
var _centre_y = world_tri_grid_a[# _index, world_tri.o_y ];
var _centre_z = world_tri_grid_a[# _index, world_tri.o_z ];
    
//Find the neighbours. We create one new triangle per side such that neighbours create interlocking new faces
var _na = world_tri_grid_a[# _index, world_tri.a_adj ];
var _nb = world_tri_grid_a[# _index, world_tri.b_adj ];
var _nc = world_tri_grid_a[# _index, world_tri.c_adj ];
    
//Vertex order here is very important because everything needs to have directionality preserved to avoid clashes during subdivision
var _index_a = world_tri_add_other( _centre_x, _centre_y, _centre_z,
                                    _ax, _ay, _az,
                                    world_tri_grid_a[# _na, world_tri.o_x ], world_tri_grid_a[# _na, world_tri.o_y ], world_tri_grid_a[# _na, world_tri.o_z ],
                                    _index );
    
var _index_b = world_tri_add_other( _centre_x, _centre_y, _centre_z,
                                    _bx, _by, _bz,
                                    world_tri_grid_a[# _nb, world_tri.o_x ], world_tri_grid_a[# _nb, world_tri.o_y ], world_tri_grid_a[# _nb, world_tri.o_z ],
                                    _index );
    
var _index_c = world_tri_add_other( _centre_x, _centre_y, _centre_z,
                                    _cx, _cy, _cz,
                                    world_tri_grid_a[# _nc, world_tri.o_x ], world_tri_grid_a[# _nc, world_tri.o_y ], world_tri_grid_a[# _nc, world_tri.o_z ],
                                    _index );
    
//Keep a record in the parent of where the children are. This is crucial for assign_face_neighbours
world_tri_grid_a[# _index, world_tri.a_chi ] = _index_a;
world_tri_grid_a[# _index, world_tri.b_chi ] = _index_b;
world_tri_grid_a[# _index, world_tri.c_chi ] = _index_c;