
// Parameters for the spacer_ring
ring_outer_diameter = 40; // Outer diameter of the ring
ring_inner_diameter = 20; // Inner diameter of the ring
ring_thickness = 5;       // Thickness of the ring

// Spacer Ring Module
module spacer_ring() {
    difference() {
        // Outer cylinder
        cylinder(h = ring_thickness, d = ring_outer_diameter, $fn = 100);
        // Inner cylinder (hole)
        translate([0, 0, -1]) // Slightly offset to ensure clean subtraction
        cylinder(h = ring_thickness + 2, d = ring_inner_diameter, $fn = 100);
    }
}

// Render the spacer_ring
spacer_ring();

