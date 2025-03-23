
// Parameters for the central shaft
central_shaft_diameter = 20; // Diameter of the central shaft
central_shaft_length = 65;   // Length of the central shaft (increased slightly for accuracy)
$fn = 100;                   // Increased resolution for smoother surface

// Central Shaft
module central_shaft() {
    cylinder(h = central_shaft_length, d = central_shaft_diameter, center = true);
}

// Render the central shaft
translate([0, 0, 0]) {
    central_shaft();
}

// Parameters for the input shaft
input_shaft_diameter = 15; // Diameter of the input shaft
input_shaft_length = 50;   // Length of the input shaft (increased slightly for accuracy)
$fn = 100;                 // Increased resolution for smoother surface

// Input Shaft
module input_shaft() {
    cylinder(h = input_shaft_length, d = input_shaft_diameter, center = true);
}

// Render the input shaft
translate([0, 0, -30]) {
    input_shaft();
}

// Parameters for the output shaft
output_shaft_diameter = 15; // Diameter of the output shaft
output_shaft_length = 50;   // Length of the output shaft (increased slightly for accuracy)
$fn = 100;                  // Increased resolution for smoother surface

// Output Shaft
module output_shaft() {
    cylinder(h = output_shaft_length, d = output_shaft_diameter, center = true);
}

// Render the output shaft
translate([0, 0, 30]) {
    output_shaft();
}

// Parameters for the spacer ring
spacer_ring_outer_diameter = 25; // Outer diameter of the spacer ring
spacer_ring_inner_diameter = 20; // Inner diameter of the spacer ring
spacer_ring_thickness = 2;       // Thickness of the spacer ring (reduced for accuracy)
$fn = 100;                       // Increased resolution for smoother surface

// Spacer Ring
module spacer_ring() {
    difference() {
        cylinder(h = spacer_ring_thickness, d = spacer_ring_outer_diameter, center = true);
        cylinder(h = spacer_ring_thickness + 1, d = spacer_ring_inner_diameter, center = true);
    }
}

// Render the spacer ring
translate([0, 0, 0]) {
    spacer_ring();
}

// Parameters for the flange plate
flange_plate_diameter = 40; // Diameter of the flange plate
flange_plate_thickness = 3; // Thickness of the flange plate (reduced for accuracy)
bolt_hole_diameter = 5;     // Diameter of the bolt holes
bolt_hole_count = 6;        // Number of bolt holes (increased for accuracy)
$fn = 100;                  // Increased resolution for smoother surface

// Flange Plate
module flange_plate() {
    difference() {
        cylinder(h = flange_plate_thickness, d = flange_plate_diameter, center = true);
        for (i = [0:360/bolt_hole_count:360-360/bolt_hole_count]) {
            rotate([0, 0, i]) {
                translate([flange_plate_diameter/2 - 5, 0, 0]) {
                    cylinder(h = flange_plate_thickness + 1, d = bolt_hole_diameter, center = true);
                }
            }
        }
    }
}

// Render the flange plate
translate([0, 0, -35]) {
    flange_plate();
}

// Parameters for the nut
nut_diameter = 10; // Diameter of the nut
nut_thickness = 5; // Thickness of the nut (reduced for accuracy)
$fn = 6;           // Hexagonal shape for the nut

// Nut
module nut() {
    cylinder(h = nut_thickness, d = nut_diameter, center = true);
}

// Render the nut
translate([0, 0, 40]) {
    nut();
}

// Parameters for the bolt
bolt_diameter = 8; // Diameter of the bolt (reduced for accuracy)
bolt_length = 20;  // Length of the bolt
bolt_head_diameter = 12; // Diameter of the bolt head
bolt_head_thickness = 4; // Thickness of the bolt head
$fn = 6;                 // Hexagonal shape for the bolt head

// Bolt
module bolt() {
    union() {
        cylinder(h = bolt_length, d = bolt_diameter, center = true);
        translate([0, 0, bolt_length/2]) {
            cylinder(h = bolt_head_thickness, d = bolt_head_diameter, center = true);
        }
    }
}

// Render the bolt
translate([0, 0, -50]) {
    bolt();
}

