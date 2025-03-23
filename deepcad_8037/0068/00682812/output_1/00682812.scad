
// Parameters for the central cylinder
cylinder_diameter = 20; // Diameter of the cylinder
cylinder_height = 12;   // Height of the cylinder (increased to match the original model)

// Central cylinder
module central_cylinder() {
    cylinder(h = cylinder_height, d = cylinder_diameter, center = true);
}

// Render the central cylinder
central_cylinder();

// Parameters for the flange plate
flange_plate_diameter = 30; // Diameter of the flange plate
flange_plate_thickness = 2; // Thickness of the flange plate (reduced to match the original model)

// Flange plate
module flange_plate() {
    cylinder(h = flange_plate_thickness, d = flange_plate_diameter, center = true);
}

// Render the flange plate
translate([0, 0, cylinder_height / 2 + flange_plate_thickness / 2]) flange_plate();

// Parameters for the nut
nut_diameter = 10; // Diameter of the nut
nut_thickness = 5; // Thickness of the nut
nut_hex_size = 8;  // Size of the hexagonal profile (reduced to match the original model)

// Nut
module nut() {
    rotate([0, 0, 30]) {
        for (i = [0:5]) {
            rotate([0, 0, i * 60]) {
                translate([nut_hex_size / 2, 0, 0]) {
                    square([nut_hex_size, nut_thickness], center = true);
                }
            }
        }
    }
}

// Render the nut
translate([0, 0, cylinder_height / 2 + flange_plate_thickness + nut_thickness / 2]) nut();

// Parameters for the bolt
bolt_diameter = 5; // Diameter of the bolt
bolt_length = 15;  // Length of the bolt (increased to match the original model)

// Bolt
module bolt() {
    cylinder(h = bolt_length, d = bolt_diameter, center = true);
}

// Render the bolt
translate([0, 0, cylinder_height / 2 + flange_plate_thickness + nut_thickness + bolt_length / 2]) bolt();

