
// Parameters for the central cylinder
cylinder_diameter = 45; // Adjusted diameter to match the original model
cylinder_height = 20;   // Height remains unchanged

// Parameters for the flange plate
flange_diameter = 70;   // Diameter of the flange plate
flange_thickness = 5;   // Reduced thickness to match the original model
bolt_hole_diameter = 5; // Diameter of the bolt holes
bolt_hole_count = 6;    // Number of bolt holes evenly distributed

// Parameters for the nut
nut_diameter = 10;      // Reduced hexagonal profile diameter
nut_height = 5;         // Height of the nut

// Parameters for the bolt
bolt_shaft_diameter = 5; // Diameter of the bolt shaft
bolt_shaft_length = 25;  // Increased shaft length to match the original model
bolt_head_diameter = 8;  // Diameter of the bolt head
bolt_head_height = 3;    // Height of the bolt head

// Central cylinder
module central_cylinder() {
    cylinder(d = cylinder_diameter, h = cylinder_height, center = true);
}

// Flange plate with evenly distributed bolt holes
module flange_plate() {
    difference() {
        cylinder(d = flange_diameter, h = flange_thickness, center = true);
        for (i = [0:360/bolt_hole_count:360-360/bolt_hole_count]) {
            rotate([0, 0, i])
            translate([flange_diameter/2 - 10, 0, 0])
            cylinder(d = bolt_hole_diameter, h = flange_thickness + 1, center = true);
        }
    }
}

// Nut
module nut() {
    rotate([0, 0, 30]) // Align hexagonal profile
    linear_extrude(height = nut_height)
    polygon(points = [[0, nut_diameter/2], [nut_diameter/2, 0], [0, -nut_diameter/2], [-nut_diameter/2, 0]]);
}

// Bolt
module bolt() {
    union() {
        cylinder(d = bolt_shaft_diameter, h = bolt_shaft_length, center = false);
        translate([0, 0, bolt_shaft_length])
        cylinder(d = bolt_head_diameter, h = bolt_head_height, center = false);
    }
}

// Render the components
translate([0, 0, -cylinder_height/2])
central_cylinder();

translate([0, 0, cylinder_height/2])
flange_plate();

translate([flange_diameter/2 - 10, 0, cylinder_height/2 + flange_thickness])
nut();

translate([flange_diameter/2 - 10, 0, cylinder_height/2 + flange_thickness + nut_height])
bolt();

