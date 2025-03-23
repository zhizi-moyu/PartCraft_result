
central_shaft_diameter = 20;
central_shaft_length = 68;
$fn = 200;

module central_shaft() {
    cylinder(h = central_shaft_length, d = central_shaft_diameter, center = true);
}

translate([0, 0, 0]) {
    central_shaft();
}

input_shaft_diameter = 16;
input_shaft_length = 50;
input_hollow_diameter = 10;
$fn = 200;

module input_shaft() {
    difference() {
        cylinder(h = input_shaft_length, d = input_shaft_diameter, center = true);
        cylinder(h = input_shaft_length + 1, d = input_hollow_diameter, center = true);
    }
}

translate([0, 0, -30]) {
    input_shaft();
}

output_shaft_diameter = 15;
output_shaft_length = 48;
output_hollow_diameter = 10;
$fn = 200;

module output_shaft() {
    difference() {
        cylinder(h = output_shaft_length, d = output_shaft_diameter, center = true);
        cylinder(h = output_shaft_length + 1, d = output_hollow_diameter, center = true);
    }
}

translate([0, 0, 30]) {
    output_shaft();
}

spacer_ring_outer_diameter = 25;
spacer_ring_inner_diameter = 20;
spacer_ring_thickness = 1.5;
$fn = 200;

module spacer_ring() {
    difference() {
        cylinder(h = spacer_ring_thickness, d = spacer_ring_outer_diameter, center = true);
        cylinder(h = spacer_ring_thickness + 1, d = spacer_ring_inner_diameter, center = true);
    }
}

translate([0, 0, 0]) {
    spacer_ring();
}

flange_plate_diameter = 40;
flange_plate_thickness = 2.5;
bolt_hole_diameter = 5;
bolt_hole_count = 8;
$fn = 200;

module flange_plate() {
    difference() {
        cylinder(h = flange_plate_thickness, d = flange_plate_diameter, center = true);
        for (i = [0:360/bolt_hole_count:360-360/bolt_hole_count]) {
            rotate([0, 0, i]) {
                translate([flange_plate_diameter/2 - 6, 0, 0]) {
                    cylinder(h = flange_plate_thickness + 1, d = bolt_hole_diameter, center = true);
                }
            }
        }
    }
}

translate([0, 0, -35]) {
    flange_plate();
}

nut_diameter = 9.5;
nut_thickness = 5;
$fn = 6;

module nut() {
    cylinder(h = nut_thickness, d = nut_diameter, center = true);
}

translate([0, 0, 40]) {
    nut();
}

bolt_diameter = 8;
bolt_length = 25;
bolt_head_diameter = 12;
bolt_head_thickness = 4;
$fn = 6;

module bolt() {
    union() {
        cylinder(h = bolt_length, d = bolt_diameter, center = true);
        translate([0, 0, bolt_length/2 + bolt_head_thickness/2]) {
            cylinder(h = bolt_head_thickness, d = bolt_head_diameter, center = true);
        }
    }
}

translate([0, 0, 45]) {
    bolt();
}

