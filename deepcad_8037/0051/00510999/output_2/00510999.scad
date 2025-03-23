
// Base block dimensions
base_block_width = 50;
base_block_depth = 30;
base_block_height = 30; // Increased height to match the original model
base_block_bevel = 0; // Removed bevel to make edges sharp

// Vertical arm dimensions
vertical_arm_width = 25; // Adjusted width to match the original model
vertical_arm_depth = 30;
vertical_arm_height = 40;
vertical_arm_taper = 0; // Removed taper to make the shape consistent

// Horizontal arm dimensions
horizontal_arm_width = 70; // Extended length to match the original model
horizontal_arm_depth = 20;
horizontal_arm_height = 10;
horizontal_arm_bevel = 0; // Removed bevel on the underside to make it flat

// Base block
module base_block() {
    cube([base_block_width, base_block_depth, base_block_height]);
}

// Vertical arm
module vertical_arm() {
    translate([12.5, 0, base_block_height]) // Centered on top of the base block
    cube([vertical_arm_width, vertical_arm_depth, vertical_arm_height]);
}

// Horizontal arm
module horizontal_arm() {
    translate([0, 10, base_block_height + vertical_arm_height - horizontal_arm_height]) // Lowered position to align with the original model
    cube([horizontal_arm_width, horizontal_arm_depth, horizontal_arm_height]);
}

// Assemble the model
module flexible_coupling() {
    base_block();
    vertical_arm();
    horizontal_arm();
}

// Render the model
flexible_coupling();

