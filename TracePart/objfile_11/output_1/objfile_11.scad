
// Parameters
shaft_diameter = 6; // Adjusted diameter of the shaft to match the original model
shaft_length = 15; // Adjusted length of the shaft to match the original model
central_body_diameter = 20; // Diameter of the central body remains the same
central_body_length = 25; // Adjusted length of the central body to match the original model
groove_depth = 0.5; // Reduced depth of the grooves to match the original model
groove_width = 2; // Width of the grooves remains the same
groove_spacing = 8; // Adjusted spacing between grooves to match the original model
set_screw_diameter = 3; // Diameter of the set screws remains the same
set_screw_length = 5; // Length of the set screws remains the same
set_screw_hole_offset = 8; // Distance from the center to the set screw holes remains the same

// Shaft
module shaft() {
    cylinder(h = shaft_length, d = shaft_diameter, $fn = 100);
}

// Central Body
module central_body() {
    difference() {
        cylinder(h = central_body_length, d = central_body_diameter, $fn = 100);
        // Create grooves
        for (i = [0 : groove_spacing : central_body_length - groove_spacing]) {
            translate([0, 0, i])
                cylinder(h = groove_width, d = central_body_diameter + groove_depth, $fn = 100);
        }
        // Create set screw holes
        translate([central_body_diameter / 2 - set_screw_hole_offset, 0, central_body_length / 2])
            rotate([90, 0, 0])
                cylinder(h = central_body_diameter, d = set_screw_diameter, $fn = 100);
        translate([-central_body_diameter / 2 + set_screw_hole_offset, 0, central_body_length / 2])
            rotate([90, 0, 0])
                cylinder(h = central_body_diameter, d = set_screw_diameter, $fn = 100);
    }
}

// Set Screw
module set_screw() {
    cylinder(h = set_screw_length, d = set_screw_diameter, $fn = 100);
}

// Assembly
module flexible_coupling() {
    union() {
        // Layer 1: Shaft
        translate([0, 0, central_body_length])
            shaft();
        // Layer 2: Central Body
        central_body();
        // Set screws
        translate([central_body_diameter / 2 - set_screw_hole_offset, 0, central_body_length / 2])
            set_screw();
        translate([-central_body_diameter / 2 + set_screw_hole_offset, 0, central_body_length / 2])
            set_screw();
    }
}

// Render the model
flexible_coupling();

