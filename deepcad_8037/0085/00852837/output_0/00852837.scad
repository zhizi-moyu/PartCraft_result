
// Define dimensions for the blocks
large_block_width = 60;
large_block_height = 20;
large_block_depth = 40;

medium_block_width = 40;
medium_block_height = 20;
medium_block_depth = 30;

small_block_width = 20;
small_block_height = 20;
small_block_depth = 20;

// Define positions for the layers
layer_1_z = large_block_height + medium_block_height; // Topmost layer
layer_2_z = large_block_height; // Middle layer
layer_3_z = 0; // Bottommost layer

// Create the large rectangular blocks (layer 3)
translate([0, 0, layer_3_z]) {
    cube([large_block_width, large_block_depth, large_block_height], center = true);
}
translate([0, 0, layer_3_z]) {
    cube([large_block_width, large_block_depth, large_block_height], center = true);
}

// Create the medium rectangular blocks (layer 2)
translate([0, 0, layer_2_z]) {
    cube([medium_block_width, medium_block_depth, medium_block_height], center = true);
}
translate([0, 0, layer_2_z]) {
    cube([medium_block_width, medium_block_depth, medium_block_height], center = true);
}

// Create the small rectangular blocks (layer 1)
translate([0, 0, layer_1_z]) {
    cube([small_block_width, small_block_depth, small_block_height], center = true);
}
translate([0, 0, layer_1_z]) {
    cube([small_block_width, small_block_depth, small_block_height], center = true);
}

