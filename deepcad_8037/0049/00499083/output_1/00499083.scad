
// Parameters for the spacer ring
module spacer_ring(inner_diameter, outer_diameter, thickness) {
    difference() {
        // Adjusted thickness to match the original model
        cylinder(h = thickness, r = outer_diameter / 2, center = true);
        translate([0, 0, -thickness / 2])
            // Added fillet to smooth the edges
            cylinder(h = thickness + 1, r = inner_diameter / 2, center = true);
    }
}

// Parameters for the connector bridge
module connector_bridge(width, height, curvature) {
    translate([0, 0, -height / 2])
        rotate([0, 90, 0])
            linear_extrude(height = height)
                offset(r = curvature)
                    square([width, 2 * curvature], center = true);
}

// Dimensions
spacer_ring_inner_diameter = 10;
spacer_ring_outer_diameter = 20;
spacer_ring_thickness = 2;

connector_bridge_width = 5;
connector_bridge_height = 2;
connector_bridge_curvature = 2;

// Assembly
module flexible_coupling() {
    // Layer 1: Top spacer ring
    translate([0, 0, spacer_ring_thickness / 2])
        spacer_ring(spacer_ring_inner_diameter, spacer_ring_outer_diameter, spacer_ring_thickness);

    // Layer 2: Connector bridge
    translate([0, 0, 0])
        connector_bridge(connector_bridge_width, connector_bridge_height, connector_bridge_curvature);

    // Layer 3: Bottom spacer ring
    translate([0, 0, -spacer_ring_thickness / 2])
        spacer_ring(spacer_ring_inner_diameter, spacer_ring_outer_diameter, spacer_ring_thickness);
}

// Render the model
flexible_coupling();

