
// Parameters for the stepped block
base_length = 70;  // Adjusted length of the rectangular base to match the original model
base_width = 50;   // Adjusted width of the rectangular base to match the original model
base_height = 20;  // Adjusted height of the base to match the original model
step_count = 10;   // Increased number of steps to match the original model
step_height = 2;   // Reduced height of each step to match the original model
step_depth = 5;    // Reduced depth of each step to match the original model

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

