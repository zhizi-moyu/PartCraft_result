
// Define dimensions for the rectangular block
block_length = 50;  // Length of the block
block_width = 25;   // Width of the block
block_thickness = 5; // Thickness of the block

// Generate the rectangular block
module rectangular_block() {
    cube([block_length, block_width, block_thickness], center = true);
}

// Assemble the model
rectangular_block();

