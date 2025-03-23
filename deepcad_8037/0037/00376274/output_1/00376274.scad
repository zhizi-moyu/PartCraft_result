
// Parameters for the components
module central_cylinder() {
    cylinder(h = 40, r = 10, $fn = 100); // Central cylinder dimensions (elongated)
}

module input_cylinder() {
    difference() {
        cylinder(h = 15, r = 12, $fn = 100); // Input cylinder dimensions (widened diameter)
        translate([0, 0, -1]) cylinder(h = 17, r = 7, $fn = 100); // Hollow center (widened)
    }
}

module output_cylinder() {
    difference() {
        cylinder(h = 20, r = 12, $fn = 100); // Output cylinder dimensions (lengthened and widened diameter)
        translate([0, 0, -1]) cylinder(h = 22, r = 7, $fn = 100); // Hollow center (widened)
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 1, r = 10, $fn = 100); // Outer ring (thinner)
        cylinder(h = 2, r = 8, $fn = 100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 3, r = 10, $fn = 100); // Flange plate
        cylinder(h = 4, r = 8, $fn = 100); // Inner hollow
        for (i = [0:60:300]) { // Increased number of bolt holes
            rotate([0, 0, i]) translate([7, 0, -1]) cylinder(h = 5, r = 2, $fn = 100); // Enlarged bolt holes
        }
    }
}

module nut() {
    cylinder(h = 2.5, r = 1.5, $fn = 6); // Hexagonal nut (reduced size)
}

module bolt() {
    union() {
        cylinder(h = 25, r = 1, $fn = 100); // Bolt shaft (lengthened)
        translate([0, 0, 25]) cylinder(h = 2, r = 2, $fn = 100); // Bolt head
    }
}

// Assembly of the model
module flexible_coupling() {
    // Layer 1: Input cylinder
    translate([0, 0, 75]) input_cylinder();

    // Layer 2: First flange plate and nuts
    translate([0, 0, 72]) flange_plate();
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([7, 0, 72]) nut();
    }

    // Layer 3: First spacer ring and bolts
    translate([0, 0, 70]) spacer_ring();
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([7, 0, 70]) bolt();
    }

    // Layer 4: Second flange plate and nuts
    translate([0, 0, 68]) flange_plate();
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([7, 0, 68]) nut();
    }

    // Layer 5: Central cylinder
    translate([0, 0, 48]) central_cylinder();

    // Layer 6: Third flange plate and nuts
    translate([0, 0, 33]) flange_plate();
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([7, 0, 33]) nut();
    }

    // Layer 7: Second spacer ring and bolts
    translate([0, 0, 31]) spacer_ring();
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([7, 0, 31]) bolt();
    }

    // Layer 8: Fourth flange plate and nuts
    translate([0, 0, 29]) flange_plate();
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([7, 0, 29]) nut();
    }

    // Layer 9: Output cylinder
    translate([0, 0, 10]) output_cylinder();
}

// Render the full model
flexible_coupling();

