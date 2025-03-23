
// Parameters for components
module central_cylinder() {
    difference() {
        cylinder(h = 16, d = 30, $fn = 100); // Main cylinder (reduced height from 18 to 16)
        translate([0, 0, -1]) cylinder(h = 18, d = 10, $fn = 100); // Central hole (adjusted to match new height)
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 1, d = 30, $fn = 100); // Outer ring (reduced thickness from 1.5 to 1)
        translate([0, 0, -1]) cylinder(h = 2, d = 10, $fn = 100); // Central hole (adjusted to match new thickness)
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 5, d = 28, $fn = 100); // Outer plate (reduced diameter from 30 to 28)
        translate([0, 0, -1]) cylinder(h = 7, d = 10, $fn = 100); // Central hole
        for (angle = [0:60:300]) { // Adjusted hole arrangement remains the same
            translate([10 * cos(angle), 10 * sin(angle), -1]) cylinder(h = 7, d = 3, $fn = 100); // Bolt holes repositioned closer to the center
        }
    }
}

module bolt() {
    cylinder(h = 18, d = 3, $fn = 100); // Bolt body (reduced length from 20 to 18)
}

module nut() {
    difference() {
        cylinder(h = 3, d = 4, $fn = 6); // Hexagonal nut (reduced size from 5 to 4)
        translate([0, 0, -1]) cylinder(h = 4, d = 3, $fn = 100); // Threaded hole (adjusted to match new nut size)
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Spacer Ring 1
    translate([0, 0, 31]) spacer_ring(); // Adjusted position to match new spacer ring thickness

    // Layer 2: Flange Plate 1
    translate([0, 0, 26]) flange_plate(); // Adjusted position to match new spacer ring thickness

    // Layer 3: Central Cylinder
    translate([0, 0, 8]) central_cylinder();

    // Layer 4: Flange Plate 2
    translate([0, 0, 3]) flange_plate();

    // Layer 5: Spacer Ring 2
    spacer_ring();

    // Bolts and Nuts
    for (angle = [0:60:300]) { // Adjusted bolt arrangement to match flange plate
        // Bolts
        translate([10 * cos(angle), 10 * sin(angle), 0]) bolt();

        // Nuts on top
        translate([10 * cos(angle), 10 * sin(angle), 31]) nut(); // Adjusted position to match new spacer ring thickness

        // Nuts on bottom
        translate([10 * cos(angle), 10 * sin(angle), -3]) nut(); // Adjusted position to match new nut size
    }
}

// Render the full assembly
flexible_coupling();

