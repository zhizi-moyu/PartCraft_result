
// Parameters for the stepped block
block_length = 60;  // Total length of the block
block_width = 40;   // Total width of the block
block_height = 30;  // Total height of the block

num_steps = 6;      // Number of steps
step_height = block_height / num_steps;  // Height of each step
step_depth = block_length / num_steps;  // Depth of each step

// Function to create the stepped block
module stepped_block() {
    difference() {
        // Base block
        cube([block_length, block_width, block_height], center = false);
        
        // Subtract steps
        for (i = [0 : num_steps - 1]) {
            translate([i * step_depth, 0, 0])
                cube([block_length - i * step_depth, block_width, block_height - i * step_height], center = false);
        }
    }
}

// Render the stepped block
stepped_block();

