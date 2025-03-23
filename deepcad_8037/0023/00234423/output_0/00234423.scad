
// Base Block
module base_block() {
    difference() {
        cube([60, 30, 10]); // Main block
        translate([0, 0, 10]) cube([30, 30, 10]); // Stepped cutout
    }
}

// L-Shaped Connector
module l_shaped_connector() {
    union() {
        cube([30, 10, 10]); // Horizontal base
        translate([0, 0, 10]) cube([10, 10, 20]); // Vertical extension
    }
}

// Flat Rectangular Block
module flat_rectangular_block() {
    cube([60, 30, 5]); // Flat block
}

// Assembly
module assembly() {
    // Layer 3: Base Block
    base_block();

    // Layer 2: L-Shaped Connectors
    translate([5, 5, 10]) l_shaped_connector(); // Left connector
    translate([35, 5, 10]) l_shaped_connector(); // Right connector

    // Layer 1: Flat Rectangular Block
    translate([0, 0, 30]) flat_rectangular_block();
}

// Render the assembly
assembly();

