
// Base Block
module base_block() {
    cube([50, 30, 10]); // Main block with flattened top surface
}

// Side Plate
module side_plate() {
    difference() {
        cube([30, 5, 40]); // Main plate
        translate([0, 0, 20]) cube([20, 5, 20]); // Adjusted cutout for more defined L-shape
    }
}

// Connector Block
module connector_block() {
    difference() {
        cube([30, 20, 10]); // Main block
        translate([5, 0, 0]) cube([20, 20, 10]); // Widened U-shaped cutout
    }
}

// Support Block
module support_block() {
    difference() {
        cube([40, 20, 10]); // Main block
        translate([0, 0, 0]) rotate([0, 0, 45]) cube([30, 30, 10]); // Deepened slanted cut for sharper angled profile
    }
}

// Spacer Block
module spacer_block() {
    difference() {
        cube([20, 10, 5]); // Main block
        translate([10, 0, 0]) cube([15, 10, 5]); // Enlarged notch for more distinct stepped appearance
    }
}

// Assembly
module assembly() {
    // Layer 5: Base Block
    translate([0, 0, 0]) base_block();

    // Layer 4: Side Plates
    translate([10, 0, 10]) side_plate();
    translate([10, 25, 10]) side_plate();

    // Layer 3: Support Block
    translate([5, 5, 20]) support_block();

    // Layer 2: Spacer Block
    translate([15, 10, 30]) spacer_block();

    // Layer 1: Connector Block
    translate([10, 5, 35]) connector_block();
}

// Render the assembly
assembly();

