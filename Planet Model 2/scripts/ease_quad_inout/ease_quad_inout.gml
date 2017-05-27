/// @param t

var t = argument0;
t *= 2;

if ( t < 1 ) {
    return 0.5 * t * t;
} else {
    t--;
    return -0.5 * ( t*(t-2) - 1 );
}
