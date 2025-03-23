
// Parameters for the central shaft
shaft_length = 150; // Elongated length of the shaft to match the original model
shaft_diameter = 15; // Increased diameter to match the original model

// Central Shaft
module central_shaft() {
    cylinder(h = shaft_length, d = shaft_diameter, center = true);
}

// Parameters for the spacer ring
spacer_ring_thickness = 5; // Thickened to match the original model
spacer_ring_diameter = 25; // Increased outer diameter to match the original model

// Spacer Ring
module spacer_ring() {
    difference() {
        cylinder(h = spacer_ring_thickness, d = spacer_ring_diameter, center = true);
        cylinder(h = spacer_ring_thickness + 1, d = spacer_ring_diameter - 5, center = true);
    }
}

// Parameters for the flange plate
flange_plate_thickness = 8; // Increased thickness to match the original model
flange_plate_diameter = 60; // Increased diameter to match the original model
bolt_hole_diameter = 4; // Adjusted diameter of bolt holes
bolt_hole_count = 8; // Increased number of bolt holes to match the original model

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
nut_size = 12; // Resized to be larger to match the original model
nut_thickness = 6; // Increased thickness to match the original model

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
bolt_length = 70; // Lengthened to match the original model
bolt_diameter = 8; // Increased diameter to match the original model
thread_pitch = 1.5; // Adjusted threading to make it more pronounced

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

