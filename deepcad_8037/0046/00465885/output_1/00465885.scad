
// Parameters for the components
module central_shaft() {
    cylinder(h = 60, r = 5, $fn = 100); // Central shaft: height adjusted to 60, radius 5
}

module input_shaft() {
    difference() {
        cylinder(h = 30, r = 6, $fn = 100); // Input shaft: height 30, radius adjusted to 6
        translate([0, 0, -1]) cylinder(h = 32, r = 2, $fn = 100); // Hollow center
    }
}

module output_shaft() {
    difference() {
        cylinder(h = 30, r = 5, $fn = 100); // Output shaft: height 30, radius 5
        translate([0, 0, -1]) cylinder(h = 32, r = 2, $fn = 100); // Hollow center
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 1, r = 6, $fn = 100); // Spacer ring: height adjusted to 1, outer radius 6
        cylinder(h = 2, r = 4, $fn = 100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 3, r = 10, $fn = 100); // Flange plate: height 3, outer radius 10
        cylinder(h = 4, r = 6, $fn = 100); // Inner hollow
        for (i = [0:30:330]) { // Adjusted bolt hole distribution
            rotate([0, 0, i]) translate([8, 0, -1]) cylinder(h = 5, r = 1, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 2, r = 1.5, $fn = 6); // Nut: height adjusted to 2, radius adjusted to 1.5 (hexagonal)
}

module bolt() {
    union() {
        cylinder(h = 25, r = 1, $fn = 100); // Bolt shaft: height adjusted to 25, radius 1
        translate([0, 0, 25]) cylinder(h = 2, r = 1.5, $fn = 100); // Bolt head
    }
}

module angular_plate() {
    // Angular plate: trapezoidal shape adjusted
    linear_extrude(height = 2) {
        polygon(points = [[0, 0], [12, 0], [9, 6], [3, 6]]);
    }
}

// Assembly
module coupling_assembly() {
    // Central shaft
    central_shaft();

    // Input shaft
    translate([0, 0, -30]) input_shaft();

    // Output shaft
    translate([0, 0, 60]) output_shaft(); // Adjusted position to align with original model

    // Spacer rings
    translate([0, 0, 0]) spacer_ring();
    translate([0, 0, 59]) spacer_ring(); // Adjusted position to align with original model

    // Flange plates
    translate([0, 0, -3]) flange_plate();
    translate([0, 0, 3]) flange_plate();
    translate([0, 0, 58]) flange_plate(); // Adjusted position to align with original model
    translate([0, 0, 63]) flange_plate(); // Adjusted position to align with original model

    // Bolts and nuts
    for (i = [0:30:330]) { // Adjusted bolt distribution
        rotate([0, 0, i]) {
            translate([8, 0, -3]) bolt();
            translate([8, 0, 63]) bolt(); // Adjusted position to align with original model
            translate([8, 0, -6]) nut();
            translate([8, 0, 66]) nut(); // Adjusted position to align with original model
        }
    }

    // Angular plates
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([5, 0, 25]) angular_plate();
    }
}

// Render the coupling assembly
coupling_assembly();

