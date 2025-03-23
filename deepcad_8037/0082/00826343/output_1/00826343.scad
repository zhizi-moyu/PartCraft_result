
// Define dimensions for the components
module central_block() {
    difference() {
        // Base block
        cube([40, 20, 10], center = true);
        // Cutout for stepped profile (simplified to match original model)
        translate([0, 0, 5])
            cube([30, 20, 10], center = true);
    }
}

module side_block() {
    // Side block dimensions
    cube([20, 20, 10], center = true);
}

// Assemble the model
module flexible_coupling() {
    // Layer 2: Central block
    central_block();

    // Layer 1: Side blocks (lowered to base level and detached from central block)
    translate([-30, 0, -10]) // Position left side block
        side_block();
    translate([30, 0, -10]) // Position right side block
        side_block();
}

// Render the model
flexible_coupling();

