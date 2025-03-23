
// Parameters
module input_shaft() {
    difference() {
        cylinder(h = 20, r = 5, $fn = 100); // Outer cylinder
        cylinder(h = 20, r = 2, $fn = 100); // Hollow center
    }
}

module output_shaft() {
    difference() {
        cylinder(h = 20, r = 5, $fn = 100); // Outer cylinder
        cylinder(h = 20, r = 2, $fn = 100); // Hollow center
    }
}

module central_shaft() {
    cylinder(h = 30, r = 5, $fn = 100); // Solid cylinder
}

module spacer_ring() {
    difference() {
        cylinder(h = 2, r = 5, $fn = 100); // Outer ring
        cylinder(h = 2, r = 3, $fn = 100); // Hollow center
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 3, r = 6, $fn = 100); // Outer plate
        cylinder(h = 3, r = 3, $fn = 100); // Hollow center
        for (i = [0:90:270]) {
            translate([4*cos(i), 4*sin(i), 0])
                cylinder(h = 3, r = 0.5, $fn = 100); // Bolt holes
        }
    }
}

module bolt() {
    cylinder(h = 25, r = 0.5, $fn = 100); // Slender bolt
}

module nut() {
    cylinder(h = 2, r = 1, $fn = 6); // Hexagonal nut
}

// Assembly
module coupling() {
    translate([0, 0, 0]) input_shaft(); // Layer 1

    translate([0, 0, 20]) flange_plate(); // Layer 2
    for (i = [0:90:270]) {
        translate([4*cos(i), 4*sin(i), 20]) nut();
    }

    translate([0, 0, 23]) spacer_ring(); // Layer 3
    for (i = [0:90:270]) {
        translate([4*cos(i), 4*sin(i), 20]) bolt();
    }

    translate([0, 0, 25]) flange_plate(); // Layer 4
    for (i = [0:90:270]) {
        translate([4*cos(i), 4*sin(i), 25]) nut();
    }

    translate([0, 0, 28]) central_shaft(); // Layer 5

    translate([0, 0, 58]) flange_plate(); // Layer 6
    for (i = [0:90:270]) {
        translate([4*cos(i), 4*sin(i), 58]) nut();
    }

    translate([0, 0, 61]) spacer_ring(); // Layer 7
    for (i = [0:90:270]) {
        translate([4*cos(i), 4*sin(i), 58]) bolt();
    }

    translate([0, 0, 63]) flange_plate(); // Layer 8
    for (i = [0:90:270]) {
        translate([4*cos(i), 4*sin(i), 63]) nut();
    }

    translate([0, 0, 66]) output_shaft(); // Layer 9
}

// Render the coupling
coupling();

