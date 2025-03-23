
// Parameters for the components
module central_shaft() {
    cylinder(h = 50, r = 5, $fn = 100); // Central shaft dimensions (smooth surface)
}

module input_shaft() {
    difference() {
        cylinder(h = 25, r = 5, $fn = 100); // Input shaft dimensions (adjusted length)
        translate([0, 0, -1]) cylinder(h = 27, r = 2, $fn = 100); // Hollow center
    }
}

module output_shaft() {
    difference() {
        cylinder(h = 25, r = 5, $fn = 100); // Output shaft dimensions (adjusted length)
        translate([0, 0, -1]) cylinder(h = 27, r = 2, $fn = 100); // Hollow center
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 2, r = 6, $fn = 100); // Outer ring (flat, thin design)
        cylinder(h = 2, r = 4, $fn = 100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 5, r = 7, $fn = 100); // Flange plate
        cylinder(h = 5, r = 4, $fn = 100); // Inner hollow
        for (angle = [0:90:270]) {
            rotate([0, 0, angle])
            translate([5, 0, 0])
            cylinder(h = 5, r = 0.5, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 3, r = 1.5, $fn = 6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h = 20, r = 0.5, $fn = 100); // Bolt shaft
        translate([0, 0, 20]) cylinder(h = 2, r = 0.8, $fn = 100); // Bolt head
    }
}

// Assembly of the flexible coupling
module flexible_coupling() {
    // Layer 1: Input shaft
    translate([0, 0, 0]) input_shaft();

    // Layer 2: Flange plate and nuts
    translate([0, 0, 25]) flange_plate();
    for (angle = [0:90:270]) {
        rotate([0, 0, angle])
        translate([5, 0, 25])
        nut();
    }

    // Layer 3: Spacer ring and bolts
    translate([0, 0, 30]) spacer_ring();
    for (angle = [0:90:270]) {
        rotate([0, 0, angle])
        translate([5, 0, 30])
        bolt();
    }

    // Layer 4: Flange plate and nuts
    translate([0, 0, 32]) flange_plate();
    for (angle = [0:90:270]) {
        rotate([0, 0, angle])
        translate([5, 0, 32])
        nut();
    }

    // Layer 5: Central shaft
    translate([0, 0, 37]) central_shaft();

    // Layer 6: Flange plate and nuts
    translate([0, 0, 62]) flange_plate();
    for (angle = [0:90:270]) {
        rotate([0, 0, angle])
        translate([5, 0, 62])
        nut();
    }

    // Layer 7: Spacer ring and bolts
    translate([0, 0, 67]) spacer_ring();
    for (angle = [0:90:270]) {
        rotate([0, 0, angle])
        translate([5, 0, 67])
        bolt();
    }

    // Layer 8: Flange plate and nuts
    translate([0, 0, 69]) flange_plate();
    for (angle = [0:90:270]) {
        rotate([0, 0, angle])
        translate([5, 0, 69])
        nut();
    }

    // Layer 9: Output shaft
    translate([0, 0, 74]) output_shaft();
}

// Render the flexible coupling
flexible_coupling();

