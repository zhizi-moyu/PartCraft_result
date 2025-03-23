
// Spacer Ring Parameters
module spacer_ring() {
    difference() {
        // Outer cylinder
        cylinder(h=2, r=20, $fn=100);
        // Inner cylinder (hollow center)
        cylinder(h=2, r=15, $fn=100);
    }
}

// Generate Spacer Rings
translate([0, 0, 0]) spacer_ring(); // Layer 1

