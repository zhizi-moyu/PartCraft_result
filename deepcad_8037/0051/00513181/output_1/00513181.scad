
// Parameters for the spacer ring
ring_outer_diameter = 40; // Outer diameter of the ring
ring_inner_diameter = 22; // Adjusted inner diameter (hollow center) to increase size
ring_thickness = 8;       // Adjusted thickness of the ring to reduce profile

// Spacer ring generation
difference() {
    // Outer cylinder (main body of the ring)
    cylinder(h = ring_thickness, d = ring_outer_diameter, center = true);
    
    // Inner cylinder (hollow center)
    cylinder(h = ring_thickness + 1, d = ring_inner_diameter, center = true);
}

