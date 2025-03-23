
// Parameters for components
module input_shaft() {
    difference() {
        cylinder(h=20, r=5, $fn=100); // Main shaft
        translate([0, 0, -1]) cylinder(h=22, r=3, $fn=100); // Widened hollow center
        translate([0, 0, 20]) cylinder(h=2, r1=5, r2=4, $fn=100); // Reduced taper
    }
}

module output_shaft() {
    difference() {
        cylinder(h=25, r=5, $fn=100); // Extended main shaft
        translate([0, 0, -1]) cylinder(h=27, r=3, $fn=100); // Widened hollow center
        translate([0, 0, 25]) cylinder(h=2, r1=5, r2=4, $fn=100); // Reduced taper
    }
}

module central_hub() {
    cylinder(h=10, r=7, $fn=100); // Increased diameter for central hub
}

module spacer_ring() {
    difference() {
        cylinder(h=1.5, r=6, $fn=100); // Reduced thickness of outer ring
        translate([0, 0, -1]) cylinder(h=3.5, r=4, $fn=100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h=3, r=7, $fn=100); // Main plate
        translate([0, 0, -1]) cylinder(h=5, r=4, $fn=100); // Inner hollow
        for (angle = [0:60:300]) { // Increased number of bolt holes
            translate([5*cos(angle), 5*sin(angle), 1.5])
                rotate([90, 0, 0]) cylinder(h=3, r=0.4, $fn=50); // Reduced bolt hole diameter
        }
    }
}

module bolt() {
    union() {
        cylinder(h=18, r=0.5, $fn=50); // Increased bolt shaft length
        translate([0, 0, 18]) cylinder(h=2, r=0.8, $fn=50); // Reduced bolt head size
    }
}

module nut() {
    cylinder(h=2, r=1.5, $fn=6); // Hexagonal nut
    translate([0, 0, 0.5]) sphere(r=0.2); // Slightly rounded edges
}

// Assembly
module flexible_coupling() {
    translate([0, 0, 90]) input_shaft(); // Layer 1

    translate([0, 0, 70]) flange_plate(); // Layer 2
    for (angle = [0:60:300]) {
        translate([5*cos(angle), 5*sin(angle), 70]) nut();
    }

    translate([0, 0, 67]) spacer_ring(); // Layer 3
    for (angle = [0:60:300]) {
        translate([5*cos(angle), 5*sin(angle), 67]) bolt();
    }

    translate([0, 0, 64]) flange_plate(); // Layer 4
    for (angle = [0:60:300]) {
        translate([5*cos(angle), 5*sin(angle), 64]) nut();
    }

    translate([0, 0, 60]) central_hub(); // Layer 5

    translate([0, 0, 50]) flange_plate(); // Layer 6
    for (angle = [0:60:300]) {
        translate([5*cos(angle), 5*sin(angle), 50]) nut();
    }

    translate([0, 0, 47]) spacer_ring(); // Layer 7
    for (angle = [0:60:300]) {
        translate([5*cos(angle), 5*sin(angle), 47]) bolt();
    }

    translate([0, 0, 44]) flange_plate(); // Layer 8
    for (angle = [0:60:300]) {
        translate([5*cos(angle), 5*sin(angle), 44]) nut();
    }

    translate([0, 0, 20]) output_shaft(); // Layer 9
}

// Render the flexible coupling
flexible_coupling();

