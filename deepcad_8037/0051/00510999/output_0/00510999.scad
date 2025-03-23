
// Base block dimensions
base_block_width = 50;
base_block_depth = 30;
base_block_height = 20;

// Vertical arm dimensions
vertical_arm_width = 20;
vertical_arm_depth = 30;
vertical_arm_height = 40;

// Horizontal arm dimensions
horizontal_arm_width = 50;
horizontal_arm_depth = 20;
horizontal_arm_height = 10;

// Base block
module base_block() {
    cube([base_block_width, base_block_depth, base_block_height]);
}

// Vertical arm
module vertical_arm() {
    translate([15, 0, base_block_height]) // Position on top of the base block
    cube([vertical_arm_width, vertical_arm_depth, vertical_arm_height]);
}

// Horizontal arm
module horizontal_arm() {
    translate([0, 10, base_block_height + vertical_arm_height]) // Position on top of the vertical arm
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

