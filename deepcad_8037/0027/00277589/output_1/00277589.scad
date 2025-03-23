
// Define dimensions for the rectangular block
block_length = 50;  // Length of the block
block_width = 30;   // Width of the block
block_height = 15;  // Height of the block (increased thickness)

// Create the rectangular block
module rectangular_block() {
    translate([0, 0, 7.5])  // Adjust position to align with the original model
    cube([block_length, block_width, block_height], center = true);
}

// Call the module to render the block
rectangular_block();

