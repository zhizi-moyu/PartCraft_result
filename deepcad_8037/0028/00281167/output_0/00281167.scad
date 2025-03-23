
// Define dimensions for each block
large_block_size = [20, 30, 10];  // Length, width, height for the large rectangular block
medium_block_size = [15, 25, 10]; // Length, width, height for the medium rectangular block
small_block_size = [10, 20, 10];  // Length, width, height for the small rectangular block

// Layer positions
layer_spacing = 10;
layer_3_position = [0, 0, 0]; // Positioned at base (layer 3)
layer_2_position = [0, 0, large_block_size[2] + layer_spacing]; // In position above large block (layer 2)
layer_1_position = [0, 0, large_block_size[2] + medium_block_size[2] + 2*layer_spacing]; // Positioned globally on top (layer 1)

// Large rectangular block
translate(layer_3_position)
    cube(large_block_size);

// Medium rectangular block
translate(layer_2_position)
    cube(medium_block_size);

// Small rectangular block
translate(layer_1_position)
    cube(small_block_size);

