
// Define dimensions for the rectangular block
block_length = 48;  // Adjusted length to match the original model
block_width = 25;   // Width of the block remains the same
block_thickness = 2.5; // Reduced thickness to match the original model

// Generate the rectangular block with sharp edges
module rectangular_block() {
    cube([block_length, block_width, block_thickness], center = true);
}

// Smoothen the surface and ensure flatness
module smooth_block() {
    rectangular_block();
}

// Assemble the model with corrected orientation and position
translate([0, 0, 0]) // Ensure the block lies flat and parallel to the base
rotate([0, 0, 0])    // Corrected orientation to remove any tilt
smooth_block();

