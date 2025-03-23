
// Define dimensions for the rectangular block
block_width = 20;  // Width of the block
block_height = 10; // Height of the block
block_depth = 30;  // Depth of the block

// Function to create a rectangular block
module rectangular_block() {
    cube([block_width, block_depth, block_height], center = true);
}

// Generate a single solid block by merging all layers
rectangular_block();

