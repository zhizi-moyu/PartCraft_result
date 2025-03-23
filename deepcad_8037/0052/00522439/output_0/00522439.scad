
// Central Cylinder
module central_cylinder() {
    cylinder(h = 30, d = 20, $fn = 100); // Height: 30, Diameter: 20
}

// Input Cylinder
module input_cylinder() {
    cylinder(h = 20, d = 15, $fn = 100); // Height: 20, Diameter: 15
}

// Output Cylinder
module output_cylinder() {
    cylinder(h = 20, d = 15, $fn = 100); // Height: 20, Diameter: 15
}

// Spacer Ring
module spacer_ring() {
    difference() {
        cylinder(h = 5, d = 20, $fn = 100); // Outer Diameter: 20, Height: 5
        cylinder(h = 6, d = 15, $fn = 100); // Inner Diameter: 15
    }
}

// Flange Plate
module flange_plate() {
    difference() {
        cylinder(h = 5, d = 25, $fn = 100); // Outer Diameter: 25, Height: 5
        cylinder(h = 6, d = 15, $fn = 100); // Inner Diameter: 15
        for (i = [0:45:315]) {
            rotate([0, 0, i])
                translate([10, 0, 0])
                    cylinder(h = 6, d = 2, $fn = 100); // Bolt Holes
        }
    }
}

// Nut
module nut() {
    cylinder(h = 5, d = 4, $fn = 6); // Hexagonal Nut
}

// Bolt
module bolt() {
    union() {
        cylinder(h = 20, d = 2, $fn = 100); // Bolt Shaft
        translate([0, 0, 20])
            cylinder(h = 2, d = 4, $fn = 6); // Bolt Head
    }
}

// Assembly
module assembly() {
    translate([0, 0, 0])
        central_cylinder();

    translate([0, 0, 30])
        input_cylinder();

    translate([0, 0, -20])
        output_cylinder();

    translate([0, 0, 25])
        spacer_ring();

    translate([0, 0, -15])
        spacer_ring();

    translate([0, 0, 30])
        flange_plate();

    translate([0, 0, -20])
        flange_plate();

    translate([0, 0, 35])
        flange_plate();

    translate([0, 0, -25])
        flange_plate();

    for (i = [0:45:315]) {
        rotate([0, 0, i])
            translate([10, 0, 30])
                bolt();

        rotate([0, 0, i])
            translate([10, 0, -20])
                bolt();

        rotate([0, 0, i])
            translate([10, 0, 35])
                nut();

        rotate([0, 0, i])
            translate([10, 0, -25])
                nut();
    }
}

// Render the assembly
assembly();

