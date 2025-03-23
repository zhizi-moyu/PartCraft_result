
// Parameters for the step block
block_width = 30;  // Width of the block
block_depth = 30;  // Depth of the block
block_height = 30; // Total height of the block

step_depth = 10;   // Depth of each step
step_height = 10;  // Height of each step

// Function to create the step block
module step_block() {
    // Base block
    cube([block_width, block_depth, block_height]);

    // Subtract steps
    difference() {
        // Full block
        cube([block_width, block_depth, block_height]);

        // Step 1
        translate([0, 0, block_height - step_height])
            cube([block_width, step_depth, step_height]);

        // Step 2
        translate([0, 0, block_height - 2 * step_height])
            cube([block_width, 2 * step_depth, 2 * step_height]);

        // Step 3
        translate([0, 0, block_height - 3 * step_height])
            cube([block_width, 3 * step_depth, 3 * step_height]);
    }
}

// Render the step block
step_block();

