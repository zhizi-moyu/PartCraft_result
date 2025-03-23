
// Spacer Ring Component
// This code generates a flat, ring-shaped component with a smooth surface.

module spacer_ring() {
    difference() {
        // Outer cylinder
        cylinder(h = 2, r = 20, $fn = 100);
        // Inner cylinder (hollow center)
        translate([0, 0, -1]) // Slightly lower the inner cylinder to ensure clean subtraction
        cylinder(h = 4, r = 10, $fn = 100);
    }
}

// Render the spacer ring
spacer_ring();

