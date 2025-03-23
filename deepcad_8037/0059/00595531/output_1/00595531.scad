
// Central Block
module central_block() {
    cube([20, 20, 20], center = true);
}

// Side Block
module side_block() {
    hull() {
        translate([-10, -5, 0]) cube([20, 10, 10], center = true);
        translate([-10, 5, 0]) cube([20, 10, 10], center = true);
    }
}

// Connector Block
module connector_block() {
    hull() {
        translate([-10, -5, 0]) cube([20, 10, 10], center = true);
        translate([-10, 5, 0]) cube([20, 10, 10], center = true);
    }
}

// Base Block
module base_block() {
    cube([20, 20, 20], center = true);
}

// Corner Block
module corner_block() {
    cube([20, 20, 20], center = true);
}

// Edge Block
module edge_block() {
    cube([20, 20, 20], center = true);
}

// Assemble the model
module model() {
    // Layer 1: Central Block
    translate([0, 0, 50]) central_block();

    // Layer 2: Connector Blocks
    translate([-30, 0, 30]) connector_block();
    translate([30, 0, 30]) connector_block();

    // Layer 3: Side Blocks
    translate([-50, 0, 10]) side_block();
    translate([50, 0, 10]) side_block();

    // Layer 4: Corner Blocks
    translate([-50, -50, -10]) corner_block();
    translate([50, -50, -10]) corner_block();
    translate([-50, 50, -10]) corner_block();
    translate([50, 50, -10]) corner_block();

    // Layer 5: Edge Blocks
    translate([-50, 0, -30]) edge_block();
    translate([50, 0, -30]) edge_block();
    translate([0, -50, -30]) edge_block();
    translate([0, 50, -30]) edge_block();

    // Layer 6: Base Block
    translate([0, 0, -50]) base_block();
}

// Render the model
model();

