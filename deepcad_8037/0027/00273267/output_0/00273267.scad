
// Base block dimensions
base_length = 100;  // Length of the block
base_width = 20;    // Width of the block
base_height = 10;   // Height of the block

// Cutout dimensions
cutout_width = 20;  // Width of each cutout
cutout_height_step = 5;  // Height increment for each step
num_cutouts = 3;    // Number of cutouts

module base_block() {
    // Create the base block
    difference() {
        // Main block
        cube([base_length, base_width, base_height]);

        // Cutouts
        for (i = [0:num_cutouts-1]) {
            translate([i * cutout_width, 0, 0])
                cube([cutout_width, base_width, (i + 1) * cutout_height_step]);
        }
    }
}

// Render the base block
base_block();

