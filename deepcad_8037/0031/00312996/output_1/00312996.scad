
// Base block dimensions
base_length = 60;  // Length of the base block
base_width = 30;   // Width of the base block
base_height = 10;  // Height of the base block
slot_width = 10;   // Width of the vertical arm slots
slot_depth = 20;   // Depth of the vertical arm slots

// Vertical arm dimensions
arm_width = slot_width;  // Width of the vertical arms
arm_depth = slot_depth;  // Depth of the vertical arms
arm_height = 40;         // Height of the vertical arms

// Base block
module base_block() {
    cube([base_length, base_width, base_height], center = true); // Flat top surface
    translate([-base_length / 2 + slot_width / 2, 0, base_height / 2]) {
        cube([slot_width, base_width, slot_depth], center = true);
    }
    translate([base_length / 2 - slot_width / 2, 0, base_height / 2]) {
        cube([slot_width, base_width, slot_depth], center = true);
    }
}

// Vertical arm (left)
module vertical_arm_left() {
    translate([-base_length / 2 + slot_width / 2, 0, base_height + arm_height / 2]) {
        cube([arm_width, base_width, arm_height], center = true); // Adjusted to vertical position
    }
}

// Vertical arm (right)
module vertical_arm_right() {
    translate([base_length / 2 - slot_width / 2, 0, base_height + arm_height / 2]) {
        cube([arm_width, base_width, arm_height], center = true); // Adjusted to vertical position
    }
}

// Assemble the model
module flexible_coupling() {
    base_block();
    vertical_arm_left();
    vertical_arm_right();
}

// Render the model
flexible_coupling();

