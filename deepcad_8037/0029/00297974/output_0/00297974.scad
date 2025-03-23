
// Parameters for the stepped block
step_width = 10;    // Width of each step
step_height = 5;    // Height of each step
step_depth = 10;    // Depth of each step
num_steps = 6;      // Number of steps
block_width = step_width; // Width of the block
block_depth = step_depth * num_steps; // Total depth of the block
block_height = step_height * num_steps; // Total height of the block

// Function to create the stepped block
module stepped_block() {
    difference() {
        // Base block
        cube([block_width, block_depth, block_height], center = false);
        
        // Subtract steps
        for (i = [0:num_steps-1]) {
            translate([0, i * step_depth, i * step_height])
                cube([block_width, block_depth, block_height], center = false);
        }
    }
}

// Render the stepped block
stepped_block();

