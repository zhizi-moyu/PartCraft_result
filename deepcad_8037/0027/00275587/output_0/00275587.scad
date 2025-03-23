
// Parameters for components
module input_shaft() {
    difference() {
        cylinder(h=20, r=5, $fn=100); // Main shaft
        translate([0, 0, -1]) cylinder(h=22, r=2, $fn=100); // Hollow center
    }
}

module output_shaft() {
    difference() {
        cylinder(h=20, r=5, $fn=100); // Main shaft
        translate([0, 0, -1]) cylinder(h=22, r=2, $fn=100); // Hollow center
    }
}

module central_hub() {
    cylinder(h=10, r=6, $fn=100); // Central hub
}

module spacer_ring() {
    difference() {
        cylinder(h=2, r=6, $fn=100); // Outer ring
        translate([0, 0, -1]) cylinder(h=4, r=4, $fn=100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h=3, r=7, $fn=100); // Main plate
        translate([0, 0, -1]) cylinder(h=5, r=4, $fn=100); // Inner hollow
        for (angle = [0:90:270]) {
            translate([5*cos(angle), 5*sin(angle), 1.5])
                rotate([90, 0, 0]) cylinder(h=3, r=0.5, $fn=50); // Bolt holes
        }
    }
}

module bolt() {
    union() {
        cylinder(h=15, r=0.5, $fn=50); // Bolt shaft
        translate([0, 0, 15]) cylinder(h=2, r=1, $fn=50); // Bolt head
    }
}

module nut() {
    cylinder(h=2, r=1.5, $fn=6); // Hexagonal nut
}

// Assembly
module flexible_coupling() {
    translate([0, 0, 90]) input_shaft(); // Layer 1

    translate([0, 0, 70]) flange_plate(); // Layer 2
    for (angle = [0:90:270]) {
        translate([5*cos(angle), 5*sin(angle), 70]) nut();
    }

    translate([0, 0, 67]) spacer_ring(); // Layer 3
    for (angle = [0:90:270]) {
        translate([5*cos(angle), 5*sin(angle), 67]) bolt();
    }

    translate([0, 0, 64]) flange_plate(); // Layer 4
    for (angle = [0:90:270]) {
        translate([5*cos(angle), 5*sin(angle), 64]) nut();
    }

    translate([0, 0, 60]) central_hub(); // Layer 5

    translate([0, 0, 50]) flange_plate(); // Layer 6
    for (angle = [0:90:270]) {
        translate([5*cos(angle), 5*sin(angle), 50]) nut();
    }

    translate([0, 0, 47]) spacer_ring(); // Layer 7
    for (angle = [0:90:270]) {
        translate([5*cos(angle), 5*sin(angle), 47]) bolt();
    }

    translate([0, 0, 44]) flange_plate(); // Layer 8
    for (angle = [0:90:270]) {
        translate([5*cos(angle), 5*sin(angle), 44]) nut();
    }

    translate([0, 0, 20]) output_shaft(); // Layer 9
}

// Render the flexible coupling
flexible_coupling();

