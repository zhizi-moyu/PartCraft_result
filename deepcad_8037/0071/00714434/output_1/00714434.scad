
// Spacer Ring Component
// Description: A flat, circular ring with a hollow center. It is thin and has a smooth surface.

module spacer_ring() {
    difference() {
        // Outer cylinder
        cylinder(h=1.5, r=20, center=true); // Reduced thickness from 2 to 1.5
        // Inner hollow cylinder
        translate([0, 0, -1]) cylinder(h=3, r=10, center=true); // Adjusted inner cylinder height to match the reduced thickness
    }
}

// Render the spacer ring
spacer_ring();

