
// Parameters for the components
module central_cylinder() {
    cylinder(h = 50, r = 10, $fn = 200); // Central cylinder dimensions (elongated and smoothed)
}

module input_cylinder() {
    difference() {
        cylinder(h = 15, r = 12, $fn = 200); // Input cylinder dimensions
        translate([0, 0, -1]) cylinder(h = 17, r = 6, $fn = 200); // Hollow center (adjusted shape)
    }
}

module output_cylinder() {
    difference() {
        cylinder(h = 20, r = 12, $fn = 200); // Output cylinder dimensions
        translate([0, 0, -1]) cylinder(h = 22, r = 6, $fn = 200); // Hollow center (reshaped)
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 0.5, r = 10, $fn = 200); // Outer ring (thinner and flatter)
        cylinder(h = 1, r = 8, $fn = 200); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 3, r = 10, $fn = 200); // Flange plate
        cylinder(h = 4, r = 8, $fn = 200); // Inner hollow
        for (i = [0:45:315]) { // Increased number of bolt holes
            rotate([0, 0, i]) translate([7, 0, -1]) cylinder(h = 5, r = 1.5, $fn = 200); // Refined bolt holes
        }
    }
}

module nut() {
    cylinder(h = 2, r = 1.2, $fn = 6); // Hexagonal nut (smaller and refined shape)
}

module bolt() {
    union() {
        cylinder(h = 25, r = 0.8, $fn = 200); // Bolt shaft (thinner)
        translate([0, 0, 25]) cylinder(h = 2, r = 1.5, $fn = 200); // Bolt head
    }
}

// Assembly of the model
module flexible_coupling() {
    // Layer 1: Input cylinder
    translate([0, 0, 75]) input_cylinder();

    // Layer 2: First flange plate and nuts
    translate([0, 0, 72]) flange_plate();
    for (i = [0:45:315]) {
        rotate([0, 0, i]) translate([7, 0, 72]) nut();
    }

    // Layer 3: First spacer ring and bolts
    translate([0, 0, 70]) spacer_ring();
    for (i = [0:45:315]) {
        rotate([0, 0, i]) translate([7, 0, 70]) bolt();
    }

    // Layer 4: Second flange plate and nuts
    translate([0, 0, 68]) flange_plate();
    for (i = [0:45:315]) {
        rotate([0, 0, i]) translate([7, 0, 68]) nut();
    }

    // Layer 5: Central cylinder
    translate([0, 0, 48]) central_cylinder();

    // Layer 6: Third flange plate and nuts
    translate([0, 0, 33]) flange_plate();
    for (i = [0:45:315]) {
        rotate([0, 0, i]) translate([7, 0, 33]) nut();
    }

    // Layer 7: Second spacer ring and bolts
    translate([0, 0, 31]) spacer_ring();
    for (i = [0:45:315]) {
        rotate([0, 0, i]) translate([7, 0, 31]) bolt();
    }

    // Layer 8: Fourth flange plate and nuts
    translate([0, 0, 29]) flange_plate();
    for (i = [0:45:315]) {
        rotate([0, 0, i]) translate([7, 0, 29]) nut();
    }

    // Layer 9: Output cylinder
    translate([0, 0, 10]) output_cylinder();
}

// Render the full model
flexible_coupling();

