// Define dimensions for each component
module base_block() {
    difference() {
        // Adjusted base block dimensions for uniform rectangular structure
        cube([40, 30, 40]); // Main block
        // Adjusted slot dimensions and position for wider and centrally aligned slot
        translate([15, 5, 20]) cube([10, 20, 20]); // Slot
    }
}

module horizontal_arm() {
    // Adjusted horizontal arm dimensions for longer and horizontally aligned arm
    cube([60, 10, 5]); // Horizontal arm dimensions
}

module vertical_support() {
    // Adjusted vertical support dimensions for thicker and centrally aligned support
    cube([15, 30, 40]); // Vertical support dimensions
}

// Assemble the model
module flexible_coupling() {
    // Layer 3: Base block with connector slot
    translate([0, 0, 0]) base_block();

    // Layer 2: Vertical support
    translate([12.5, 0, 40]) vertical_support();

    // Layer 1: Horizontal arm
    translate([12.5, 30, 80]) horizontal_arm();
}

// Render the model
flexible_coupling();
