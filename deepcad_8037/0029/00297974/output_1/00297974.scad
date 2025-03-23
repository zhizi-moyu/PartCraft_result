
// Parameters for the stepped block
base_length = 60;  // Adjusted length of the rectangular base
base_width = 40;   // Adjusted width of the rectangular base
base_height = 15;  // Adjusted height of the base
step_count = 8;    // Increased number of steps
step_height = 3;   // Reduced height of each step
step_depth = 6;    // Reduced depth of each step

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

