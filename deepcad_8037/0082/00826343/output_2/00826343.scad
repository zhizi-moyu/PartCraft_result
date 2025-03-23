
// Define dimensions for the components
module central_block() {
    difference() {
        // Base block
        cube([40, 20, 10], center = true);
        // Adjusted cutout for stepped profile to match original model
        translate([0, 0, 5])
            cube([28, 20, 10], center = true); // Narrower cutout for a wider central section
        // Additional tier for a more pronounced stepped profile
        translate([0, 0, 7.5])
            cube([20, 20, 5], center = true);
    }
}

module side_block() {
    // Adjusted side block dimensions to match original model
    cube([20, 20, 8], center = true); // Reduced height for a lower profile
}

// Assemble the model
module flexible_coupling() {
    // Layer 2: Central block
    central_block();

    // Layer 1: Side blocks (repositioned further apart and lowered)
    translate([-35, 0, -9]) // Position left side block
        side_block();
    translate([35, 0, -9]) // Position right side block
        side_block();
}

// Render the model
flexible_coupling();

