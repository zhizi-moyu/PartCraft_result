
// Parameters
cylinder_diameter = 20;
cylinder_length = 40;
shaft_hole_diameter = 8;
bolt_hole_diameter = 5;
bolt_hole_offset = 10;

// Module for the input/output cylinder
module end_cylinder() {
    difference() {
        cylinder(d=cylinder_diameter, h=cylinder_length, $fn=100);
        translate([0, 0, -1]) cylinder(d=shaft_hole_diameter, h=cylinder_length + 2, $fn=100);
    }
}

// Module for the central cylinder with bolt holes
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
}

// Assemble the coupling
module flexible_coupling() {
    translate([0, 0, cylinder_length]) end_cylinder();
    central_cylinder();
    translate([0, 0, -cylinder_length]) end_cylinder();
}

// Render the model
flexible_coupling();

