
// Define dimensions for the rectangular block
block_length = 50;  // Length of the block
block_width = 30;   // Width of the block
block_height = 10;  // Height (thickness) of the block

// Create the rectangular block
module rectangular_block() {
    cube([block_length, block_width, block_height], center = true);
}

// Render the rectangular block
rectangular_block();

