
// Parameters for the components
module central_craft() {
    cylinder(h = 20, r = 10, $fn = 100); // Central cylindrical component
}

module input_craft() {
    difference() {
        cylinder(h = 15, r = 10, $fn = 100); // Input craft cylinder
        translate([0, 0, -1]) cylinder(h = 17, r = 5, $fn = 100); // Hollow center
    }
}

module output_craft() {
    difference() {
        cylinder(h = 15, r = 10, $fn = 100); // Output craft cylinder
        translate([0, 0, -1]) cylinder(h = 17, r = 5, $fn = 100); // Hollow center
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 2, r = 10, $fn = 100); // Spacer ring
        cylinder(h = 3, r = 8, $fn = 100); // Hollow center
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 5, r = 10, $fn = 100); // Flange plate
        cylinder(h = 6, r = 8, $fn = 100); // Hollow center
        for (i = [0:7]) {
            rotate([0, 0, i * 45]) translate([7, 0, -1]) cylinder(h = 7, r = 1, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 3, r = 2, $fn = 6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h = 15, r = 1, $fn = 100); // Bolt shaft
        translate([0, 0, 15]) cylinder(h = 2, r = 1.5, $fn = 100); // Bolt head
    }
}

// Assembly
module assembly() {
    central_craft();

    translate([0, 0, 20]) input_craft();
    translate([0, 0, -15]) output_craft();

    translate([0, 0, 5]) spacer_ring();
    translate([0, 0, -5]) spacer_ring();

    translate([0, 0, 10]) flange_plate();
    translate([0, 0, -10]) flange_plate();
    translate([0, 0, 15]) flange_plate();
    translate([0, 0, -15]) flange_plate();

    for (i = [0:7]) {
        rotate([0, 0, i * 45]) translate([7, 0, 10]) bolt();
        rotate([0, 0, i * 45]) translate([7, 0, -10]) bolt();
        rotate([0, 0, i * 45]) translate([7, 0, 15]) nut();
        rotate([0, 0, i * 45]) translate([7, 0, -15]) nut();
    }
}

// Render the assembly
assembly();

