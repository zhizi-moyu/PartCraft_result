
// Spacer Ring Parameters
module spacer_ring() {
    difference() {
        // Outer cylinder
        cylinder(h=1.5, r=20, $fn=100); // Reduced thickness from 2 to 1.5
        // Inner cylinder (hollow center)
        cylinder(h=1.5, r=15, $fn=100); // Reduced thickness from 2 to 1.5
    }
}

// Bolt Parameters
module bolt() {
    cylinder(h=10, r=2, $fn=50); // Increased length from shorter value to 10
}

// Generate Spacer Rings
translate([0, 0, 0]) spacer_ring(); // Layer 1

// Generate Bolts
translate([5, 5, 0]) bolt(); // Example position for bolt

