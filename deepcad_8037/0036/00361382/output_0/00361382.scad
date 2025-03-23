
// Base Block
module base_block() {
    difference() {
        cube([40, 20, 10]); // Main rectangular block
        translate([30, 0, 0]) rotate([0, 45, 0]) cube([20, 20, 10]); // Slanted edge
        translate([0, 5, 10]) cube([10, 10, 5]); // Rectangular protrusion
    }
}

// Angled Block
module angled_block() {
    difference() {
        cube([20, 20, 10]); // Main rectangular base
        translate([0, 0, 0]) rotate([0, 45, 0]) cube([20, 20, 10]); // Slanted edge
    }
}

// Flat Block
module flat_block() {
    cube([40, 20, 5]); // Simple rectangular block
}

// Connector Block
module connector_block() {
    difference() {
        cube([40, 20, 10]); // Main rectangular block
        translate([30, 0, 0]) rotate([0, 45, 0]) cube([20, 20, 10]); // Slanted edge
        translate([0, 5, 10]) cube([10, 10, 5]); // Rectangular protrusion
    }
}

// Assembly
module assembly() {
    // Layer 1: Angled Blocks
    translate([0, 0, 30]) angled_block();
    translate([20, 0, 30]) angled_block();

    // Layer 2: Connector Block
    translate([0, 0, 20]) connector_block();

    // Layer 3: Flat Block
    translate([0, 0, 10]) flat_block();

    // Layer 4: Base Block
    translate([0, 0, 0]) base_block();
}

// Render the assembly
assembly();

