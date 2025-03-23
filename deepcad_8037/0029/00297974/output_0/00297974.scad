
// Parameters for the stepped block
base_length = 50;  // Length of the rectangular base
base_width = 30;   // Width of the rectangular base
base_height = 10;  // Height of the base
step_count = 6;    // Number of steps
step_height = 5;   // Height of each step
step_depth = 8;    // Depth of each step

module stepped_block() {
    // Base of the block
    cube([base_length, base_width, base_height]);

    // Steps
    for (i = [0:step_count-1]) {
        translate([i * step_depth, 0, base_height + i * step_height])
            cube([base_length - i * step_depth, base_width, step_height]);
    }
}

// Render the stepped block
stepped_block();

