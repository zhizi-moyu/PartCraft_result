
// Parameters for components
module central_craft() {
    cylinder(h = 20, d = 30, $fn = 100); // Central solid cylinder
}

module input_craft() {
    difference() {
        cylinder(h = 15, d = 25, $fn = 100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h = 17, d = 15, $fn = 100); // Inner hollow
    }
}

module output_craft() {
    difference() {
        cylinder(h = 15, d = 25, $fn = 100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h = 17, d = 15, $fn = 100); // Inner hollow
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 2, d = 30, $fn = 100); // Outer ring
        translate([0, 0, -1]) cylinder(h = 4, d = 20, $fn = 100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 5, d = 35, $fn = 100); // Outer plate
        translate([0, 0, -1]) cylinder(h = 7, d = 25, $fn = 100); // Inner hollow
        for (angle = [0:45:315]) {
            translate([15 * cos(angle), 15 * sin(angle), 0])
                cylinder(h = 10, d = 3, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 5, d1 = 6, d2 = 6, $fn = 6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h = 20, d = 3, $fn = 100); // Bolt shaft
        translate([0, 0, 20]) cylinder(h = 5, d1 = 6, d2 = 6, $fn = 6); // Bolt head
    }
}

// Assembly
module assembly() {
    translate([0, 0, 0]) spacer_ring(); // Layer 1
    translate([0, 0, 2]) spacer_ring(); // Layer 2
    translate([0, 0, 4]) spacer_ring(); // Layer 3
    translate([0, 0, 6]) spacer_ring(); // Layer 4
    translate([0, 0, 8]) spacer_ring(); // Layer 5
    translate([0, 0, 10]) spacer_ring(); // Layer 6
    translate([0, 0, 12]) central_craft(); // Central craft
    translate([0, 0, 32]) input_craft(); // Input craft
    translate([0, 0, -20]) output_craft(); // Output craft
    translate([0, 0, 37]) flange_plate(); // Top flange plate
    translate([0, 0, -25]) flange_plate(); // Bottom flange plate
    for (angle = [0:45:315]) {
        translate([15 * cos(angle), 15 * sin(angle), 37])
            bolt(); // Top bolts
        translate([15 * cos(angle), 15 * sin(angle), -25])
            bolt(); // Bottom bolts
    }
    for (angle = [0:45:315]) {
        translate([15 * cos(angle), 15 * sin(angle), 42])
            nut(); // Top nuts
        translate([15 * cos(angle), 15 * sin(angle), -30])
            nut(); // Bottom nuts
    }
}

// Render the assembly
assembly();

