
// Dimensions for each component
large_block_dims = [60, 30, 20];  // Length, Width, Height
medium_block_dims = [40, 20, 15];
small_block_dims = [30, 15, 10];
cubic_block_dims = [15, 15, 15];

// Positional offsets for independent placement
large_block_offset = [0, 0, 50];  // Elevated to avoid overlap
medium_block_offset = [0, 0, 20];
small_block_offset = [0, 0, -20];
cubic_block_offset = [0, 0, -50];

// Function to create a rectangular block
module rectangular_block(size, offset) {
    translate(offset)
        cube(size, center = true);
}

// Assembly of the model
module assembly() {
    // Large rectangular block (independent)
    rectangular_block(large_block_dims, large_block_offset);

    // Medium rectangular block (independent)
    rectangular_block(medium_block_dims, medium_block_offset);

    // Small rectangular block (independent)
    rectangular_block(small_block_dims, small_block_offset);

    // Cubic block (independent)
    rectangular_block(cubic_block_dims, cubic_block_offset);
}

// Render the assembly
assembly();

