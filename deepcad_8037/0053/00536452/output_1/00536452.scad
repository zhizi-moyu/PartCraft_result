
// Spacer Ring Parameters
spacer_ring_outer_diameter = 50; // Outer diameter of the ring
spacer_ring_inner_diameter = 40; // Inner diameter of the ring
spacer_ring_thickness = 1; // Adjusted thickness of the ring to match the original model

// Spacer Ring Component
module spacer_ring() {
    difference() {
        // Outer cylinder
        cylinder(d=spacer_ring_outer_diameter, h=spacer_ring_thickness, $fn=100);
        // Inner cylinder (hole)
        translate([0, 0, -1]) // Ensure the hole is centered
        cylinder(d=spacer_ring_inner_diameter, h=spacer_ring_thickness + 2, $fn=100);
    }
}

// Render Spacer Ring
spacer_ring();

