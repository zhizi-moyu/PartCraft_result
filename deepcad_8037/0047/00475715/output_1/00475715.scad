
// Parameters
shaft_diameter = 20;
shaft_length = 45; // Reduced length to match original model
flange_diameter = 60;
flange_thickness = 5;
spacer_ring_diameter = 60;
spacer_ring_thickness = 1.5; // Reduced thickness to match original model
bolt_diameter = 5;
bolt_length = 35; // Increased length to match original model
nut_diameter = 7; // Reduced size to match original model
nut_thickness = 3.5; // Reduced thickness to match original model
bolt_hole_radius = 3;
bolt_hole_positions = [
    [20, 20],
    [-20, 20],
    [-20, -20],
    [20, -20],
    [0, 30], // Added additional bolt holes to match original model
    [0, -30] // Added additional bolt holes to match original model
];

// Components
module central_shaft() {
    cylinder(h = shaft_length, d = shaft_diameter, $fn = 100);
}

module input_shaft() {
    difference() {
        cylinder(h = shaft_length, d = shaft_diameter + 8, $fn = 100); // Reduced diameter to match original model
        translate([0, 0, -1]) cylinder(h = shaft_length + 2, d = shaft_diameter, $fn = 100);
    }
}

module output_shaft() {
    difference() {
        cylinder(h = shaft_length, d = shaft_diameter + 8, $fn = 100); // Reduced diameter to match original model
        translate([0, 0, -1]) cylinder(h = shaft_length + 2, d = shaft_diameter, $fn = 100);
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = spacer_ring_thickness, d = spacer_ring_diameter, $fn = 100);
        cylinder(h = spacer_ring_thickness + 1, d = spacer_ring_diameter - 10, $fn = 100);
    }
}

module flange_plate() {
    difference() {
        cylinder(h = flange_thickness, d = flange_diameter, $fn = 100);
        cylinder(h = flange_thickness + 1, d = flange_diameter - 10, $fn = 100);
        for (pos = bolt_hole_positions) {
            translate([pos[0], pos[1], -1]) cylinder(h = flange_thickness + 2, r = bolt_hole_radius, $fn = 100);
        }
    }
}

module bolt() {
    cylinder(h = bolt_length, d = bolt_diameter, $fn = 100);
}

module nut() {
    cylinder(h = nut_thickness, d = nut_diameter, $fn = 6);
}

// Assembly
translate([0, 0, 0]) input_shaft();
translate([0, 0, shaft_length]) flange_plate();
translate([0, 0, shaft_length + flange_thickness]) spacer_ring();
translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness]) central_shaft();
translate([0, 0, shaft_length * 2 + flange_thickness + spacer_ring_thickness]) spacer_ring();
translate([0, 0, shaft_length * 2 + flange_thickness * 2 + spacer_ring_thickness * 2]) flange_plate();
translate([0, 0, shaft_length * 2 + flange_thickness * 2 + spacer_ring_thickness * 2 + flange_thickness]) output_shaft();

// Bolts and Nuts
for (pos = bolt_hole_positions) {
    translate([pos[0], pos[1], shaft_length + flange_thickness]) bolt();
    translate([pos[0], pos[1], shaft_length + flange_thickness + bolt_length]) nut();
    translate([pos[0], pos[1], shaft_length * 2 + flange_thickness * 2 + spacer_ring_thickness * 2]) bolt();
    translate([pos[0], pos[1], shaft_length * 2 + flange_thickness * 2 + spacer_ring_thickness * 2 + bolt_length]) nut();
}

