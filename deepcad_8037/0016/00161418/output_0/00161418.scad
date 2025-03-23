
// Define parameters for components
module central_cylinder() {
    difference() {
        cylinder(h=40, r=10, $fn=100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h=42, r=8, $fn=100); // Hollow interior
    }
}

module input_cylinder() {
    difference() {
        cylinder(h=20, r=10, $fn=100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h=22, r=8, $fn=100); // Hollow interior
    }
}

module output_cylinder() {
    difference() {
        cylinder(h=20, r=10, $fn=100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h=22, r=8, $fn=100); // Hollow interior
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=2, r=10, $fn=100); // Outer ring
        cylinder(h=3, r=8, $fn=100); // Hollow interior
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=10, $fn=100); // Outer plate
        cylinder(h=6, r=8, $fn=100); // Hollow interior
        for (i = [0:3]) {
            rotate([0, 0, i * 90]) translate([7, 0, 0]) cylinder(h=6, r=1, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=3, r=2, $fn=6); // Hexagonal nut
}

module bolt() {
    cylinder(h=20, r=1, $fn=100); // Bolt
}

// Assemble the flexible coupling
module flexible_coupling() {
    translate([0, 0, 0]) input_cylinder(); // Layer 1

    translate([0, 0, -20]) flange_plate(); // Layer 2
    for (i = [0:3]) {
        rotate([0, 0, i * 90]) translate([7, 0, -20]) nut();
    }

    translate([0, 0, -25]) spacer_ring(); // Layer 3
    for (i = [0:3]) {
        rotate([0, 0, i * 90]) translate([7, 0, -25]) bolt();
    }

    translate([0, 0, -27]) flange_plate(); // Layer 4
    for (i = [0:3]) {
        rotate([0, 0, i * 90]) translate([7, 0, -27]) nut();
    }

    translate([0, 0, -32]) central_cylinder(); // Layer 5

    translate([0, 0, -72]) flange_plate(); // Layer 6
    for (i = [0:3]) {
        rotate([0, 0, i * 90]) translate([7, 0, -72]) nut();
    }

    translate([0, 0, -77]) spacer_ring(); // Layer 7
    for (i = [0:3]) {
        rotate([0, 0, i * 90]) translate([7, 0, -77]) bolt();
    }

    translate([0, 0, -79]) flange_plate(); // Layer 8
    for (i = [0:3]) {
        rotate([0, 0, i * 90]) translate([7, 0, -79]) nut();
    }

    translate([0, 0, -84]) output_cylinder(); // Layer 9
}

// Render the model
flexible_coupling();

