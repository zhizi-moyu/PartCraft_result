
// Base block
module base_block() {
    difference() {
        cube([30, 30, 10], center = false);
        // Adjusted notch: smaller and positioned closer to the top edge
        translate([26, 0, 9]) cube([3, 10, 1], center = false); // Notch
    }
}

// Top block
module top_block() {
    union() {
        cube([30, 30, 10], center = false);
        // Adjusted protrusion: narrower and shorter
        translate([26, 0, 10]) cube([3, 10, 1], center = false); // Protrusion
    }
}

// Side block
module side_block() {
    difference() {
        cube([10, 30, 30], center = false);
        // Adjusted cutout: shallower and positioned closer to the top edge
        translate([0, 0, 22]) cube([10, 10, 8], center = false); // Cutout
    }
}

// Connector block
module connector_block() {
    difference() {
        cube([30, 10, 10], center = false);
        // Adjusted groove: narrower and more recessed
        translate([12, 0, 3]) cube([6, 10, 4], center = false); // Groove
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

