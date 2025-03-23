// Parameters for the spacer ring
module spacer_ring(outer_diameter = 20, inner_diameter = 10, thickness = 1.5) { // Reduced thickness to match the original model
    difference() {
        // Outer cylinder
        cylinder(d = outer_diameter, h = thickness, center = true);
        // Inner hole
        cylinder(d = inner_diameter, h = thickness + 1, center = true);
    }
}

// Render the spacer ring
spacer_ring();
