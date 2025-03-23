
// Parameters for the components
module central_shaft() {
    cylinder(h = 50, r = 5, $fn = 100); // Central shaft: height 50, radius 5
}

module input_shaft() {
    difference() {
        cylinder(h = 30, r = 5, $fn = 100); // Input shaft: height 30, radius 5
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
        cylinder(h = 2, r = 6, $fn = 100); // Spacer ring: height 2, outer radius 6
        cylinder(h = 3, r = 4, $fn = 100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 3, r = 10, $fn = 100); // Flange plate: height 3, outer radius 10
        cylinder(h = 4, r = 6, $fn = 100); // Inner hollow
        for (i = [0:45:315]) {
            rotate([0, 0, i]) translate([8, 0, -1]) cylinder(h = 5, r = 1, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 3, r = 2, $fn = 6); // Nut: height 3, radius 2 (hexagonal)
}

module bolt() {
    union() {
        cylinder(h = 20, r = 1, $fn = 100); // Bolt shaft: height 20, radius 1
        translate([0, 0, 20]) cylinder(h = 2, r = 1.5, $fn = 100); // Bolt head
    }
}

module angular_plate() {
    // Angular plate: trapezoidal shape
    linear_extrude(height = 2) {
        polygon(points = [[0, 0], [10, 0], [8, 5], [2, 5]]);
    }
}

// Assembly
module coupling_assembly() {
    // Central shaft
    central_shaft();

    // Input shaft
    translate([0, 0, -30]) input_shaft();

    // Output shaft
    translate([0, 0, 50]) output_shaft();

    // Spacer rings
    translate([0, 0, 0]) spacer_ring();
    translate([0, 0, 48]) spacer_ring();

    // Flange plates
    translate([0, 0, -3]) flange_plate();
    translate([0, 0, 3]) flange_plate();
    translate([0, 0, 47]) flange_plate();
    translate([0, 0, 53]) flange_plate();

    // Bolts and nuts
    for (i = [0:45:315]) {
        rotate([0, 0, i]) {
            translate([8, 0, -3]) bolt();
            translate([8, 0, 53]) bolt();
            translate([8, 0, -6]) nut();
            translate([8, 0, 56]) nut();
        }
    }

    // Angular plates
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([5, 0, 25]) angular_plate();
    }
}

// Render the coupling assembly
coupling_assembly();

