// Parameters for components
module central_craft() {
    cylinder(h = 20, d = 30, $fn = 100); // Central solid cylinder
}

module input_craft() {
    difference() {
        cylinder(h = 15, d = 20, $fn = 100); // Outer cylinder with corrected diameter
        translate([0, 0, -1]) cylinder(h = 17, d = 15, $fn = 100); // Inner hollow
    }
}

module output_craft() {
    difference() {
        cylinder(h = 15, d = 20, $fn = 100); // Outer cylinder with corrected diameter
        translate([0, 0, -1]) cylinder(h = 17, d = 15, $fn = 100); // Inner hollow
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 0.5, d = 30, $fn = 100); // Outer ring with reduced thickness
        translate([0, 0, -0.5]) cylinder(h = 1, d = 20, $fn = 100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 2, d = 35, $fn = 100); // Outer plate with reduced thickness
        translate([0, 0, -2]) cylinder(h = 4, d = 25, $fn = 100); // Inner hollow
        for (angle = [0:45:315]) { // Corrected number of bolt holes
            translate([15 * cos(angle), 15 * sin(angle), 0])
                cylinder(h = 10, d = 3, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 4, d1 = 5, d2 = 5, $fn = 6); // Hexagonal nut with standardized size
}

module bolt() {
    union() {
        cylinder(h = 20, d = 2.5, $fn = 100); // Bolt shaft with reduced thickness
        translate([0, 0, 20]) cylinder(h = 4, d1 = 5, d2 = 5, $fn = 6); // Bolt head
    }
}

// Assembly
module assembly() {
    translate([0, 0, 0]) spacer_ring(); // Layer 1
    translate([0, 0, 0.5]) spacer_ring(); // Layer 2
    translate([0, 0, 1]) spacer_ring(); // Layer 3
    translate([0, 0, 1.5]) spacer_ring(); // Layer 4
    translate([0, 0, 2]) spacer_ring(); // Layer 5
    translate([0, 0, 2.5]) spacer_ring(); // Layer 6
    translate([0, 0, 3]) central_craft(); // Central craft
    translate([0, 0, 23]) input_craft(); // Input craft
    translate([0, 0, -12]) output_craft(); // Output craft
    translate([0, 0, 28]) flange_plate(); // Top flange plate
    translate([0, 0, -15]) flange_plate(); // Bottom flange plate
    for (angle = [0:45:315]) {
        translate([15 * cos(angle), 15 * sin(angle), 28])
            bolt(); // Top bolts
        translate([15 * cos(angle), 15 * sin(angle), -15])
            bolt(); // Bottom bolts
    }
    for (angle = [0:45:315]) {
        translate([15 * cos(angle), 15 * sin(angle), 32])
            nut(); // Top nuts
        translate([15 * cos(angle), 15 * sin(angle), -19])
            nut(); // Bottom nuts
    }
}

// Render the assembly
assembly();
