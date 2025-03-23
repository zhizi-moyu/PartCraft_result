
// Define dimensions for each block
large_block_size = [60, 30, 10];  // Length, Width, Height
medium_block_size = [40, 20, 10];
small_block_size = [20, 10, 10];

// Define positions for each layer
layer_1_height = large_block_size[2] + medium_block_size[2];  // Topmost layer
layer_2_height = large_block_size[2];                        // Middle layer
layer_3_height = 0;                                          // Bottommost layer

// Function to create a rectangular block
module rectangular_block(size, position) {
    translate(position)
        cube(size, center = true);
}

// Assemble the model
module flexible_coupling() {
    // Layer 3: Large rectangular block
    for (i = [-1, 1]) {  // Two blocks, mirrored along the X-axis
        rectangular_block(large_block_size, [i * (large_block_size[0] / 2 + 5), 0, layer_3_height]);
    }

    // Layer 2: Medium rectangular block
    for (i = [-1, 1]) {  // Two blocks, mirrored along the X-axis
        rectangular_block(medium_block_size, [i * (medium_block_size[0] / 2 + 5), 0, layer_2_height]);
    }

    // Layer 1: Small rectangular block
    for (i = [-1, 1]) {  // Two blocks, mirrored along the X-axis
        rectangular_block(small_block_size, [i * (small_block_size[0] / 2 + 5), 0, layer_1_height]);
    }
}

// Render the model
flexible_coupling();

