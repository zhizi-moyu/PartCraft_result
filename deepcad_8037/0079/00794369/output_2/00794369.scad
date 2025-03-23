// Define the dimensions of the rectangular block
block_width = 20;  // Width of the block
block_height = 20; // Height of the block
block_length = 40; // Length of the block

// Function to create a single rectangular block
module rectangular_block() {
    cube([block_length, block_width, block_height], center = true);
}

// Create a single seamless rectangular block
rectangular_block();
