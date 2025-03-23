
// Spacer Ring Parameters
module spacer_ring(outer_diameter=20, inner_diameter=15, thickness=2) {
    difference() {
        // Outer cylinder
        cylinder(h=thickness, r=outer_diameter/2, center=true);
        // Inner cylinder (hole)
        cylinder(h=thickness + 1, r=inner_diameter/2, center=true);
    }
}

// Render the spacer ring
spacer_ring();

