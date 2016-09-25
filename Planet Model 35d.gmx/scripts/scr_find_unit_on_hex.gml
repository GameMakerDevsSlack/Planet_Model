///find_unit_on_hex( hex index )

var i, hex, result;

hex = argument0;
result = noone;

for( i = 0; i < instance_number( obj_army ); i++ ) {
    
    inst = instance_find( obj_army, i );
    if ( inst.hex_location == hex ) {
        result = inst;
        break;
    }
    
}

return result;
