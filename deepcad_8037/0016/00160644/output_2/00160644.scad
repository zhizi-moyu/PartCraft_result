// Parameters for components
module central_cylinder() {
    // Smooth and uniform central cylinder
    cylinder(h = 20, d = 40, $fn = 100); // Height: 20mm, Diameter: 40mm
}

module input_cylinder() {
    // Simplified input cylinder with smooth outer surface
    difference() {
        cylinder(h = 20, d = 40, $fn = 100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h = 22, d = 20, $fn = 100); // Inner bore
    }
}

module output_cylinder() {
    // Simplified output cylinder with smooth outer surface
    difference() {
        cylinder(h = 20, d = 40, $fn = 100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h = 22, d = 20, $fn = 100); // Inner bore
    }
}

module spacer_ring() {
    // Reduced thickness and simplified spacer ring
    difference() {
        cylinder(h = 2, d = 40, $fn = 100); // Outer ring with reduced thickness
        translate([0, 0, -1]) cylinder(h = 3, d = 30, $fn = 100); // Inner hole
    }
}

module flange_plate() {
    // Simplified flange plate with evenly distributed bolt holes
    difference() {
        cylinder(h = 5, d = 50, $fn = 100); // Outer plate
        translate([0, 0, -1]) cylinder(h = 6, d = 40, $fn = 100); // Inner hole
        for (i = [0:7]) {
            rotate([0, 0, i * 45]) translate([20, 0, 0]) cylinder(h = 6, d = 5, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    // Standard hexagonal nut
    cylinder(h = 5, d = 10, $fn = 6); // Hexagonal nut
}

module bolt() {
    // Simplified bolt with flat head
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
        translate([0, 0, 22]) flange_plate();
        translate([0, 0, 27]) input_cylinder();
        translate([0, 0, -2]) spacer_ring();
        translate([0, 0, -7]) flange_plate();
        translate([0, 0, -12]) output_cylinder();
        for (i = [0:7]) {
            rotate([0, 0, i * 45]) translate([20, 0, 22]) bolt();
            rotate([0, 0, i * 45]) translate([20, 0, 27]) nut();
            rotate([0, 0, i * 45]) translate([20, 0, -7]) bolt();
            rotate([0, 0, i * 45]) translate([20, 0, -12]) nut();
        }
    }
}

// Render the model
flexible_coupling();
