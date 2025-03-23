// Parameters
module input_shaft() {
    cylinder(h = 30, r = 4.5, $fn = 100); // Adjusted length to match original model
}

module output_shaft() {
    cylinder(h = 30, r = 4.5, $fn = 100); // Adjusted length to match original model
}

module central_shaft() {
    cylinder(h = 30, r = 5, $fn = 100); // Smooth solid cylinder, grooves removed
}

module spacer_ring() {
    difference() {
        cylinder(h = 1, r = 5, $fn = 100); // Reduced thickness to match original model
        cylinder(h = 1, r = 3, $fn = 100); // Hollow center
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 2, r = 6, $fn = 100); // Adjusted thickness to match original model
        cylinder(h = 2, r = 3, $fn = 100); // Hollow center
        for (i = [0:60:300]) { // Evenly distributed bolt holes
            translate([4*cos(i), 4*sin(i), 0])
                cylinder(h = 2, r = 0.5, $fn = 100); // Bolt holes
        }
    }
}

module bolt() {
    cylinder(h = 25, r = 0.5, $fn = 100); // Adjusted length to match original model
}

module nut() {
    cylinder(h = 1.5, r = 1, $fn = 6); // Adjusted size to match original model
}

// Assembly
module coupling() {
    translate([0, 0, 0]) input_shaft(); // Layer 1

    translate([0, 0, 30]) flange_plate(); // Layer 2
    for (i = [0:60:300]) {
        translate([4*cos(i), 4*sin(i), 30]) nut();
    }

    translate([0, 0, 32]) spacer_ring(); // Layer 3
    for (i = [0:60:300]) {
        translate([4*cos(i), 4*sin(i), 30]) bolt();
    }

    translate([0, 0, 33]) flange_plate(); // Layer 4
    for (i = [0:60:300]) {
        translate([4*cos(i), 4*sin(i), 33]) nut();
    }

    translate([0, 0, 35]) central_shaft(); // Layer 5

    translate([0, 0, 65]) flange_plate(); // Layer 6
    for (i = [0:60:300]) {
        translate([4*cos(i), 4*sin(i), 65]) nut();
    }

    translate([0, 0, 67]) spacer_ring(); // Layer 7
    for (i = [0:60:300]) {
        translate([4*cos(i), 4*sin(i), 65]) bolt();
    }

    translate([0, 0, 68]) flange_plate(); // Layer 8
    for (i = [0:60:300]) {
        translate([4*cos(i), 4*sin(i), 68]) nut();
    }

    translate([0, 0, 70]) output_shaft(); // Layer 9
}

// Render the coupling
coupling();
