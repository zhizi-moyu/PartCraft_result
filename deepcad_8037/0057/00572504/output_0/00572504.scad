
// Define dimensions for each component
module base_block() {
    difference() {
        cube([30, 20, 40]); // Main block
        translate([10, 0, 20]) cube([10, 20, 20]); // Slot
    }
}

module horizontal_arm() {
    cube([50, 10, 5]); // Horizontal arm dimensions
}

module vertical_support() {
    cube([10, 20, 30]); // Vertical support dimensions
}

// Assemble the model
module flexible_coupling() {
    // Layer 3: Base block with connector slot
    translate([0, 0, 0]) base_block();

    // Layer 2: Vertical support
    translate([10, 0, 40]) vertical_support();

    // Layer 1: Horizontal arm
    translate([10, 20, 65]) horizontal_arm();
}

// Render the model
flexible_coupling();

