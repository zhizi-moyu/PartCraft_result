
// Define dimensions for the rectangular block
block_length = 50;  // Length of the block
block_width = 25;   // Width of the block
block_thickness = 3; // Adjusted thickness of the block to match the original model

// Generate the rectangular block
module rectangular_block() {
    cube([block_length, block_width, block_thickness], center = true);
}

// Assemble the model
translate([0, 0, 0]) // Corrected position to align with the original model
rectangular_block();

