
// Define dimensions for the components
module central_block() {
    difference() {
        cube([30, 20, 10], center = true); // Main block
        translate([-15, -5, -5])
            cube([30, 10, 10], center = true); // U-shaped cutout
    }
}

module side_block() {
    difference() {
        cube([15, 20, 10], center = true); // Main block
        translate([-7.5, -5, -5])
            cube([10, 10, 10], center = true); // Rectangular cutout
    }
}

module connector_block() {
    difference() {
        cube([10, 10, 10], center = true); // Main block
        translate([-5, -2.5, -5])
            cube([10, 5, 10], center = true); // Protruding section
    }
}

// Assemble the components
module assembly() {
    // Layer 1: Side blocks
    translate([-22.5, 0, 0])
        side_block();
    translate([22.5, 0, 0])
        side_block();

    // Layer 2: Central block
    central_block();

    // Layer 3: Connector block
    translate([0, 0, 5])
        connector_block();
}

// Render the assembly
assembly();

