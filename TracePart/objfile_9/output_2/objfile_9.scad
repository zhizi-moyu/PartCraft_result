
// Parameters for dimensions
module central_body() {
    difference() {
        cylinder(h = 30, r = 15, $fn = 100); // Main cylinder
        cylinder(h = 30, r = 7, $fn = 100);  // Hollow center
        for (i = [0:5]) { // Increased groove count to match original
            translate([0, 0, (i + 1) * 5])  // Adjusted spacing for grooves
                cylinder(h = 3, r1 = 15, r2 = 14, $fn = 100); // Deeper grooves
        }
    }
}

module input_shaft() {
    difference() {
        cylinder(h = 30, r = 7, $fn = 100); // Extended length and reduced thickness
        translate([0, 0, 25])
            cylinder(h = 5, r1 = 7, r2 = 5, $fn = 100); // Increased taper
    }
}

module output_shaft() {
    difference() {
        cylinder(h = 30, r = 7, $fn = 100); // Extended length and reduced thickness
        translate([0, 0, 25])
            cylinder(h = 5, r1 = 7, r2 = 5, $fn = 100); // Increased taper
    }
}

module coupling_gear() {
    difference() {
        cylinder(h = 6, r = 15, $fn = 100); // Main gear layer
        cylinder(h = 6, r = 7, $fn = 100);  // Hollow center
        for (i = [0:5]) { // Increased protrusion count to six
            rotate([0, 0, i * 60])
                translate([10, 0, 0])
                    cylinder(h = 6, r = 3, $fn = 100); // Well-defined protrusions
        }
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 1, r = 15, $fn = 100); // Reduced thickness
        cylinder(h = 1, r = 7, $fn = 100);  // Hollow center
    }
}

module bolt() {
    union() {
        cylinder(h = 25, r = 1.5, $fn = 100); // Extended threaded body
        translate([0, 0, 25])
            cylinder(h = 3, r = 4, $fn = 6); // Enlarged hexagonal head
    }
}

module nut() {
    difference() {
        cylinder(h = 4, r = 5, $fn = 6); // Increased size
        cylinder(h = 4, r = 2, $fn = 100); // Well-defined internal threading
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
    translate([0, 0, 44])
        spacer_ring();
    for (i = [0:2]) {
        rotate([0, 0, i * 120])
            translate([10, 0, 44])
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
    translate([0, 0, 9])
        spacer_ring();
    for (i = [0:2]) {
        rotate([0, 0, i * 120])
            translate([10, 0, 9])
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

