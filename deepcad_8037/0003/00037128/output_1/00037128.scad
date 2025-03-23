
// Base block
module base_block() {
    difference() {
        cube([30, 20, 10], center = false); // Main block
        translate([10, 0, 0])
            cube([10, 5, 10], center = false); // Adjusted vertical slot
    }
}

// Forked arm
module forked_arm() {
    union() {
        // Base of the U-shape
        cube([30, 15, 5], center = false); // Reduced thickness of the base
        // Left prong
        translate([0, 0, 5])
            cube([10, 20, 5], center = false); // Extended prong length
        // Right prong
        translate([20, 0, 5])
            cube([10, 20, 5], center = false); // Extended prong length
    }
}

// Connector slot
module connector_slot() {
    difference() {
        cube([10, 20, 10], center = false); // Main block
        translate([4, 0, 4])
            cube([2, 20, 2], center = false); // Narrowed slot
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

