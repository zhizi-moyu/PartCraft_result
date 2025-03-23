
// Parameters for the spacer ring
ring_outer_diameter = 40; // Outer diameter of the ring
ring_inner_diameter = 22; // Inner diameter (hollow center)
ring_thickness = 6;       // Reduced thickness of the ring to match the original model
fillet_radius = 1;        // Radius for smoothing edges

// Spacer ring generation
difference() {
    // Outer cylinder (main body of the ring)
    cylinder(h = ring_thickness, d = ring_outer_diameter, center = true);
    
    // Inner cylinder (hollow center) with filleted edges
    translate([0, 0, -fillet_radius]) {
        cylinder(h = ring_thickness + 2 * fillet_radius, d = ring_inner_diameter, center = true);
    }
}

