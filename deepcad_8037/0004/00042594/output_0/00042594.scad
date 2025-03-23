
// Base block module
module base_block() {
    // Main rectangular block
    cube([40, 20, 20], center = false);
    // Protruding rectangular section
    translate([20, 0, 20])
        cube([20, 20, 10], center = false);
}

// L-shaped connector module
module l_shaped_connector() {
    // Horizontal arm
    cube([30, 10, 10], center = false);
    // Vertical arm
    translate([20, 0, 10])
        cube([10, 10, 30], center = false);
}

// Assembly
module assembly() {
    // Layer 1: Base block
    base_block();

    // Layer 2: L-shaped connector
    translate([10, 5, 30]) // Positioning above the base block
        l_shaped_connector();
}

// Render the assembly
assembly();

