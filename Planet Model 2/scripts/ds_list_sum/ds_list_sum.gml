/// @param list
//Returns the sum of all indices in the list

var _val = 0;
for( var _i = 0; _i < ds_list_size( argument0 ); _i++ ) _val += argument0[| _i ];
return _val;