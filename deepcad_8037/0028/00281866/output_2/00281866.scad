
// Base block
module base_block() {
    difference() {
        cube([30, 30, 10], center = false);
        // Adjusted notch: smaller and positioned closer to the top edge
        translate([27, 0, 8.5]) cube([2, 10, 1.5], center = false); // Notch
    }
}

// Top block
module top_block() {
    union() {
        cube([30, 30, 10], center = false);
        // Adjusted protrusion: extended outward and positioned near the top edge
        translate([26, 0, 10]) cube([4, 10, 2], center = false); // Protrusion
    }
}

// Side block
module side_block() {
    difference() {
        cube([10, 30, 30], center = false);
        // Adjusted cutout: shallower and positioned closer to the top edge
        translate([0, 0, 24]) cube([10, 10, 6], center = false); // Cutout
    }
}

// Connector block
module connector_block() {
    difference() {
        cube([30, 10, 10], center = false);
        // Adjusted groove: widened and more recessed
        translate([10, 0, 2]) cube([10, 10, 6], center = false); // Groove
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

