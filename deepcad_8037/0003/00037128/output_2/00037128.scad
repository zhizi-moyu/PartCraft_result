
// Base block
module base_block() {
    difference() {
        cube([30, 20, 10], center = false); // Main block
        translate([5, 0, 0])
            cube([5, 5, 10], center = false); // Adjusted vertical slot to match original model
    }
}

// Forked arm
module forked_arm() {
    union() {
        // Base of the U-shape
        cube([30, 10, 5], center = false); // Reduced thickness of the base to match original model
        // Left prong
        translate([0, 0, 5])
            cube([10, 30, 5], center = false); // Extended prong length to match original model
        // Right prong
        translate([20, 0, 5])
            cube([10, 30, 5], center = false); // Extended prong length to match original model
    }
}

// Connector slot
module connector_slot() {
    difference() {
        cube([10, 20, 10], center = false); // Main block
        translate([4, 0, 5])
            cube([2, 10, 2], center = false); // Adjusted slot dimensions and position to match original model
    }
}

// Assembly
module assembly() {
    // Layer 3: Base block
    base_block();

    // Layer 2: Connector slot
    translate([10, 0, 10])
        connector_slot();

    // Layer 1: Forked arm
    translate([0, 0, 20])
        forked_arm();
}

// Render the assembly
assembly();

