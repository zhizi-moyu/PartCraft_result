
// Spacer Ring Parameters
module spacer_ring() {
    difference() {
        // Outer cylinder
        cylinder(h=1, r=20, $fn=100); // Reduced thickness from 1.5 to 1
        // Inner cylinder (hollow center)
        cylinder(h=1, r=15, $fn=100); // Reduced thickness from 1.5 to 1
    }
}

// Bolt Parameters
module bolt() {
    cylinder(h=15, r=2, $fn=50); // Increased length from 10 to 15
}

// Generate Spacer Rings
translate([0, 0, 0]) spacer_ring(); // Layer 1

// Generate Bolts
translate([5, 5, 0]) bolt(); // Example position for bolt

