
// Base block
module base_block() {
    difference() {
        cube([30, 20, 10], center = false); // Main block
        translate([10, 0, 0])
            cube([10, 5, 10], center = false); // Vertical slot
    }
}

// Forked arm
module forked_arm() {
    union() {
        // Base of the U-shape
        cube([30, 20, 5], center = false);
        // Left prong
        translate([0, 0, 5])
            cube([10, 20, 5], center = false);
        // Right prong
        translate([20, 0, 5])
            cube([10, 20, 5], center = false);
    }
}

// Connector slot
module connector_slot() {
    difference() {
        cube([10, 20, 10], center = false); // Main block
        translate([3, 0, 3])
            cube([4, 20, 4], center = false); // Slot in the middle
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

