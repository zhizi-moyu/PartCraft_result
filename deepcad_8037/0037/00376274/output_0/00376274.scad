
// Parameters for the components
module central_cylinder() {
    cylinder(h = 30, r = 10, $fn = 100); // Central cylinder dimensions
}

module input_cylinder() {
    difference() {
        cylinder(h = 15, r = 10, $fn = 100); // Input cylinder dimensions
        translate([0, 0, -1]) cylinder(h = 17, r = 5, $fn = 100); // Hollow center
    }
}

module output_cylinder() {
    difference() {
        cylinder(h = 15, r = 10, $fn = 100); // Output cylinder dimensions
        translate([0, 0, -1]) cylinder(h = 17, r = 5, $fn = 100); // Hollow center
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 2, r = 10, $fn = 100); // Outer ring
        cylinder(h = 3, r = 8, $fn = 100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 3, r = 10, $fn = 100); // Flange plate
        cylinder(h = 4, r = 8, $fn = 100); // Inner hollow
        for (i = [0:90:270]) {
            rotate([0, 0, i]) translate([7, 0, -1]) cylinder(h = 5, r = 1, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 3, r = 2, $fn = 6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h = 20, r = 1, $fn = 100); // Bolt shaft
        translate([0, 0, 20]) cylinder(h = 2, r = 2, $fn = 100); // Bolt head
    }
}

// Assembly of the model
module flexible_coupling() {
    // Layer 1: Input cylinder
    translate([0, 0, 70]) input_cylinder();

    // Layer 2: First flange plate and nuts
    translate([0, 0, 67]) flange_plate();
    for (i = [0:90:270]) {
        rotate([0, 0, i]) translate([7, 0, 67]) nut();
    }

    // Layer 3: First spacer ring and bolts
    translate([0, 0, 64]) spacer_ring();
    for (i = [0:90:270]) {
        rotate([0, 0, i]) translate([7, 0, 64]) bolt();
    }

    // Layer 4: Second flange plate and nuts
    translate([0, 0, 61]) flange_plate();
    for (i = [0:90:270]) {
        rotate([0, 0, i]) translate([7, 0, 61]) nut();
    }

    // Layer 5: Central cylinder
    translate([0, 0, 46]) central_cylinder();

    // Layer 6: Third flange plate and nuts
    translate([0, 0, 31]) flange_plate();
    for (i = [0:90:270]) {
        rotate([0, 0, i]) translate([7, 0, 31]) nut();
    }

    // Layer 7: Second spacer ring and bolts
    translate([0, 0, 28]) spacer_ring();
    for (i = [0:90:270]) {
        rotate([0, 0, i]) translate([7, 0, 28]) bolt();
    }

    // Layer 8: Fourth flange plate and nuts
    translate([0, 0, 25]) flange_plate();
    for (i = [0:90:270]) {
        rotate([0, 0, i]) translate([7, 0, 25]) nut();
    }

    // Layer 9: Output cylinder
    translate([0, 0, 10]) output_cylinder();
}

// Render the full model
flexible_coupling();

