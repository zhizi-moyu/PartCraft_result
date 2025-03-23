
// Define dimensions for each block
large_rectangular_block_length = 100;
large_rectangular_block_width = 50;
large_rectangular_block_height = 20;

medium_rectangular_block_length = 50;
medium_rectangular_block_width = 50;
medium_rectangular_block_height = 30;

small_rectangular_block_length = 30;
small_rectangular_block_width = 30;
small_rectangular_block_height = 40;

// Layer 1: Large rectangular block (base)
translate([0, 0, 0]) {
    cube([large_rectangular_block_length, large_rectangular_block_width, large_rectangular_block_height]);
}

// Layer 2: Medium rectangular blocks (side by side above the base)
translate([0, 0, large_rectangular_block_height]) {
    cube([medium_rectangular_block_length, medium_rectangular_block_width, medium_rectangular_block_height]);
}
translate([medium_rectangular_block_length, 0, large_rectangular_block_height]) {
    cube([medium_rectangular_block_length, medium_rectangular_block_width, medium_rectangular_block_height]);
}

// Layer 3: Small rectangular blocks (side by side above the medium blocks)
translate([0, 0, large_rectangular_block_height + medium_rectangular_block_height]) {
    cube([small_rectangular_block_length, small_rectangular_block_width, small_rectangular_block_height]);
}
translate([small_rectangular_block_length, 0, large_rectangular_block_height + medium_rectangular_block_height]) {
    cube([small_rectangular_block_length, small_rectangular_block_width, small_rectangular_block_height]);
}
translate([2 * small_rectangular_block_length, 0, large_rectangular_block_height + medium_rectangular_block_height]) {
    cube([small_rectangular_block_length, small_rectangular_block_width, small_rectangular_block_height]);
}

