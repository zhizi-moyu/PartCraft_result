
// Dimensions for each component
module central_block() {
    cube([20, 20, 8], center = true); // Adjusted height to match original model
}

module side_block() {
    cube([16, 16, 8], center = true); // Adjusted dimensions to match original model
}

module spacer_block() {
    cube([16, 2, 8], center = true); // Added spacer block with adjusted dimensions
}

module connector_block() {
    cube([12, 12, 6], center = true); // Adjusted dimensions to match original model
}

// Assembly of the model
module flexible_coupling() {
    // Layer 1: Side blocks
    translate([-12, 0, 8]) side_block(); // Side block 1 moved closer to central block
    translate([12, 0, 8]) side_block();  // Side block 2 moved closer to central block

    // Layer 2: Spacer blocks
    translate([-12, 0, 4]) spacer_block(); // Spacer block 1 added
    translate([12, 0, 4]) spacer_block();  // Spacer block 2 added

    // Layer 3: Central block
    translate([0, 0, 0]) central_block();

    // Layer 4: Connector block
    translate([0, 0, -6]) connector_block(); // Adjusted position to align with original model
}

// Render the model
flexible_coupling();

