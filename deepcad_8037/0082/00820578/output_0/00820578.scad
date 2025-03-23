
// Define dimensions for the rectangular block
block_length = 50;  // Length of the block
block_width = 20;   // Width of the block
block_height = 10;  // Height of the block

// Generate the rectangular block
module rectangular_block() {
    cube([block_length, block_width, block_height], center = true);
}

// Assemble the model
rectangular_block();

