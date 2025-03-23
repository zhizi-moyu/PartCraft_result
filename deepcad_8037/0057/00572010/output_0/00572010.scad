
// Dimensions for each component
module central_block() {
    cube([20, 20, 10], center = true); // Central block dimensions
}

module side_block() {
    cube([18, 18, 8], center = true); // Side block dimensions
}

module spacer_block() {
    cube([18, 18, 2], center = true); // Spacer block dimensions
}

module connector_block() {
    cube([10, 10, 5], center = true); // Connector block dimensions
}

// Assembly of the model
module flexible_coupling() {
    // Layer 1: Side blocks
    translate([-15, 0, 15]) side_block(); // Side block 1
    translate([15, 0, 15]) side_block();  // Side block 2

    // Layer 2: Spacer blocks
    translate([-15, 0, 7]) spacer_block(); // Spacer block 1
    translate([15, 0, 7]) spacer_block();  // Spacer block 2

    // Layer 3: Central block
    translate([0, 0, 0]) central_block();

    // Layer 4: Connector block
    translate([0, 0, -7.5]) connector_block();
}

// Render the model
flexible_coupling();

