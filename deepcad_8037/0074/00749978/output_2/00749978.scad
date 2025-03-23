
// Parameters for the central shaft
shaft_diameter = 20; // Diameter of the central shaft
shaft_length = 60;   // Length of the central shaft

// Central Shaft
module central_shaft() {
    // Ensure a uniform cylindrical shape
    cylinder(d=shaft_diameter, h=shaft_length, center=true);
}

// Parameters for the input shaft
input_shaft_diameter = 15; // Diameter of the input shaft
input_shaft_length = 55;   // Length of the input shaft (increased to match original)
input_shaft_hole_diameter = 10; // Diameter of the hollow center (widened to match original)

// Input Shaft
module input_shaft() {
    // Adjusted length and hollow center
    difference() {
        cylinder(d=input_shaft_diameter, h=input_shaft_length, center=true);
        translate([0, 0, -input_shaft_length/2])
            cylinder(d=input_shaft_hole_diameter, h=input_shaft_length, center=false);
    }
}

// Parameters for the output shaft
output_shaft_diameter = 18; // Diameter of the output shaft
output_shaft_length = 60;   // Length of the output shaft (increased to match original)
output_shaft_hole_diameter = 12; // Diameter of the hollow center (widened to match original)

// Output Shaft
module output_shaft() {
    // Adjusted length and hollow center
    difference() {
        cylinder(d=output_shaft_diameter, h=output_shaft_length, center=true);
        translate([0, 0, -output_shaft_length/2])
            cylinder(d=output_shaft_hole_diameter, h=output_shaft_length, center=false);
    }
}

// Parameters for the spacer ring
spacer_ring_outer_diameter = 25; // Outer diameter of the spacer ring
spacer_ring_inner_diameter = 20; // Inner diameter of the spacer ring
spacer_ring_thickness = 3;       // Thickness of the spacer ring (reduced to match original)

// Spacer Ring
module spacer_ring() {
    // Adjusted thickness
    difference() {
        cylinder(d=spacer_ring_outer_diameter, h=spacer_ring_thickness, center=true);
        cylinder(d=spacer_ring_inner_diameter, h=spacer_ring_thickness + 1, center=true);
    }
}

// Parameters for the flange plate
flange_plate_outer_diameter = 45; // Outer diameter of the flange plate (increased to match original)
flange_plate_inner_diameter = 20; // Inner diameter of the flange plate
flange_plate_thickness = 5;       // Thickness of the flange plate
bolt_hole_diameter = 5;           // Diameter of the bolt holes
bolt_hole_count = 8;              // Number of bolt holes (increased to match original)

// Flange Plate
module flange_plate() {
    // Adjusted outer diameter and number of bolt holes
    difference() {
        cylinder(d=flange_plate_outer_diameter, h=flange_plate_thickness, center=true);
        cylinder(d=flange_plate_inner_diameter, h=flange_plate_thickness + 1, center=true);
        for (i = [0:360/bolt_hole_count:360-360/bolt_hole_count]) {
            rotate([0, 0, i])
                translate([flange_plate_outer_diameter/2 - 5, 0, 0])
                    cylinder(d=bolt_hole_diameter, h=flange_plate_thickness + 1, center=true);
        }
    }
}

// Parameters for the nut
nut_diameter = 8; // Diameter of the nut (reduced to match original)
nut_thickness = 5; // Thickness of the nut

// Nut
module nut() {
    // Adjusted hexagonal profile
    rotate([0, 0, 30])
        linear_extrude(height=nut_thickness)
            polygon(points=[[0, nut_diameter/2], [nut_diameter/2 * cos(PI/3), nut_diameter/2 * sin(PI/3)], 
                            [nut_diameter/2 * cos(2*PI/3), nut_diameter/2 * sin(2*PI/3)], 
                            [0, -nut_diameter/2], 
                            [-nut_diameter/2 * cos(PI/3), -nut_diameter/2 * sin(PI/3)], 
                            [-nut_diameter/2 * cos(2*PI/3), -nut_diameter/2 * sin(2*PI/3)]]);
}

// Parameters for the bolt
bolt_diameter = 8; // Diameter of the bolt
bolt_length = 50;  // Length of the bolt (increased to match original)
bolt_thread_diameter = 6; // Diameter of the threaded part

// Bolt
module bolt() {
    // Adjusted shank length
    union() {
        cylinder(d=bolt_diameter, h=bolt_length - 10, center=false);
        translate([0, 0, bolt_length - 10])
            cylinder(d=bolt_thread_diameter, h=10, center=false);
    }
}

// Render the components
translate([0, 0, 0]) {
    central_shaft();
    translate([0, 0, shaft_length/2 + input_shaft_length/2]) input_shaft();
    translate([0, 0, -shaft_length/2 - output_shaft_length/2]) output_shaft();
    translate([0, 0, shaft_length/2 + input_shaft_length + spacer_ring_thickness/2]) spacer_ring();
    translate([0, 0, -shaft_length/2 - output_shaft_length - spacer_ring_thickness/2]) spacer_ring();
    translate([0, 0, shaft_length/2 + input_shaft_length + spacer_ring_thickness + flange_plate_thickness/2]) flange_plate();
    translate([0, 0, -shaft_length/2 - output_shaft_length - spacer_ring_thickness - flange_plate_thickness/2]) flange_plate();
    translate([0, 0, shaft_length/2 + input_shaft_length + spacer_ring_thickness + flange_plate_thickness + nut_thickness/2]) nut();
    translate([0, 0, -shaft_length/2 - output_shaft_length - spacer_ring_thickness - flange_plate_thickness - nut_thickness/2]) nut();
    translate([0, 0, shaft_length/2 + input_shaft_length + spacer_ring_thickness + flange_plate_thickness + nut_thickness + bolt_length/2]) bolt();
    translate([0, 0, -shaft_length/2 - output_shaft_length - spacer_ring_thickness - flange_plate_thickness - nut_thickness - bolt_length/2]) bolt();
}

