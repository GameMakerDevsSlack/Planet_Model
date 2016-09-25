///execute_script_by_chunk( script, chunk )

var i, chunk, start, limit;

chunk = argument1;
start = chunk * k_chunk_size;
limit = min( ds_list_size( lst_hex_x ), start + k_chunk_size );

for( i = start; i < limit; i++ ) script_execute( argument0, i );
