
// Dimensions for the blocks
large_block_size = [40, 20, 10];  // [length, width, height]
medium_block_size = [30, 15, 10];
small_block_size = [20, 10, 10];

// Positions for the blocks
large_block_position = [0, 0, 0];  // Bottommost layer
medium_block_position = [0, 0, large_block_size[2]];  // Above the large block
small_block_position = [0, 0, large_block_size[2] + medium_block_size[2]];  // Topmost layer

// Large rectangular block
translate(large_block_position)
    cube(large_block_size, center = true);

// Medium rectangular block
translate(medium_block_position)
    cube(medium_block_size, center = true);

// Small rectangular block
translate(small_block_position)
    cube(small_block_size, center = true);

