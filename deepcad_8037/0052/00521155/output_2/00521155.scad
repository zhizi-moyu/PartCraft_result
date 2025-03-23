
// Adjusted Dimensions
base_length = 50;  // Length of the base block
base_width = 50;   // Width of the base block
base_height = 15;  // Height of the base block remains the same

cutout_length = 40;  // Length of the central cutout remains the same
cutout_width = 40;   // Increased width of the central cutout to match the original model
cutout_height = 15;  // Height of the central cutout remains the same

arm_width = 10;      // Width of the side arms remains the same
arm_height = 50;     // Increased height of the side arms to match the original model

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

