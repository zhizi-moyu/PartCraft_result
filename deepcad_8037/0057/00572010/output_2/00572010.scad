
// Dimensions for each component
module central_block() {
    cube([24, 24, 10], center = true); // Resized to match original model dimensions
}

module side_block() {
    cube([18, 18, 10], center = true); // Resized to match original model dimensions
}

module spacer_block() {
    cube([18, 2, 10], center = true); // Adjusted dimensions to match original model
}

module connector_block() {
    cube([14, 14, 8], center = true); // Simplified and resized to match original model
}

// Assembly of the model
module flexible_coupling() {
    // Layer 1: Side blocks
    translate([-15, 0, 10]) side_block(); // Side block 1 repositioned closer to central block
    translate([15, 0, 10]) side_block();  // Side block 2 repositioned closer to central block

    // Layer 2: Spacer blocks
    translate([-15, 0, 5]) spacer_block(); // Spacer block 1 added and positioned correctly
    translate([15, 0, 5]) spacer_block();  // Spacer block 2 added and positioned correctly

    // Layer 3: Central block
    translate([0, 0, 0]) central_block(); // Central block resized and repositioned

    // Layer 4: Connector block
    translate([0, 0, -8]) connector_block(); // Connector block simplified and repositioned
}

// Render the model
flexible_coupling();

