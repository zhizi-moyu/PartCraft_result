
// Parameters for the link plate
link_plate_length = 40; // Length of the link plate
link_plate_width = 10;  // Width of the link plate
link_plate_thickness = 1.5; // Thickness of the link plate
hole_diameter = 5; // Diameter of the holes
hole_spacing = 30; // Distance between the centers of the two holes
curvature_radius = 3; // Curvature for the edges

// Parameters for the bolt
bolt_diameter = 4; // Diameter of the bolt
bolt_length = 6; // Shortened length of the bolt

// Parameters for the nut
nut_diameter = 6; // Reduced diameter of the nut
nut_thickness = 2; // Reduced thickness of the nut
nut_offset = 0; // Position flush with the link plate

// Function to create a link plate
module link_plate() {
    difference() {
        // Base plate
        linear_extrude(height = link_plate_thickness) {
            offset(r = curvature_radius) 
                square([link_plate_length, link_plate_width], center = true);
        }
        // Holes
        translate([-hole_spacing / 2, 0, 0])
            cylinder(h = link_plate_thickness + 1, d = hole_diameter, center = true);
        translate([hole_spacing / 2, 0, 0])
            cylinder(h = link_plate_thickness + 1, d = hole_diameter, center = true);
    }
}

// Function to create a bolt
module bolt() {
    cylinder(h = bolt_length, d = bolt_diameter, center = false);
}

// Function to create a nut
module nut() {
    difference() {
        // Hexagonal prism
        linear_extrude(height = nut_thickness)
            polygon(points = [
                [cos(0) * nut_diameter / 2, sin(0) * nut_diameter / 2],
                [cos(PI / 3) * nut_diameter / 2, sin(PI / 3) * nut_diameter / 2],
                [cos(2 * PI / 3) * nut_diameter / 2, sin(2 * PI / 3) * nut_diameter / 2],
                [cos(PI) * nut_diameter / 2, sin(PI) * nut_diameter / 2],
                [cos(4 * PI / 3) * nut_diameter / 2, sin(4 * PI / 3) * nut_diameter / 2],
                [cos(5 * PI / 3) * nut_diameter / 2, sin(5 * PI / 3) * nut_diameter / 2]
            ]);
        // Internal threading (hole)
        translate([0, 0, -1])
            cylinder(h = nut_thickness + 2, d = bolt_diameter, center = false);
    }
}

// Assembly of the flexible coupling
module flexible_coupling() {
    for (i = [0:5]) {
        translate([0, 0, i * (link_plate_thickness + 2)]) { // Adjusted spacing between plates
            link_plate();
            // Add bolts and nuts
            translate([-hole_spacing / 2, 0, -bolt_length / 2])
                bolt();
            translate([hole_spacing / 2, 0, -bolt_length / 2])
                bolt();
            translate([-hole_spacing / 2, 0, link_plate_thickness])
                nut();
            translate([hole_spacing / 2, 0, link_plate_thickness])
                nut();
        }
    }
}

// Render the flexible coupling
flexible_coupling();

