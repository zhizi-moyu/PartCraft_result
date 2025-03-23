
// Parameters for the central shaft
central_shaft_length = 65; // Elongated length to match the original model
central_shaft_diameter = 10; // Diameter remains the same
$fn = 200; // Increased resolution for smoother surface

// Function to create a cylindrical shaft
module central_shaft() {
    cylinder(h = central_shaft_length, d = central_shaft_diameter, center = true);
}

// Render the central shaft
translate([0, 0, 0]) {
    central_shaft();
}

// Parameters for the input shaft
input_shaft_length = 40; // Length of the input shaft
input_shaft_outer_diameter = 10; // Increased diameter to match the original model
input_shaft_inner_diameter = 4; // Hollow center diameter
$fn = 200; // Increased resolution for smoother surface

// Function to create a hollow cylindrical input shaft
module input_shaft() {
    difference() {
        cylinder(h = input_shaft_length, d = input_shaft_outer_diameter, center = true);
        cylinder(h = input_shaft_length, d = input_shaft_inner_diameter, center = true);
    }
}

// Render the input shaft
translate([0, 0, -30]) {
    input_shaft();
}

// Parameters for the output shaft
output_shaft_length = 55; // Lengthened to match the original model
output_shaft_outer_diameter = 10; // Increased diameter to match the original model
output_shaft_inner_diameter = 4; // Hollow center diameter
$fn = 200; // Increased resolution for smoother surface

// Function to create a hollow cylindrical output shaft
module output_shaft() {
    difference() {
        cylinder(h = output_shaft_length, d = output_shaft_outer_diameter, center = true);
        cylinder(h = output_shaft_length, d = output_shaft_inner_diameter, center = true);
    }
}

// Render the output shaft
translate([0, 0, 30]) {
    output_shaft();
}

// Parameters for the spacer ring
spacer_ring_outer_diameter = 12; // Outer diameter of the spacer ring
spacer_ring_inner_diameter = 8; // Inner diameter of the spacer ring
spacer_ring_thickness = 1; // Reduced thickness to match the original model
$fn = 200; // Increased resolution for smoother surface

// Function to create a spacer ring
module spacer_ring() {
    difference() {
        cylinder(h = spacer_ring_thickness, d = spacer_ring_outer_diameter, center = true);
        cylinder(h = spacer_ring_thickness, d = spacer_ring_inner_diameter, center = true);
    }
}

// Render the spacer ring
translate([0, 0, 15]) {
    spacer_ring();
}

// Parameters for the flange plate
flange_plate_diameter = 20; // Diameter remains the same
flange_plate_thickness = 2; // Reduced thickness to match the original model
bolt_hole_diameter = 2; // Diameter of the bolt holes
bolt_hole_count = 8; // Increased number of bolt holes to match the original model
$fn = 200; // Increased resolution for smoother surface

// Function to create a flange plate with bolt holes
module flange_plate() {
    difference() {
        cylinder(h = flange_plate_thickness, d = flange_plate_diameter, center = true);
        for (i = [0 : 360 / bolt_hole_count : 360 - 360 / bolt_hole_count]) {
            rotate([0, 0, i]) {
                translate([flange_plate_diameter / 2 - 2, 0, 0]) {
                    cylinder(h = flange_plate_thickness + 1, d = bolt_hole_diameter, center = true);
                }
            }
        }
    }
}

// Render the flange plate
translate([0, 0, -15]) {
    flange_plate();
}

// Parameters for the nut
nut_size = 4; // Reduced size to match the original model
nut_thickness = 2; // Thickness of the nut
$fn = 6; // Hexagonal shape

// Function to create a hexagonal nut
module nut() {
    cylinder(h = nut_thickness, d = nut_size, center = true);
}

// Render the nut
translate([0, 0, 45]) {
    nut();
}

// Parameters for the bolt
bolt_length = 50; // Lengthened to match the original model
bolt_diameter = 3; // Diameter of the bolt
thread_diameter = 2.5; // Diameter of the threaded end
thread_length = 15; // Lengthened threaded end to match the original model
$fn = 200; // Increased resolution for smoother surface

// Function to create a bolt with a threaded end
module bolt() {
    union() {
        cylinder(h = bolt_length - thread_length, d = bolt_diameter, center = true);
        cylinder(h = thread_length, d = thread_diameter, center = true);
    }
}

// Render the bolt
translate([0, 0, -45]) {
    bolt();
}

