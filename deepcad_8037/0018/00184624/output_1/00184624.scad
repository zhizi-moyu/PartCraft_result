
// Parameters for the central shaft
shaft_length = 120; // Adjusted length of the shaft to match the original model
shaft_diameter = 10; // Diameter remains the same

// Central Shaft
module central_shaft() {
    cylinder(h = shaft_length, d = shaft_diameter, center = true);
}

// Parameters for the spacer ring
spacer_ring_thickness = 2; // Adjusted thickness to make it thinner
spacer_ring_diameter = 20; // Diameter remains the same

// Spacer Ring
module spacer_ring() {
    difference() {
        cylinder(h = spacer_ring_thickness, d = spacer_ring_diameter, center = true);
        cylinder(h = spacer_ring_thickness + 1, d = spacer_ring_diameter - 5, center = true);
    }
}

// Parameters for the flange plate
flange_plate_thickness = 5; // Adjusted thickness to make it thinner
flange_plate_diameter = 50; // Diameter remains the same
bolt_hole_diameter = 3; // Diameter of bolt holes
bolt_hole_count = 6; // Increased number of bolt holes

// Flange Plate
module flange_plate() {
    difference() {
        cylinder(h = flange_plate_thickness, d = flange_plate_diameter, center = true);
        for (i = [0 : 360 / bolt_hole_count : 360 - 360 / bolt_hole_count]) {
            rotate([0, 0, i]) {
                translate([flange_plate_diameter / 2 - 5, 0, 0]) {
                    cylinder(h = flange_plate_thickness + 1, d = bolt_hole_diameter, center = true);
                }
            }
        }
    }
}

// Parameters for the nut
nut_size = 8; // Adjusted size to make it smaller
nut_thickness = 4; // Thickness remains the same

// Nut
module nut() {
    difference() {
        cylinder(h = nut_thickness, d = nut_size, center = true);
        rotate([0, 0, 30]) {
            for (i = [0 : 60 : 300]) {
                rotate([0, 0, i]) {
                    translate([nut_size / 2, 0, 0]) {
                        square([nut_size / 2, nut_size / 2], center = true);
                    }
                }
            }
        }
    }
}

// Parameters for the bolt
bolt_length = 50; // Adjusted length to make it longer
bolt_diameter = 5; // Diameter remains the same
thread_pitch = 1; // Adjusted threading to make it more pronounced

// Bolt
module bolt() {
    union() {
        cylinder(h = bolt_length, d = bolt_diameter, center = true);
        for (z = [0 : thread_pitch : bolt_length - thread_pitch]) {
            translate([0, 0, z]) {
                cylinder(h = thread_pitch, d = bolt_diameter + 1, center = true);
            }
        }
    }
}

// Render the components
translate([0, 0, 0]) {
    central_shaft();
    translate([0, 0, shaft_length / 2 + spacer_ring_thickness / 2]) {
        spacer_ring();
    }
    translate([0, 0, shaft_length / 2 + spacer_ring_thickness + flange_plate_thickness / 2]) {
        flange_plate();
    }
    translate([0, 0, shaft_length / 2 + spacer_ring_thickness + flange_plate_thickness + nut_thickness / 2]) {
        nut();
    }
    translate([0, 0, shaft_length / 2 + spacer_ring_thickness + flange_plate_thickness + nut_thickness + bolt_length / 2]) {
        bolt();
    }
}

