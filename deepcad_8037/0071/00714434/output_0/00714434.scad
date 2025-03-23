
// Spacer Ring Component
// Description: A flat, circular ring with a hollow center. It is thin and has a smooth surface.

module spacer_ring() {
    difference() {
        // Outer cylinder
        cylinder(h=2, r=20, center=true);
        // Inner hollow cylinder
        translate([0, 0, -1]) cylinder(h=4, r=10, center=true);
    }
}

// Render the spacer ring
spacer_ring();

