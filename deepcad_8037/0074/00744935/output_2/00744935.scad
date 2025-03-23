
// Spacer Ring Component
// Description: A flat, circular ring with a smooth surface and a central hole.
// Adjusted to match the original model with a thinner profile.

module spacer_ring() {
    difference() {
        // Outer cylinder (ring body) - Reduced thickness to match the original model
        cylinder(h=0.8, r=10, center=true); // Thickness reduced from 1 to 0.8
        // Inner cylinder (hole)
        translate([0, 0, -0.4]) cylinder(h=1.6, r=3, center=true); // Adjusted height to match thinner profile
    }
}

// Render the spacer ring
spacer_ring();

