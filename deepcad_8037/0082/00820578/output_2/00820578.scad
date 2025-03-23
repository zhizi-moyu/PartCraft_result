
// Define dimensions for the rectangular block
block_length = 70;  // Increased length to match the original model
block_width = 30;   // Increased width to match the original model
block_height = 20;  // Increased height to match the original model

// Generate the rectangular block
module rectangular_block() {
    cube([block_length, block_width, block_height], center = true);
}

// Assemble the model with adjustments for rotation and position
translate([0, 0, 10])  // Adjusted vertical position to align with the original model
rotate([0, 0, 30])     // Adjusted rotation to match the original model
rectangular_block();

