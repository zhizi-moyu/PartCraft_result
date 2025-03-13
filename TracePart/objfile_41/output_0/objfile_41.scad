
// Parameters
central_body_diameter = 30; // Diameter of the central body
central_body_length = 40; // Length of the central body
groove_width = 2; // Width of each groove
groove_spacing = 3; // Spacing between grooves
groove_depth = 2; // Depth of each groove
split_thickness = 0.5; // Thickness of the axial split
hole_diameter = 5; // Diameter of the through holes
hole_spacing = 120; // Angular spacing of the holes (degrees)
hole_offset = 10; // Distance of the holes from the ends of the cylinder
screw_length = 45; // Length of the screws
screw_diameter = 4; // Diameter of the screws

// Central Body
module central_body() {
    difference() {
        // Main cylinder
        cylinder(d = central_body_diameter, h = central_body_length, $fn = 100);
        
        // Axial split
        translate([0, 0, -central_body_length / 2])
            cube([central_body_diameter, split_thickness, central_body_length + 1], center = true);
        
        // Grooves
        for (i = [1 : floor(central_body_length / (groove_width + groove_spacing))]) {
            translate([0, 0, i * (groove_width + groove_spacing) - central_body_length / 2])
                cylinder(d = central_body_diameter + 1, h = groove_depth, $fn = 100);
        }
        
        // Through holes
        for (i = [0, 1, 2]) {
            rotate([0, 0, i * hole_spacing])
                translate([central_body_diameter / 2 - hole_offset, 0, -central_body_length / 2])
                    cylinder(d = hole_diameter, h = central_body_length + 1, $fn = 100);
        }
    }
}

// Clamp Screw
module clamp_screw() {
    cylinder(d = screw_diameter, h = screw_length, $fn = 100);
}

// Assembly
module flexible_coupling() {
    // Central body
    central_body();
    
    // Clamp screws
    for (i = [0, 1, 2]) {
        rotate([0, 0, i * hole_spacing])
            translate([central_body_diameter / 2 - hole_offset, 0, -screw_length / 2])
                clamp_screw();
    }
}

// Render the model
flexible_coupling();

