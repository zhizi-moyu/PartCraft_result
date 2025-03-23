
// Define dimensions for each component
module base_block() {
    difference() {
        // Adjusted base block dimensions to match the original model
        cube([50, 40, 50]); // Main block
        // Adjusted slot dimensions and position to match the original model
        translate([10, 10, 15]) cube([30, 20, 25]); // Slot
    }
}

module horizontal_arm() {
    // Adjusted horizontal arm dimensions to match the original model
    cube([80, 15, 10]); // Horizontal arm dimensions
}

module vertical_support() {
    // Adjusted vertical support dimensions to match the original model
    cube([20, 40, 50]); // Vertical support dimensions
}

// Assemble the model
module flexible_coupling() {
    // Layer 3: Base block with connector slot
    translate([0, 0, 0]) base_block();

    // Layer 2: Vertical support
    translate([15, 10, 50]) vertical_support();

    // Layer 1: Horizontal arm
    translate([15, 40, 100]) horizontal_arm();
}

// Render the model
flexible_coupling();

