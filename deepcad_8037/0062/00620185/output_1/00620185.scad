
// Define dimensions for the components
module central_block() {
    difference() {
        cube([30, 20, 10], center = true); // Main block
        translate([-15, -7, -5]) // Adjusted cutout width to match original proportions
            cube([30, 14, 10], center = true); // Wider U-shaped cutout
    }
}

module side_block() {
    difference() {
        cube([15, 20, 10], center = true); // Main block
        translate([-7.5, -5, -5]) // Adjusted cutout depth to match original design
            cube([10, 15, 10], center = true); // Deeper rectangular cutout
    }
}

module connector_block() {
    difference() {
        cube([10, 10, 10], center = true); // Main block
        translate([-5, -2.5, -5]) // Adjusted protruding section dimensions
            cube([10, 7, 10], center = true); // Larger protruding section
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

