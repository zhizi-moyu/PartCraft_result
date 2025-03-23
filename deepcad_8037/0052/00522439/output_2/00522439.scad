
// Central Cylinder
module central_cylinder() {
    cylinder(h = 20, d = 22, $fn = 100); // Adjusted Height: 20, Diameter: 22
}

// Input Cylinder
module input_cylinder() {
    translate([0, 0, -1]) // Smooth transition
        cylinder(h = 15, d = 22, $fn = 100); // Adjusted Height: 15, Diameter: 22
}

// Output Cylinder
module output_cylinder() {
    translate([0, 0, -1]) // Smooth transition
        cylinder(h = 15, d = 22, $fn = 100); // Adjusted Height: 15, Diameter: 22
}

// Spacer Ring
module spacer_ring() {
    difference() {
        cylinder(h = 1.5, d = 22, $fn = 100); // Adjusted Outer Diameter: 22, Height: 1.5
        cylinder(h = 2, d = 18, $fn = 100); // Adjusted Inner Diameter: 18
    }
}

// Flange Plate
module flange_plate() {
    difference() {
        cylinder(h = 2, d = 28, $fn = 100); // Adjusted Outer Diameter: 28, Height: 2
        cylinder(h = 3, d = 18, $fn = 100); // Adjusted Inner Diameter: 18
        for (i = [0:15:345]) { // Increased number of bolt holes
            rotate([0, 0, i])
                translate([12, 0, 0])
                    cylinder(h = 3, d = 1.5, $fn = 100); // Bolt Holes
        }
    }
}

// Nut
module nut() {
    cylinder(h = 2, d = 2.5, $fn = 6); // Adjusted Hexagonal Nut Size
}

// Bolt
module bolt() {
    union() {
        cylinder(h = 30, d = 1, $fn = 100); // Adjusted Bolt Shaft Length and Diameter
        translate([0, 0, 30])
            cylinder(h = 1.5, d = 2.5, $fn = 6); // Adjusted Bolt Head Size
    }
}

// Assembly
module assembly() {
    translate([0, 0, 0])
        central_cylinder();

    translate([0, 0, 20])
        input_cylinder();

    translate([0, 0, -15])
        output_cylinder();

    translate([0, 0, 18])
        spacer_ring();

    translate([0, 0, -13])
        spacer_ring();

    translate([0, 0, 20])
        flange_plate();

    translate([0, 0, -15])
        flange_plate();

    translate([0, 0, 22])
        flange_plate();

    translate([0, 0, -17])
        flange_plate();

    for (i = [0:15:345]) { // Adjusted for increased bolt and nut positions
        rotate([0, 0, i])
            translate([12, 0, 20])
                bolt();

        rotate([0, 0, i])
            translate([12, 0, -15])
                bolt();

        rotate([0, 0, i])
            translate([12, 0, 22])
                nut();

        rotate([0, 0, i])
            translate([12, 0, -17])
                nut();
    }
}

// Render the assembly
assembly();

