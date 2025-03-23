
// Parameters for components
module central_cylinder() {
    cylinder(h = 20, d = 40, $fn = 100); // Height: 20mm, Diameter: 40mm
}

module input_cylinder() {
    difference() {
        cylinder(h = 20, d = 40, $fn = 100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h = 22, d = 20, $fn = 100); // Inner bore
    }
}

module output_cylinder() {
    difference() {
        cylinder(h = 20, d = 40, $fn = 100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h = 22, d = 20, $fn = 100); // Inner bore
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 5, d = 40, $fn = 100); // Outer ring
        translate([0, 0, -1]) cylinder(h = 6, d = 30, $fn = 100); // Inner hole
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 5, d = 50, $fn = 100); // Outer plate
        translate([0, 0, -1]) cylinder(h = 6, d = 40, $fn = 100); // Inner hole
        for (i = [0:7]) {
            rotate([0, 0, i * 45]) translate([20, 0, 0]) cylinder(h = 6, d = 5, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 5, d = 10, $fn = 6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h = 20, d = 5, $fn = 100); // Threaded shaft
        translate([0, 0, 20]) cylinder(h = 2, d = 8, $fn = 100); // Flat head
    }
}

// Assembly
module flexible_coupling() {
    union() {
        translate([0, 0, 0]) central_cylinder();
        translate([0, 0, 20]) spacer_ring();
        translate([0, 0, 25]) flange_plate();
        translate([0, 0, 30]) input_cylinder();
        translate([0, 0, -5]) spacer_ring();
        translate([0, 0, -10]) flange_plate();
        translate([0, 0, -15]) output_cylinder();
        for (i = [0:7]) {
            rotate([0, 0, i * 45]) translate([20, 0, 25]) bolt();
            rotate([0, 0, i * 45]) translate([20, 0, 30]) nut();
            rotate([0, 0, i * 45]) translate([20, 0, -10]) bolt();
            rotate([0, 0, i * 45]) translate([20, 0, -15]) nut();
        }
    }
}

// Render the model
flexible_coupling();

