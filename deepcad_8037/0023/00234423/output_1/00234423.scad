
// Base Block
module base_block() {
    difference() {
        cube([60, 30, 10]); // Main block
        translate([0, 0, 8]) cube([25, 30, 8]); // Adjusted stepped cutout (reduced size and depth)
    }
}

// L-Shaped Connector
module l_shaped_connector() {
    union() {
        cube([28, 8, 8]); // Adjusted horizontal base (narrower base)
        translate([0, 0, 8]) cube([8, 8, 18]); // Adjusted vertical extension (reduced thickness)
    }
}

// Flat Rectangular Block
module flat_rectangular_block() {
    cube([60, 30, 4]); // Adjusted flat block (reduced thickness)
}

// Assembly
module assembly() {
    // Layer 3: Base Block
    base_block();

    // Layer 2: L-Shaped Connectors
    translate([5, 5, 10]) l_shaped_connector(); // Left connector
    translate([35, 5, 10]) l_shaped_connector(); // Right connector

    // Layer 1: Flat Rectangular Block
    translate([0, 0, 28]) flat_rectangular_block(); // Adjusted height to match changes
}

// Render the assembly
assembly();

