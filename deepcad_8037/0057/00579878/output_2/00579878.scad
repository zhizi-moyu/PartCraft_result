
// Parameters for components
module input_cylinder() {
    cylinder(h = 20, d = 30, $fn = 100); // Adjusted Height: 20, Diameter: 30 (Removed tapering)
}

module output_cylinder() {
    cylinder(h = 20, d = 30, $fn = 100); // Adjusted Height: 20, Diameter: 30 (Removed tapering)
}

module central_cylinder() {
    cylinder(h = 40, d = 40, $fn = 100); // Height: 40, Diameter: 40 (Uniform cylindrical shape)
}

module spacer_ring() {
    difference() {
        cylinder(h = 1, d = 40, $fn = 100); // Adjusted Outer Diameter: 40, Height: 1 (Reduced thickness)
        translate([0, 0, -0.5]) cylinder(h = 2, d = 30, $fn = 100); // Adjusted Inner Diameter: 30
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 10, d = 55, $fn = 100); // Adjusted Outer Diameter: 55, Height: 10
        translate([0, 0, -1]) cylinder(h = 12, d = 30, $fn = 100); // Inner Diameter: 30
        for (angle = [0:45:315]) { // Increased number of bolt holes (8 evenly distributed)
            translate([22 * cos(angle), 22 * sin(angle), 0])
                cylinder(h = 12, d = 4, $fn = 100); // Adjusted Bolt hole diameter: 4
        }
    }
}

module bolt() {
    cylinder(h = 50, d = 4, $fn = 100); // Adjusted Height: 50, Diameter: 4 (Reduced diameter)
    translate([0, 0, 0]) cylinder(h = 50, d = 3.5, $fn = 100); // Added threading effect
}

module nut() {
    cylinder(h = 2, d = 5, $fn = 6); // Adjusted Height: 2, Diameter: 5 (Hexagonal, reduced size)
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input Cylinder
    translate([0, 0, 90]) input_cylinder();

    // Layer 2: Flange Plate 1, Spacer Ring 1, Bolts, and Nuts
    translate([0, 0, 70]) flange_plate();
    translate([0, 0, 69]) spacer_ring();
    for (angle = [0:45:315]) {
        translate([22 * cos(angle), 22 * sin(angle), 65]) bolt();
        translate([22 * cos(angle), 22 * sin(angle), 60]) nut();
    }

    // Layer 3: Central Cylinder
    translate([0, 0, 25]) central_cylinder();

    // Layer 4: Flange Plate 2, Spacer Ring 2, Bolts, and Nuts
    translate([0, 0, 5]) flange_plate();
    translate([0, 0, 4]) spacer_ring();
    for (angle = [0:45:315]) {
        translate([22 * cos(angle), 22 * sin(angle), 0]) bolt();
        translate([22 * cos(angle), 22 * sin(angle), -5]) nut();
    }

    // Layer 5: Output Cylinder
    translate([0, 0, -20]) output_cylinder();
}

// Render the full assembly
flexible_coupling();

