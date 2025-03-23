
// Define the dimensions of the rectangular block
block_width = 20;  // Width of the block
block_height = 40; // Height of the block
block_depth = 10;  // Depth of the block

// Function to create a rectangular block
module rectangular_block() {
    cube([block_width, block_depth, block_height], center = true);
}

// Generate six identical rectangular blocks
rectangular_block(); // Block 1
rectangular_block(); // Block 2
rectangular_block(); // Block 3
rectangular_block(); // Block 4
rectangular_block(); // Block 5
rectangular_block(); // Block 6

