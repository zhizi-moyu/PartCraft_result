
// Spacer Ring Component
// Description: A flat, circular ring with a smooth surface and a central hole.

module spacer_ring() {
    difference() {
        // Outer cylinder (ring body)
        cylinder(h=2, r=10, center=true);
        // Inner cylinder (hole)
        translate([0, 0, -1]) cylinder(h=4, r=3, center=true);
    }
}

// Render the spacer ring
spacer_ring();

