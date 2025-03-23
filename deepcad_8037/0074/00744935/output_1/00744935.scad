
// Spacer Ring Component
// Description: A flat, circular ring with a smooth surface and a central hole.
// Adjusted to match the original model with a thinner profile.

module spacer_ring() {
    difference() {
        // Outer cylinder (ring body) - Reduced thickness to match the original model
        cylinder(h=1, r=10, center=true); // Thickness reduced from 2 to 1
        // Inner cylinder (hole)
        translate([0, 0, -0.5]) cylinder(h=2, r=3, center=true); // Adjusted height to match thinner profile
    }
}

// Render the spacer ring
spacer_ring();

