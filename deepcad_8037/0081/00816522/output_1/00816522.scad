
// Parameters for components
module central_cylinder() {
    difference() {
        cylinder(h = 18, d = 30, $fn = 100); // Main cylinder (reduced height from 20 to 18)
        translate([0, 0, -1]) cylinder(h = 20, d = 10, $fn = 100); // Central hole (adjusted to match new height)
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 1.5, d = 30, $fn = 100); // Outer ring (reduced thickness from 2 to 1.5)
        translate([0, 0, -1]) cylinder(h = 3, d = 10, $fn = 100); // Central hole (adjusted to match new thickness)
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 5, d = 30, $fn = 100); // Outer plate
        translate([0, 0, -1]) cylinder(h = 7, d = 10, $fn = 100); // Central hole
        for (angle = [0:60:300]) { // Adjusted hole arrangement from 45-degree spacing to 60-degree spacing
            translate([12 * cos(angle), 12 * sin(angle), -1]) cylinder(h = 7, d = 3, $fn = 100); // Bolt holes
        }
    }
}

module bolt() {
    cylinder(h = 20, d = 3, $fn = 100); // Bolt body (reduced length from 25 to 20)
}

module nut() {
    difference() {
        cylinder(h = 4, d = 5, $fn = 6); // Hexagonal nut (reduced size from 6 to 5)
        translate([0, 0, -1]) cylinder(h = 6, d = 3, $fn = 100); // Threaded hole (adjusted to match new nut size)
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Spacer Ring 1
    translate([0, 0, 32.5]) spacer_ring(); // Adjusted position to match new spacer ring thickness

    // Layer 2: Flange Plate 1
    translate([0, 0, 27.5]) flange_plate(); // Adjusted position to match new spacer ring thickness

    // Layer 3: Central Cylinder
    translate([0, 0, 9]) central_cylinder();

    // Layer 4: Flange Plate 2
    translate([0, 0, 4]) flange_plate();

    // Layer 5: Spacer Ring 2
    spacer_ring();

    // Bolts and Nuts
    for (angle = [0:60:300]) { // Adjusted bolt arrangement to match flange plate
        // Bolts
        translate([12 * cos(angle), 12 * sin(angle), 0]) bolt();

        // Nuts on top
        translate([12 * cos(angle), 12 * sin(angle), 32.5]) nut(); // Adjusted position to match new spacer ring thickness

        // Nuts on bottom
        translate([12 * cos(angle), 12 * sin(angle), -4]) nut(); // Adjusted position to match new nut size
    }
}

// Render the full assembly
flexible_coupling();

