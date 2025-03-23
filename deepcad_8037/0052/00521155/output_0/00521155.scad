
// Dimensions
base_length = 50;  // Length of the base block
base_width = 50;   // Width of the base block
base_height = 20;  // Height of the base block

cutout_length = 30;  // Length of the central cutout
cutout_width = 20;   // Width of the central cutout
cutout_height = 20;  // Height of the central cutout

arm_width = 10;      // Width of the side arms
arm_height = 30;     // Height of the side arms

// Base block
module base_block() {
    cube([base_length, base_width, base_height]);
}

// Central cutout
module central_cutout() {
    translate([(base_length - cutout_length) / 2, (base_width - cutout_width) / 2, 0])
        cube([cutout_length, cutout_width, cutout_height]);
}

// Side arms
module side_arm() {
    cube([arm_width, base_width, arm_height]);
}

// Full model
module flexible_coupling() {
    // Layer 1: Base block
    base_block();

    // Layer 2: Central cutout
    difference() {
        base_block();
        central_cutout();
    }

    // Layer 3: Side arms
    translate([0, 0, base_height])
        side_arm();
    translate([base_length - arm_width, 0, base_height])
        side_arm();
}

// Render the model
flexible_coupling();

