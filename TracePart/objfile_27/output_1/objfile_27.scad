
// Parameters
cylinder_diameter = 25; // Increased diameter to match original proportions
cylinder_length = 30; // Shortened length to match original
shaft_hole_diameter = 8;
bolt_hole_diameter = 5;
bolt_hole_offset = 10;
bolt_protrusion_diameter = 8; // Diameter of the bolt hole protrusions
bolt_protrusion_length = 3; // Length of the protrusions

// Module for the input/output cylinder
module end_cylinder() {
    difference() {
        cylinder(d=cylinder_diameter, h=cylinder_length, $fn=100);
        translate([0, 0, -1]) cylinder(d=shaft_hole_diameter, h=cylinder_length + 2, $fn=100);
        
        // Adding bolt holes to match the original model
        for (angle = [0, 180]) {
            rotate([0, 0, angle])
            translate([cylinder_diameter / 2 - 2, 0, cylinder_length / 2 - bolt_hole_offset])
            rotate([90, 0, 0])
            cylinder(d=bolt_hole_diameter, h=cylinder_diameter, $fn=100);
        }
    }
}

// Module for the central cylinder with bolt holes and protrusions
module central_cylinder() {
    difference() {
        cylinder(d=cylinder_diameter, h=cylinder_length, $fn=100);
        
        // Bolt holes
        for (angle = [0, 180]) {
            rotate([0, 0, angle])
            translate([cylinder_diameter / 2 - 2, 0, cylinder_length / 2 - bolt_hole_offset])
            rotate([90, 0, 0])
            cylinder(d=bolt_hole_diameter, h=cylinder_diameter, $fn=100);
        }
    }
    
    // Adding bolt hole protrusions
    for (angle = [0, 180]) {
        rotate([0, 0, angle])
        translate([cylinder_diameter / 2 - 2, 0, cylinder_length / 2 - bolt_hole_offset])
        rotate([90, 0, 0])
        translate([0, 0, -bolt_protrusion_length / 2])
        cylinder(d=bolt_protrusion_diameter, h=bolt_protrusion_length, $fn=100);
    }
}

// Assemble the coupling
module flexible_coupling() {
    translate([0, 0, cylinder_length]) end_cylinder();
    central_cylinder();
    translate([0, 0, -cylinder_length]) end_cylinder();
}

// Render the model
flexible_coupling();

