
// Parameters for dimensions
module central_body() {
    difference() {
        cylinder(h = 30, r = 15, $fn = 100); // Main cylinder
        cylinder(h = 30, r = 7, $fn = 100);  // Hollow center
        for (i = [0:5]) {
            translate([0, 0, i * 5])
                cylinder(h = 2, r = 15, $fn = 100); // Grooves
        }
    }
}

module input_shaft() {
    difference() {
        cylinder(h = 20, r = 7, $fn = 100); // Main shaft
        translate([0, 0, 15])
            cylinder(h = 5, r1 = 7, r2 = 5, $fn = 100); // Tapered end
    }
}

module output_shaft() {
    input_shaft(); // Same as input shaft
}

module coupling_gear() {
    difference() {
        cylinder(h = 5, r = 15, $fn = 100); // Main gear
        cylinder(h = 5, r = 7, $fn = 100);  // Hollow center
        for (i = [0:5]) {
            rotate([0, 0, i * 60])
                translate([10, 0, 0])
                    cylinder(h = 5, r = 2, $fn = 100); // Protrusions
        }
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 2, r = 15, $fn = 100); // Main ring
        cylinder(h = 2, r = 7, $fn = 100);  // Hollow center
    }
}

module bolt() {
    union() {
        cylinder(h = 20, r = 1.5, $fn = 100); // Threaded body
        translate([0, 0, 20])
            cylinder(h = 2, r = 3, $fn = 6); // Hexagonal head
    }
}

module nut() {
    difference() {
        cylinder(h = 3, r = 4, $fn = 6); // Hexagonal nut
        cylinder(h = 3, r = 1.5, $fn = 100); // Internal thread
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input shaft
    translate([0, 0, 50])
        input_shaft();

    // Layer 2: First coupling gear, spacer ring, bolts, and nuts
    translate([0, 0, 45])
        coupling_gear();
    translate([0, 0, 43])
        spacer_ring();
    for (i = [0:2]) {
        rotate([0, 0, i * 120])
            translate([10, 0, 43])
                bolt();
        rotate([0, 0, i * 120])
            translate([10, 0, 41])
                nut();
    }

    // Layer 3: Central body
    translate([0, 0, 15])
        central_body();

    // Layer 4: Second coupling gear, spacer ring, bolts, and nuts
    translate([0, 0, 10])
        coupling_gear();
    translate([0, 0, 8])
        spacer_ring();
    for (i = [0:2]) {
        rotate([0, 0, i * 120])
            translate([10, 0, 8])
                bolt();
        rotate([0, 0, i * 120])
            translate([10, 0, 6])
                nut();
    }

    // Layer 5: Output shaft
    translate([0, 0, 0])
        output_shaft();
}

// Render the full assembly
flexible_coupling();

