
// Define dimensions for each block
large_block_length = 60;  // Length of the large rectangular block
large_block_width = 30;   // Width of the large rectangular block
large_block_height = 20;  // Height of the large rectangular block

medium_block_length = 40; // Length of the medium rectangular block
medium_block_width = 20;  // Width of the medium rectangular block
medium_block_height = 15; // Height of the medium rectangular block

small_block_length = 20;  // Length of the small rectangular block
small_block_width = 10;   // Width of the small rectangular block
small_block_height = 10;  // Height of the small rectangular block

// Position offsets
layer_1_offset = [0, 0, large_block_height + medium_block_height]; // Position of the small block
layer_2_offset = [0, 0, large_block_height];                       // Position of the medium block
layer_3_offset = [0, 0, 0];                                        // Position of the large block

// Create the large rectangular block
translate(layer_3_offset)
cube([large_block_length, large_block_width, large_block_height]);

// Create the medium rectangular block
translate(layer_2_offset)
cube([medium_block_length, medium_block_width, medium_block_height]);

// Create the small rectangular block
translate(layer_1_offset)
cube([small_block_length, small_block_width, small_block_height]);

