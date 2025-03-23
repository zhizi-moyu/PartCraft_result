
// Spacer Ring Component
// Description: A flat, circular ring with a hollow center. It is thin and has a smooth surface.

module spacer_ring() {
    difference() {
        // Outer cylinder
        cylinder(h=1, r=20, center=true); // Reduced thickness from 1.5 to 1 to match the original model
        // Inner hollow cylinder
        translate([0, 0, -0.5]) cylinder(h=2, r=10, center=true); // Adjusted inner cylinder height to match the reduced thickness
    }
}

// Render the spacer ring
spacer_ring();

