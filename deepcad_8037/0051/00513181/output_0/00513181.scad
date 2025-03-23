
// Parameters for the spacer ring
ring_outer_diameter = 40; // Outer diameter of the ring
ring_inner_diameter = 20; // Inner diameter (hollow center)
ring_thickness = 10;      // Thickness of the ring

// Spacer ring generation
difference() {
    // Outer cylinder (main body of the ring)
    cylinder(h = ring_thickness, d = ring_outer_diameter, center = true);
    
    // Inner cylinder (hollow center)
    cylinder(h = ring_thickness + 1, d = ring_inner_diameter, center = true);
}

