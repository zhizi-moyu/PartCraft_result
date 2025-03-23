
// Base block dimensions
module base_block() {
    // Adjusted to have a flat top surface as per the original model
    cube([40, 40, 10], center = false);
}

// L-shaped block dimensions
module l_shaped_block() {
    // Simplified geometry to match the original model's flat and perpendicular sections
    difference() {
        cube([25, 25, 20], center = false); // Original size
        translate([10, 10, 0]) cube([15, 15, 20], center = false); // Original cutout
    }
}

// Vertical block dimensions
module vertical_block() {
    // Resized to be shorter and wider as per the original model
    cube([20, 20, 15], center = false);
}

// Assemble the model
module flexible_coupling() {
    // Layer 3: Base block
    base_block();

    // Layer 2: L-shaped block
    translate([7.5, 7.5, 10]) l_shaped_block(); // Adjusted position for alignment

    // Layer 1: Vertical block
    translate([10, 10, 30]) vertical_block(); // Adjusted position for alignment
}

// Render the model
flexible_coupling();

