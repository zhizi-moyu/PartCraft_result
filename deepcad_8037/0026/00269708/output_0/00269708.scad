
// Parameters for the spacer_ring
module spacer_ring() {
    difference() {
        // Outer cylinder
        cylinder(h = 5, r = 20, $fn = 100);
        // Inner hollow
        translate([0, 0, -1]) cylinder(h = 7, r = 10, $fn = 100);
    }
}

// Assemble the model
module assembly() {
    // Layer 1: Spacer Ring
    spacer_ring();
}

// Render the assembly
assembly();

