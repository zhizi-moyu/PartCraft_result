
// Central Cylinder
module central_cylinder() {
    cylinder(h = 25, d = 25, $fn = 100); // Adjusted Height: 25, Diameter: 25
}

// Input Cylinder
module input_cylinder() {
    translate([0, 0, -2]) // Smooth transition
        cylinder(h = 15, d = 20, $fn = 100); // Adjusted Height: 15, Diameter: 20
}

// Output Cylinder
module output_cylinder() {
    translate([0, 0, -2]) // Smooth transition
        cylinder(h = 15, d = 20, $fn = 100); // Adjusted Height: 15, Diameter: 20
}

// Spacer Ring
module spacer_ring() {
    difference() {
        cylinder(h = 2, d = 25, $fn = 100); // Adjusted Outer Diameter: 25, Height: 2
        cylinder(h = 3, d = 20, $fn = 100); // Adjusted Inner Diameter: 20
    }
}

// Flange Plate
module flange_plate() {
    difference() {
        cylinder(h = 3, d = 30, $fn = 100); // Adjusted Outer Diameter: 30, Height: 3
        cylinder(h = 4, d = 20, $fn = 100); // Adjusted Inner Diameter: 20
        for (i = [0:30:330]) { // Increased number of bolt holes
            rotate([0, 0, i])
                translate([12, 0, 0])
                    cylinder(h = 4, d = 2, $fn = 100); // Bolt Holes
        }
    }
}

// Nut
module nut() {
    cylinder(h = 3, d = 3, $fn = 6); // Adjusted Hexagonal Nut Size
}

// Bolt
module bolt() {
    union() {
        cylinder(h = 25, d = 1.5, $fn = 100); // Adjusted Bolt Shaft Length and Diameter
        translate([0, 0, 25])
            cylinder(h = 2, d = 3, $fn = 6); // Adjusted Bolt Head Size
    }
}

// Assembly
module assembly() {
    translate([0, 0, 0])
        central_cylinder();

    translate([0, 0, 25])
        input_cylinder();

    translate([0, 0, -15])
        output_cylinder();

    translate([0, 0, 23])
        spacer_ring();

    translate([0, 0, -13])
        spacer_ring();

    translate([0, 0, 25])
        flange_plate();

    translate([0, 0, -15])
        flange_plate();

    translate([0, 0, 28])
        flange_plate();

    translate([0, 0, -18])
        flange_plate();

    for (i = [0:30:330]) { // Adjusted for increased bolt and nut positions
        rotate([0, 0, i])
            translate([12, 0, 25])
                bolt();

        rotate([0, 0, i])
            translate([12, 0, -15])
                bolt();

        rotate([0, 0, i])
            translate([12, 0, 28])
                nut();

        rotate([0, 0, i])
            translate([12, 0, -18])
                nut();
    }
}

// Render the assembly
assembly();

