
// Parameters for components
module central_cylinder() {
    cylinder(h = 30, r = 15, $fn = 100); // Main cylinder with smooth surface
}

module input_cylinder() {
    cylinder(h = 20, r = 15, $fn = 100); // Single, continuous cylinder
}

module output_cylinder() {
    cylinder(h = 20, r = 15, $fn = 100); // Single, continuous cylinder
}

module spacer_ring() {
    difference() {
        cylinder(h = 5, r = 15, $fn = 100); // Outer ring
        translate([0, 0, -1]) cylinder(h = 7, r = 10, $fn = 100); // Inner cutout
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 5, r = 15, $fn = 100); // Outer ring
        translate([0, 0, -1]) cylinder(h = 7, r = 10, $fn = 100); // Inner cutout
        for (angle = [0:90:270]) {
            translate([12 * cos(angle), 12 * sin(angle), -1])
                cylinder(h = 7, r = 2, $fn = 50); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 5, r = 3, $fn = 6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h = 20, r = 2, $fn = 50); // Bolt shaft
        translate([0, 0, 20]) cylinder(h = 2, r = 3, $fn = 50); // Bolt head
    }
}

// Assembly
module assembly() {
    translate([0, 0, 0]) input_cylinder(); // Layer 1
    translate([0, 0, -5]) flange_plate(); // Layer 2
    translate([0, 0, -10]) spacer_ring(); // Layer 3
    translate([0, 0, -15]) flange_plate(); // Layer 4
    translate([0, 0, -20]) central_cylinder(); // Layer 5
    translate([0, 0, -35]) flange_plate(); // Layer 6
    translate([0, 0, -40]) spacer_ring(); // Layer 7
    translate([0, 0, -45]) flange_plate(); // Layer 8
    translate([0, 0, -50]) output_cylinder(); // Layer 9

    // Bolts and nuts
    for (angle = [0:90:270]) {
        translate([12 * cos(angle), 12 * sin(angle), -5])
            bolt(); // Bolts in flange plates
        translate([12 * cos(angle), 12 * sin(angle), -7])
            nut(); // Nuts securing bolts
    }
}

// Render the assembly
assembly();

