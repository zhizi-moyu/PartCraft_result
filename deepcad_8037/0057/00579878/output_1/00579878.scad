
// Parameters for components
module input_cylinder() {
    cylinder(h = 15, d = 30, $fn = 100); // Adjusted Height: 15, Diameter: 30
}

module output_cylinder() {
    cylinder(h = 15, d = 30, $fn = 100); // Adjusted Height: 15, Diameter: 30
}

module central_cylinder() {
    cylinder(h = 40, d = 40, $fn = 100); // Height: 40, Diameter: 40 (Removed tapering)
}

module spacer_ring() {
    difference() {
        cylinder(h = 2, d = 40, $fn = 100); // Adjusted Outer Diameter: 40, Height: 2
        translate([0, 0, -1]) cylinder(h = 4, d = 30, $fn = 100); // Adjusted Inner Diameter: 30
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 10, d = 50, $fn = 100); // Outer Diameter: 50, Height: 10
        translate([0, 0, -1]) cylinder(h = 12, d = 30, $fn = 100); // Inner Diameter: 30
        for (angle = [0:60:300]) { // Adjusted evenly distributed bolt holes
            translate([20 * cos(angle), 20 * sin(angle), 0])
                cylinder(h = 12, d = 5, $fn = 100); // Bolt holes
        }
    }
}

module bolt() {
    cylinder(h = 40, d = 5, $fn = 100); // Adjusted Height: 40, Diameter: 5
    translate([0, 0, 0]) cylinder(h = 40, d = 4, $fn = 100); // Added threading effect
}

module nut() {
    cylinder(h = 3, d = 6, $fn = 6); // Adjusted Height: 3, Diameter: 6 (Hexagonal)
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input Cylinder
    translate([0, 0, 90]) input_cylinder();

    // Layer 2: Flange Plate 1, Spacer Ring 1, Bolts, and Nuts
    translate([0, 0, 70]) flange_plate();
    translate([0, 0, 68]) spacer_ring();
    for (angle = [0:60:300]) {
        translate([20 * cos(angle), 20 * sin(angle), 65]) bolt();
        translate([20 * cos(angle), 20 * sin(angle), 60]) nut();
    }

    // Layer 3: Central Cylinder
    translate([0, 0, 25]) central_cylinder();

    // Layer 4: Flange Plate 2, Spacer Ring 2, Bolts, and Nuts
    translate([0, 0, 5]) flange_plate();
    translate([0, 0, 3]) spacer_ring();
    for (angle = [0:60:300]) {
        translate([20 * cos(angle), 20 * sin(angle), 0]) bolt();
        translate([20 * cos(angle), 20 * sin(angle), -5]) nut();
    }

    // Layer 5: Output Cylinder
    translate([0, 0, -20]) output_cylinder();
}

// Render the full assembly
flexible_coupling();

