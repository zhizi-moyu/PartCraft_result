
// Parameters for components
module central_cylinder() {
    difference() {
        cylinder(h = 20, d = 30, $fn = 100); // Main cylinder
        translate([0, 0, -1]) cylinder(h = 22, d = 10, $fn = 100); // Central hole
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 2, d = 30, $fn = 100); // Outer ring
        translate([0, 0, -1]) cylinder(h = 4, d = 10, $fn = 100); // Central hole
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 5, d = 30, $fn = 100); // Outer plate
        translate([0, 0, -1]) cylinder(h = 7, d = 10, $fn = 100); // Central hole
        for (angle = [0:45:315]) {
            translate([12 * cos(angle), 12 * sin(angle), -1]) cylinder(h = 7, d = 3, $fn = 100); // Bolt holes
        }
    }
}

module bolt() {
    cylinder(h = 25, d = 3, $fn = 100); // Bolt body
}

module nut() {
    difference() {
        cylinder(h = 5, d = 6, $fn = 6); // Hexagonal nut
        translate([0, 0, -1]) cylinder(h = 7, d = 3, $fn = 100); // Threaded hole
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Spacer Ring 1
    translate([0, 0, 34]) spacer_ring();

    // Layer 2: Flange Plate 1
    translate([0, 0, 29]) flange_plate();

    // Layer 3: Central Cylinder
    translate([0, 0, 9]) central_cylinder();

    // Layer 4: Flange Plate 2
    translate([0, 0, 4]) flange_plate();

    // Layer 5: Spacer Ring 2
    spacer_ring();

    // Bolts and Nuts
    for (angle = [0:45:315]) {
        // Bolts
        translate([12 * cos(angle), 12 * sin(angle), 0]) bolt();

        // Nuts on top
        translate([12 * cos(angle), 12 * sin(angle), 34]) nut();

        // Nuts on bottom
        translate([12 * cos(angle), 12 * sin(angle), -5]) nut();
    }
}

// Render the full assembly
flexible_coupling();

