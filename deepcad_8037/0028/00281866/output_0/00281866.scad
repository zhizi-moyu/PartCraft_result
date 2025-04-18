
// Base block
module base_block() {
    difference() {
        cube([30, 30, 10], center = false);
        translate([25, 0, 8]) cube([5, 10, 2], center = false); // Notch
    }
}

// Top block
module top_block() {
    union() {
        cube([30, 30, 10], center = false);
        translate([25, 0, 10]) cube([5, 10, 2], center = false); // Protrusion
    }
}

// Side block
module side_block() {
    difference() {
        cube([10, 30, 30], center = false);
        translate([0, 0, 20]) cube([10, 10, 10], center = false); // Cutout
    }
}

// Connector block
module connector_block() {
    difference() {
        cube([30, 10, 10], center = false);
        translate([10, 0, 4]) cube([10, 10, 2], center = false); // Groove
    }
}

// Assembly
module assembly() {
    // Layer 4: Base block
    base_block();

    // Layer 3: Connector block
    translate([0, 10, 10]) connector_block();

    // Layer 2: Side blocks
    translate([0, 0, 10]) side_block();
    translate([20, 0, 10]) side_block();

    // Layer 1: Top block
    translate([0, 0, 30]) top_block();
}

// Render the assembly
assembly();

