
// Dimensions for each component
large_block_dims = [60, 30, 20];  // Length, Width, Height
medium_block_dims = [40, 20, 15];
small_block_dims = [30, 15, 10];
cubic_block_dims = [15, 15, 15];

// Positional offsets for stacking
large_block_offset = [0, 0, 0];
medium_block_offset = [0, 0, -large_block_dims[2]];
cubic_block_offset = [0, 0, medium_block_offset[2] - medium_block_dims[2]];
small_block_offset = [0, 0, cubic_block_offset[2] - cubic_block_dims[2]];

// Function to create a rectangular block
module rectangular_block(size, offset) {
    translate(offset)
        cube(size, center = true);
}

// Assembly of the model
module assembly() {
    // Layer 1: Large rectangular block
    rectangular_block(large_block_dims, large_block_offset);

    // Layer 2: Medium rectangular block
    rectangular_block(medium_block_dims, medium_block_offset);

    // Layer 3: Cubic block
    rectangular_block(cubic_block_dims, cubic_block_offset);

    // Layer 4: Small rectangular block
    rectangular_block(small_block_dims, small_block_offset);
}

// Render the assembly
assembly();

