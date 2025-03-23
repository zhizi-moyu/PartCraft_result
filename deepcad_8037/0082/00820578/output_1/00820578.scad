
// Define dimensions for the rectangular block
block_length = 60;  // Adjusted length of the block to match the original model
block_width = 25;   // Adjusted width of the block to match the original model
block_height = 15;  // Adjusted height of the block to match the original model

// Generate the rectangular block
module rectangular_block() {
    cube([block_length, block_width, block_height], center = true);
}

// Assemble the model with adjustments for rotation and position
translate([0, 0, 5])  // Adjusted vertical position to align with the original model
rotate([0, 0, 45])    // Adjusted rotation to match the original model
rectangular_block();

