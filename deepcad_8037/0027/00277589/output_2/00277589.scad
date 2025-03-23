
// Define dimensions for the rectangular block
block_length = 50;  // Length of the block
block_width = 30;   // Width of the block
block_height = 20;  // Height of the block (increased thickness to match original model)

// Create the rectangular block
module rectangular_block() {
    translate([0, 0, 10])  // Adjust position upward to align with the original model
    cube([block_length, block_width, block_height], center = true);
}

// Call the module to render the block
rectangular_block();

