
// Parameters for components
module input_shaft() {
    difference() {
        cylinder(h=25, r=5, $fn=100); // Increased length of main shaft
        translate([0, 0, -1]) cylinder(h=27, r=3, $fn=100); // Widened hollow center
        translate([0, 0, 25]) cylinder(h=3, r1=5, r2=2, $fn=100); // More pronounced taper
    }
}

module output_shaft() {
    difference() {
        cylinder(h=30, r=5, $fn=100); // Increased length of main shaft
        translate([0, 0, -1]) cylinder(h=32, r=4, $fn=100); // Widened hollow center
        translate([0, 0, 30]) cylinder(h=3, r1=5, r2=2, $fn=100); // More pronounced taper
    }
}

module central_hub() {
    cylinder(h=10, r=8, $fn=100); // Increased diameter for central hub
}

module spacer_ring() {
    difference() {
        cylinder(h=1, r=6, $fn=100); // Reduced thickness of outer ring
        translate([0, 0, -1]) cylinder(h=3, r=4, $fn=100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h=3, r=8, $fn=100); // Increased diameter for flange plate
        translate([0, 0, -1]) cylinder(h=5, r=4, $fn=100); // Inner hollow
        for (angle = [0:45:315]) { // Increased number of bolt holes
            translate([6*cos(angle), 6*sin(angle), 1.5])
                rotate([90, 0, 0]) cylinder(h=3, r=0.3, $fn=50); // Reduced bolt hole diameter
        }
    }
}

module bolt() {
    union() {
        cylinder(h=20, r=0.5, $fn=50); // Increased bolt shaft length
        translate([0, 0, 20]) cylinder(h=2, r=0.6, $fn=50); // Reduced bolt head size
    }
}

module nut() {
    cylinder(h=2, r=1.2, $fn=6); // Reduced hexagonal nut size
    translate([0, 0, 0.5]) sphere(r=0.2); // Slightly rounded edges
}

// Assembly
module flexible_coupling() {
    translate([0, 0, 95]) input_shaft(); // Layer 1

    translate([0, 0, 70]) flange_plate(); // Layer 2
    for (angle = [0:45:315]) {
        translate([6*cos(angle), 6*sin(angle), 70]) nut();
    }

    translate([0, 0, 67]) spacer_ring(); // Layer 3
    for (angle = [0:45:315]) {
        translate([6*cos(angle), 6*sin(angle), 67]) bolt();
    }

    translate([0, 0, 64]) flange_plate(); // Layer 4
    for (angle = [0:45:315]) {
        translate([6*cos(angle), 6*sin(angle), 64]) nut();
    }

    translate([0, 0, 60]) central_hub(); // Layer 5

    translate([0, 0, 50]) flange_plate(); // Layer 6
    for (angle = [0:45:315]) {
        translate([6*cos(angle), 6*sin(angle), 50]) nut();
    }

    translate([0, 0, 47]) spacer_ring(); // Layer 7
    for (angle = [0:45:315]) {
        translate([6*cos(angle), 6*sin(angle), 47]) bolt();
    }

    translate([0, 0, 44]) flange_plate(); // Layer 8
    for (angle = [0:45:315]) {
        translate([6*cos(angle), 6*sin(angle), 44]) nut();
    }

    translate([0, 0, 20]) output_shaft(); // Layer 9
}

// Render the flexible coupling
flexible_coupling();

