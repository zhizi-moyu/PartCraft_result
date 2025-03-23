
// Define dimensions for each layer
step_block_bottom_width = 60;
step_block_bottom_height = 20;
step_block_bottom_depth = 40;

step_block_middle_width = 40;
step_block_middle_height = 20;
step_block_middle_depth = 40;

step_block_top_width = 20;
step_block_top_height = 20;
step_block_top_depth = 40;

// Adjusted dimensions for uniform and symmetrical appearance
adjusted_step_block_bottom_width = 60;
adjusted_step_block_bottom_height = 20;
adjusted_step_block_bottom_depth = 40;

adjusted_step_block_middle_width = 40;
adjusted_step_block_middle_height = 20;
adjusted_step_block_middle_depth = 40;

adjusted_step_block_top_width = 20;
adjusted_step_block_top_height = 20;
adjusted_step_block_top_depth = 40;

// Create the bottom layer
module step_block_bottom() {
    cube([adjusted_step_block_bottom_width, adjusted_step_block_bottom_depth, adjusted_step_block_bottom_height]);
}

// Create the middle layer
module step_block_middle() {
    translate([10, 0, adjusted_step_block_bottom_height]) // Centered horizontally and stacked vertically
        cube([adjusted_step_block_middle_width, adjusted_step_block_middle_depth, adjusted_step_block_middle_height]);
}

// Create the top layer
module step_block_top() {
    translate([20, 0, adjusted_step_block_bottom_height + adjusted_step_block_middle_height]) // Centered horizontally and stacked vertically
        cube([adjusted_step_block_top_width, adjusted_step_block_top_depth, adjusted_step_block_top_height]);
}

// Combine all layers to form the stepped block
module stepped_block() {
    step_block_bottom();
    step_block_middle();
    step_block_top();
}

// Render the stepped block
stepped_block();

