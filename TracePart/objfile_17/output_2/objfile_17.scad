
// Parameters for components
module input_shaft_hub() {
    difference() {
        union() {
            cylinder(h=15, d=30); // Main cylindrical hub
            translate([0, 0, 15]) cylinder(h=5, d=40); // Flange
        }
        translate([0, 0, -1]) cylinder(h=17, d=10); // Central hole
        for (i = [0:60:300]) { // Bolt holes in flange
            rotate([0, 0, i]) translate([15, 0, 15]) cylinder(h=10, d=4);
        }
    }
}

module output_shaft_hub() {
    difference() {
        union() {
            cylinder(h=15, d=35); // Main cylindrical hub
            translate([0, 0, 15]) cylinder(h=5, d=45); // Flange
        }
        translate([0, 0, -1]) cylinder(h=17, d=10); // Central hole
        for (i = [0:60:300]) { // Bolt holes in flange
            rotate([0, 0, i]) translate([17, 0, 15]) cylinder(h=10, d=4);
        }
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=5, d=40); // Adjusted thickness and diameter
        translate([0, 0, -1]) cylinder(h=7, d=25); // Inner hole
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, d=40); // Main plate
        for (i = [0:60:300]) { // Bolt holes
            rotate([0, 0, i]) translate([15, 0, -1]) cylinder(h=7, d=4);
        }
    }
}

module bolt() {
    union() {
        cylinder(h=30, d=3); // Bolt shaft
        translate([0, 0, 30]) cylinder(h=2, d=6); // Bolt head
    }
}

module nut() {
    cylinder(h=4, d=7); // Hexagonal nut
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input shaft hub
    input_shaft_hub();

    // Layer 2: First flange plate and nuts
    translate([0, 0, 15]) flange_plate();
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([15, 0, 15]) nut();
    }

    // Layer 3: First spacer ring and bolts
    translate([0, 0, 20]) spacer_ring();
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([15, 0, 15]) bolt();
    }

    // Layer 4: Second flange plate and nuts
    translate([0, 0, 25]) flange_plate();
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([15, 0, 25]) nut();
    }

    // Layer 5: Second spacer ring and bolts
    translate([0, 0, 30]) spacer_ring();
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([15, 0, 25]) bolt();
    }

    // Layer 6: Third flange plate and nuts
    translate([0, 0, 35]) flange_plate();
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([15, 0, 35]) nut();
    }

    // Layer 7: Third spacer ring and bolts
    translate([0, 0, 40]) spacer_ring();
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([15, 0, 35]) bolt();
    }

    // Layer 8: Fourth flange plate and nuts
    translate([0, 0, 45]) flange_plate();
    for (i = [0:60:300]) {
        rotate([0, 0, i]) translate([15, 0, 45]) nut();
    }

    // Layer 9: Output shaft hub
    translate([0, 0, 50]) output_shaft_hub();
}

// Render the flexible coupling
flexible_coupling();

