
// Spacer Ring Component
// This code generates a flat, ring-shaped component with a smooth surface.

module spacer_ring() {
    difference() {
        // Outer cylinder
        cylinder(h = 1.0, r = 20, $fn = 100); // Reduced thickness to match the original model
        // Inner cylinder (hollow center)
        translate([0, 0, -0.5]) // Slightly lower the inner cylinder to ensure clean subtraction
        cylinder(h = 2.0, r = 10, $fn = 100); // Adjusted height for proper subtraction
    }
}

// Render the spacer ring
spacer_ring();

