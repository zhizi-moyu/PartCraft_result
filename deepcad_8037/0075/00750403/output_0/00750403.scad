
// Parameters for the rectangular block
block_length = 60;  // Length of the block
block_width = 30;   // Width of the block
block_height = 40;  // Height of the block
frame_thickness = 5; // Thickness of the outer frame
cutout_width = 20;  // Width of the rectangular cutouts
cutout_height = 10; // Height of the rectangular cutouts
cutout_spacing = 10; // Spacing between the two cutouts

module rectangular_block_with_cutouts() {
    // Outer block
    difference() {
        cube([block_length, block_width, block_height], center = true);
        
        // Create the two rectangular cutouts
        translate([0, 0, block_height / 4])
            cube([block_length, cutout_width, cutout_height], center = true);
        translate([0, 0, -block_height / 4])
            cube([block_length, cutout_width, cutout_height], center = true);
    }
}

// Render the model
rectangular_block_with_cutouts();

