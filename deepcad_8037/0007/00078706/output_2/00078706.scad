
// Parameters for the central shaft
shaft_diameter = 10; // Diameter of the central shaft
shaft_length = 60;   // Length of the central shaft (elongated to match the original model)

// Central Shaft
module central_shaft() {
    // Ensure a consistent cylindrical shape
    cylinder(d = shaft_diameter, h = shaft_length, center = true);
}

// Parameters for the input shaft
input_shaft_diameter = 8; // Diameter of the input shaft
input_shaft_length = 50;  // Length of the input shaft (elongated to match the original model)

// Input Shaft
module input_shaft() {
    // Ensure a consistent cylindrical shape
    cylinder(d = input_shaft_diameter, h = input_shaft_length, center = true);
}

// Parameters for the output shaft
output_shaft_diameter = 8; // Diameter of the output shaft
output_shaft_length = 50;  // Length of the output shaft (elongated to match the original model)

// Output Shaft
module output_shaft() {
    // Ensure a consistent cylindrical shape
    cylinder(d = output_shaft_diameter, h = output_shaft_length, center = true);
}

// Parameters for the spacer ring
spacer_ring_thickness = 2; // Thickness of the spacer ring (reduced to match the original model)
spacer_ring_diameter = 20; // Outer diameter of the spacer ring

// Spacer Ring
module spacer_ring() {
    difference() {
        cylinder(d = spacer_ring_diameter, h = spacer_ring_thickness, center = true);
        cylinder(d = spacer_ring_diameter - 4, h = spacer_ring_thickness, center = true);
    }
}

// Parameters for the flange plate
flange_plate_diameter = 30; // Diameter of the flange plate
flange_plate_thickness = 5; // Thickness of the flange plate
bolt_hole_diameter = 2;     // Diameter of the bolt holes
num_bolt_holes = 6;         // Number of bolt holes (increased to match the original model)

// Flange Plate
module flange_plate() {
    difference() {
        cylinder(d = flange_plate_diameter, h = flange_plate_thickness, center = true);
        for (i = [0 : 360/num_bolt_holes : 360-360/num_bolt_holes]) {
            translate([flange_plate_diameter/2 * cos(i), flange_plate_diameter/2 * sin(i), 0])
                cylinder(d = bolt_hole_diameter, h = flange_plate_thickness + 1, center = true);
        }
    }
}

// Parameters for the nut
nut_diameter = 6; // Diameter of the nut (reduced to match the original model)
nut_thickness = 3; // Thickness of the nut

// Nut
module nut() {
    cylinder(d = nut_diameter, h = nut_thickness, center = true);
}

// Parameters for the bolt
bolt_diameter = 2; // Diameter of the bolt (reduced to match the original model)
bolt_length = 40;  // Length of the bolt (elongated to match the original model)

// Bolt
module bolt() {
    cylinder(d = bolt_diameter, h = bolt_length, center = true);
}

// Render the components
central_shaft();
translate([0, 0, shaft_length/2 + input_shaft_length/2]) input_shaft();
translate([0, 0, -shaft_length/2 - output_shaft_length/2]) output_shaft();
translate([0, 0, shaft_length/2 + input_shaft_length + spacer_ring_thickness/2]) spacer_ring();
translate([0, 0, -shaft_length/2 - output_shaft_length - spacer_ring_thickness/2]) spacer_ring();
translate([0, 0, shaft_length/2 + input_shaft_length + spacer_ring_thickness + flange_plate_thickness/2]) flange_plate();
translate([0, 0, -shaft_length/2 - output_shaft_length - spacer_ring_thickness - flange_plate_thickness/2]) flange_plate();
translate([flange_plate_diameter/2, 0, shaft_length/2 + input_shaft_length + spacer_ring_thickness + flange_plate_thickness + nut_thickness/2]) nut();
translate([flange_plate_diameter/2, 0, -shaft_length/2 - output_shaft_length - spacer_ring_thickness - flange_plate_thickness - nut_thickness/2]) nut();
translate([flange_plate_diameter/2, 0, shaft_length/2 + input_shaft_length + spacer_ring_thickness + flange_plate_thickness + nut_thickness + bolt_length/2]) bolt();
translate([flange_plate_diameter/2, 0, -shaft_length/2 - output_shaft_length - spacer_ring_thickness - flange_plate_thickness - nut_thickness - bolt_length/2]) bolt();

