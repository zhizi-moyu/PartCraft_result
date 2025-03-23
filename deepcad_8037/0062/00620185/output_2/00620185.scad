
// Define dimensions for the components
module central_block() {
    difference() {
        cube([30, 20, 10], center = true); // Main block
        translate([-15, -8.5, -5]) // Adjusted cutout width to match original proportions
            cube([30, 17, 10], center = true); // Wider U-shaped cutout
    }
}

module side_block() {
    difference() {
        cube([15, 20, 10], center = true); // Main block
        translate([-7.5, -4, -5]) // Adjusted cutout depth to match original design
            cube([10, 12, 10], center = true); // Shallower rectangular cutout
    }
}

module connector_block() {
    difference() {
        cube([10, 10, 10], center = true); // Main block
        translate([-5, -2.5, -5]) // Adjusted protruding section dimensions
            cube([10, 8, 10], center = true); // Larger and more pronounced protruding section
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

