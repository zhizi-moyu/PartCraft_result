
// Parameters
module input_shaft() {
    difference() {
        cylinder(h = 25, r = 4.5, $fn = 100); // Adjusted outer cylinder
        cylinder(h = 25, r = 2.5, $fn = 100); // Adjusted hollow center
    }
}

module output_shaft() {
    difference() {
        cylinder(h = 25, r = 4.5, $fn = 100); // Adjusted outer cylinder
        cylinder(h = 25, r = 2.5, $fn = 100); // Adjusted hollow center
    }
}

module central_shaft() {
    cylinder(h = 30, r = 5, $fn = 100); // Smooth solid cylinder
}

module spacer_ring() {
    difference() {
        cylinder(h = 1.5, r = 5, $fn = 100); // Adjusted outer ring thickness
        cylinder(h = 1.5, r = 3, $fn = 100); // Hollow center
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 3, r = 6, $fn = 100); // Outer plate
        cylinder(h = 3, r = 3, $fn = 100); // Hollow center
        for (i = [0:60:300]) { // Adjusted bolt hole distribution
            translate([4*cos(i), 4*sin(i), 0])
                cylinder(h = 3, r = 0.5, $fn = 100); // Bolt holes
        }
    }
}

module bolt() {
    cylinder(h = 30, r = 0.5, $fn = 100); // Adjusted bolt length
}

module nut() {
    cylinder(h = 2, r = 1, $fn = 6); // Hexagonal nut with adjusted size
}

// Assembly
module coupling() {
    translate([0, 0, 0]) input_shaft(); // Layer 1

    translate([0, 0, 25]) flange_plate(); // Layer 2
    for (i = [0:60:300]) {
        translate([4*cos(i), 4*sin(i), 25]) nut();
    }

    translate([0, 0, 28]) spacer_ring(); // Layer 3
    for (i = [0:60:300]) {
        translate([4*cos(i), 4*sin(i), 25]) bolt();
    }

    translate([0, 0, 30]) flange_plate(); // Layer 4
    for (i = [0:60:300]) {
        translate([4*cos(i), 4*sin(i), 30]) nut();
    }

    translate([0, 0, 33]) central_shaft(); // Layer 5

    translate([0, 0, 63]) flange_plate(); // Layer 6
    for (i = [0:60:300]) {
        translate([4*cos(i), 4*sin(i), 63]) nut();
    }

    translate([0, 0, 66]) spacer_ring(); // Layer 7
    for (i = [0:60:300]) {
        translate([4*cos(i), 4*sin(i), 63]) bolt();
    }

    translate([0, 0, 68]) flange_plate(); // Layer 8
    for (i = [0:60:300]) {
        translate([4*cos(i), 4*sin(i), 68]) nut();
    }

    translate([0, 0, 71]) output_shaft(); // Layer 9
}

// Render the coupling
coupling();

