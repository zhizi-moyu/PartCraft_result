
// Spacer Ring Component
module spacer_ring() {
    difference() {
        // Outer cylinder
        cylinder(h = 2, r = 20, $fn = 100);
        // Inner hollow
        cylinder(h = 2.1, r = 10, $fn = 100);
    }
}

// Render the spacer ring
spacer_ring();

