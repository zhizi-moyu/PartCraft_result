
// Spacer Ring Parameters
module spacer_ring() {
    difference() {
        cylinder(h=7, r=20, $fn=100); // Outer cylinder with increased thickness
        cylinder(h=7, r=10, $fn=100); // Inner hole with matching height
    }
}

// Generate all six spacer rings
translate([0, 0, 0]) spacer_ring(); // Spacer Ring 1
translate([40, 0, 0]) spacer_ring(); // Spacer Ring 2
translate([80, 0, 0]) spacer_ring(); // Spacer Ring 3
translate([120, 0, 0]) spacer_ring(); // Spacer Ring 4
translate([160, 0, 0]) spacer_ring(); // Spacer Ring 5
translate([200, 0, 0]) spacer_ring(); // Spacer Ring 6

