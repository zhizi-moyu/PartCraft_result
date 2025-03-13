
// Parameters for dimensions
module central_body() {
    difference() {
        cylinder(h = 30, r = 15, $fn = 100); // Main cylinder
        cylinder(h = 30, r = 7, $fn = 100);  // Hollow center
        for (i = [0:4]) { // Adjusted groove spacing
            translate([0, 0, (i + 1) * 6])  // Evenly spaced grooves
                cylinder(h = 2, r1 = 15, r2 = 14, $fn = 100); // Pronounced grooves
        }
    }
}

module input_shaft() {
    difference() {
        cylinder(h = 25, r = 8, $fn = 100); // Increased thickness
        translate([0, 0, 20])
            cylinder(h = 5, r1 = 8, r2 = 6, $fn = 100); // Smooth tapering
    }
}

module output_shaft() {
    difference() {
        cylinder(h = 25, r = 8, $fn = 100); // Adjusted thickness
        translate([0, 0, 20])
            cylinder(h = 5, r1 = 8, r2 = 6, $fn = 100); // Smooth tapering
    }
}

module coupling_gear() {
    difference() {
        cylinder(h = 6, r = 15, $fn = 100); // Main gear layer thickened
        cylinder(h = 6, r = 7, $fn = 100);  // Hollow center
        for (i = [0:5]) {
            rotate([0, 0, i * 60])
                translate([10, 0, 0])
                    cylinder(h = 6, r = 2.5, $fn = 100); // Sharpened protrusions
        }
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 1.5, r = 15, $fn = 100); // Reduced thickness slightly
        cylinder(h = 1.5, r = 7, $fn = 100);  // Hollow center
    }
}

module bolt() {
    union() {
        cylinder(h = 22, r = 1.5, $fn = 100); // Extended body
        translate([0, 0, 22])
            cylinder(h = 2, r = 3, $fn = 6); // Hexagonal head
    }
}

module nut() {
    difference() {
        cylinder(h = 3.5, r = 4.5, $fn = 6); // Adjusted to ensure proper threading
        cylinder(h = 3.5, r = 1.8, $fn = 100); // Internal thread made more defined
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
    translate([0, 0, 43.5])
        spacer_ring();
    for (i = [0:2]) {
        rotate([0, 0, i * 120])
            translate([10, 0, 43.5])
                bolt();
        rotate([0, 0, i * 120])
            translate([10, 0, 41.5])
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

