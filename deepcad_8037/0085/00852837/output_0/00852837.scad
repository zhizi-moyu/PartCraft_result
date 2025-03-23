
// Dimensions for the blocks
large_block_dims = [60, 30, 15];  // Length, Width, Height
medium_block_dims = [40, 20, 10];
small_block_dims = [20, 10, 5];

// Position offsets for stacking
large_block_position = [0, 0, 0];
medium_block_position = [0, 0, large_block_dims[2]];
small_block_position = [0, 0, large_block_dims[2] + medium_block_dims[2]];

// Function to create a rectangular block
module rectangular_block(dimensions) {
    cube(dimensions, center = true);
}

// Assembly of the model
module assembly() {
    // Layer 3: Large rectangular block
    translate(large_block_position)
        rectangular_block(large_block_dims);

    // Layer 2: Medium rectangular block
    translate(medium_block_position)
        rectangular_block(medium_block_dims);

    // Layer 1: Small rectangular block
    translate(small_block_position)
        rectangular_block(small_block_dims);
}

// Render the assembly
assembly();

