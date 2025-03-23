
// Parameters for the connector link
connector_length = 40; // Length of the connector link
connector_width = 15;  // Width of the connector link
connector_thickness = 3; // Thickness of the connector link
hole_diameter = 8; // Diameter of the holes
hole_spacing = 30; // Distance between the centers of the holes

module connector_link() {
    // Base curved rectangular plate
    difference() {
        // Main body
        hull() {
            translate([-connector_length/2, -connector_width/2, 0])
                circle(connector_width/2);
            translate([connector_length/2, -connector_width/2, 0])
                circle(connector_width/2);
            translate([-connector_length/2, connector_width/2, 0])
                circle(connector_width/2);
            translate([connector_length/2, connector_width/2, 0])
                circle(connector_width/2);
        }
        // Holes
        translate([-hole_spacing/2, 0, connector_thickness/2])
            cylinder(h=connector_thickness+1, r=hole_diameter/2, center=true);
        translate([hole_spacing/2, 0, connector_thickness/2])
            cylinder(h=connector_thickness+1, r=hole_diameter/2, center=true);
    }
}

// Render the connector link
connector_link();

