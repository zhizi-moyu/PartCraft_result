
// Parameters for flange plate
plate_thickness = 2; // Thickness of the flange plate
outer_diameter = 50; // Outer diameter of the flange plate
inner_diameter = 30; // Inner diameter of the central hole
bolt_hole_diameter = 5; // Diameter of the bolt holes
bolt_hole_count = 4; // Number of bolt holes
bolt_hole_radius = 20; // Radius of the circle on which bolt holes are positioned

module flange_plate() {
    difference() {
        // Create the main plate
        cylinder(h = plate_thickness, d = outer_diameter, center = true);
        
        // Create the central hole
        cylinder(h = plate_thickness + 1, d = inner_diameter, center = true);
        
        // Create the bolt holes
        for (i = [0:bolt_hole_count-1]) {
            rotate([0, 0, i * 360 / bolt_hole_count])
                translate([bolt_hole_radius, 0, 0])
                cylinder(h = plate_thickness + 1, d = bolt_hole_diameter, center = true);
        }
    }
}

// Render the flange plate
flange_plate();

