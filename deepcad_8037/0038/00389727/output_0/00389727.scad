
// Base block dimensions
module base_block() {
    cube([40, 40, 10], center = false);
}

// L-shaped block dimensions
module l_shaped_block() {
    difference() {
        cube([30, 30, 20], center = false);
        translate([10, 10, 0]) cube([20, 20, 20], center = false);
    }
}

// Vertical block dimensions
module vertical_block() {
    cube([10, 10, 30], center = false);
}

// Assemble the model
module flexible_coupling() {
    // Layer 3: Base block
    base_block();

    // Layer 2: L-shaped block
    translate([5, 5, 10]) l_shaped_block();

    // Layer 1: Vertical block
    translate([15, 15, 30]) vertical_block();
}

// Render the model
flexible_coupling();

