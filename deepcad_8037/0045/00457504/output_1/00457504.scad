// Parameters for components
module central_craft() {
    cylinder(h = 20, d = 30, $fn = 100); // Central solid cylinder
}

module input_craft() {
    difference() {
        cylinder(h = 15, d = 20, $fn = 100); // Outer cylinder with reduced diameter
        translate([0, 0, -1]) cylinder(h = 17, d = 15, $fn = 100); // Inner hollow
    }
}

module output_craft() {
    difference() {
        cylinder(h = 15, d = 20, $fn = 100); // Outer cylinder with reduced diameter
        translate([0, 0, -1]) cylinder(h = 17, d = 15, $fn = 100); // Inner hollow
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 1, d = 30, $fn = 100); // Outer ring with reduced thickness
        translate([0, 0, -1]) cylinder(h = 2, d = 20, $fn = 100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 3, d = 35, $fn = 100); // Outer plate with reduced thickness
        translate([0, 0, -1]) cylinder(h = 5, d = 25, $fn = 100); // Inner hollow
        for (angle = [0:30:330]) { // Increased number of bolt holes
            translate([15 * cos(angle), 15 * sin(angle), 0])
                cylinder(h = 10, d = 3, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 5, d1 = 6, d2 = 6, $fn = 6); // Hexagonal nut with sharp edges
}

module bolt() {
    union() {
        cylinder(h = 25, d = 3, $fn = 100); // Bolt shaft with increased length
        translate([0, 0, 25]) cylinder(h = 5, d1 = 6, d2 = 6, $fn = 6); // Bolt head
    }
}

// Assembly
module assembly() {
    translate([0, 0, 0]) spacer_ring(); // Layer 1
    translate([0, 0, 1]) spacer_ring(); // Layer 2
    translate([0, 0, 2]) spacer_ring(); // Layer 3
    translate([0, 0, 3]) spacer_ring(); // Layer 4
    translate([0, 0, 4]) spacer_ring(); // Layer 5
    translate([0, 0, 5]) spacer_ring(); // Layer 6
    translate([0, 0, 6]) central_craft(); // Central craft
    translate([0, 0, 26]) input_craft(); // Input craft
    translate([0, 0, -15]) output_craft(); // Output craft
    translate([0, 0, 31]) flange_plate(); // Top flange plate
    translate([0, 0, -20]) flange_plate(); // Bottom flange plate
    for (angle = [0:30:330]) {
        translate([15 * cos(angle), 15 * sin(angle), 31])
            bolt(); // Top bolts
        translate([15 * cos(angle), 15 * sin(angle), -20])
            bolt(); // Bottom bolts
    }
    for (angle = [0:30:330]) {
        translate([15 * cos(angle), 15 * sin(angle), 36])
            nut(); // Top nuts
        translate([15 * cos(angle), 15 * sin(angle), -25])
            nut(); // Bottom nuts
    }
}

// Render the assembly
assembly();
