
// Dimensions for the base block
base_length = 60;  // Length of the block
base_width = 40;   // Width of the block
base_height = 30;  // Height of the block

// Dimensions for the U-shaped cutout
cutout_width = 20;  // Width of the cutout
cutout_height = 15; // Height of the cutout
cutout_depth = 20;  // Depth of the cutout

// Main module to create the base block with the U-shaped cutout
module base_block() {
    // Create the main rectangular block
    difference() {
        cube([base_length, base_width, base_height], center = true);
        
        // Create the U-shaped cutout
        translate([-cutout_depth / 2, -cutout_width / 2, -base_height / 2])
            cube([cutout_depth, cutout_width, cutout_height], center = false);
    }
}

// Render the base block
base_block();

