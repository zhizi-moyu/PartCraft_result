
// Parameters
module central_cylinder() {
    difference() {
        cylinder(h=50, r=20, $fn=100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h=52, r=10, $fn=100); // Hollow interior
    }
}

module input_cylinder() {
    difference() {
        cylinder(h=30, r=20, $fn=100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h=32, r=10, $fn=100); // Hollow interior
    }
}

module output_cylinder() {
    difference() {
        cylinder(h=30, r=20, $fn=100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h=32, r=10, $fn=100); // Hollow interior
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=5, r=20, $fn=100); // Outer ring
        translate([0, 0, -1]) cylinder(h=7, r=18, $fn=100); // Hollow interior
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=20, $fn=100); // Outer plate
        translate([0, 0, -1]) cylinder(h=7, r=10, $fn=100); // Hollow interior
        for (i = [0:7]) {
            rotate([0, 0, i * 45]) translate([15, 0, 0]) cylinder(h=5, r=2, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=5, r=3, $fn=6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h=20, r=2, $fn=100); // Threaded shaft
        translate([0, 0, 20]) cylinder(h=5, r=3, $fn=100); // Flat head
    }
}

// Assembly
module flexible_coupling() {
    union() {
        translate([0, 0, 0]) central_cylinder();
        translate([0, 0, 50]) input_cylinder();
        translate([0, 0, -30]) output_cylinder();
        translate([0, 0, 45]) spacer_ring();
        translate([0, 0, -35]) spacer_ring();
        translate([0, 0, 50]) flange_plate();
        translate([0, 0, -30]) flange_plate();
        translate([0, 0, 55]) flange_plate();
        translate([0, 0, -35]) flange_plate();
        for (i = [0:7]) {
            rotate([0, 0, i * 45]) translate([15, 0, 50]) bolt();
            rotate([0, 0, i * 45]) translate([15, 0, -30]) bolt();
            rotate([0, 0, i * 45]) translate([15, 0, 55]) nut();
            rotate([0, 0, i * 45]) translate([15, 0, -35]) nut();
        }
    }
}

// Render the model
flexible_coupling();

