```scad
// Parameters for components
module central_shaft() {
    cylinder(h = 50, r = 5, $fn = 100); // Central shaft: height 50, radius 5
}

module input_shaft() {
    difference() {
        cylinder(h = 30, r1 = 6, r2 = 5, $fn = 100); // Tapered cylinder: height 30, radius 6 to 5
        translate([0, 0, -1]) cylinder(h = 32, r = 3, $fn = 100); // Hollow center
    }
}

module output_shaft() {
    difference() {
        cylinder(h = 30, r1 = 6, r2 = 5, $fn = 100); // Tapered cylinder: height 30, radius 6 to 5
        translate([0, 0, -1]) cylinder(h = 32, r = 3, $fn = 100); // Hollow center
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 2, r = 7, $fn = 100); // Outer ring: height 2, radius 7
        cylinder(h = 3, r = 5, $fn = 100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 5, r = 10, $fn = 100); // Outer plate: height 5, radius 10
        cylinder(h = 6, r = 7, $fn = 100); // Inner hollow
        for (i = [0:45:315]) {
            rotate([0, 0, i]) translate([8, 0, -1]) cylinder(h = 7, r = 1, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 3, r = 2, $fn = 6); // Hexagonal nut: height 3, radius 2
}

module bolt() {
    union() {
        cylinder(h = 20, r = 1, $fn = 100); // Bolt shaft: height 20, radius 1
        translate([0, 0, 20]) cylinder(h = 2, r = 1.5, $fn = 6); // Bolt head: height 2, radius 1.5
    }
}

// Assembly
module flexible_coupling() {
    // Central shaft
    central_shaft();

    // Input shaft
    translate([0, 0, 50]) input_shaft();

    // Output shaft
    translate([0, 0, -30]) output_shaft();

    // Spacer rings
    translate([0, 0, 45]) spacer_ring();
    translate([0, 0, -5]) spacer_ring();

    // Flange plates
    translate([0, 0, 40]) flange_plate();
    translate([0, 0, -10]) flange_plate();
    translate([0, 0, 35]) flange_plate();
    translate([0, 0, -15]) flange_plate();

    // Bolts and nuts
    for (i = [0:45:315]) {
        rotate([0, 0, i]) {
            translate([8, 0, 40]) bolt();
            translate([8, 0, -10]) bolt();
            translate([8, 0, 60]) nut();
            translate([8, 0, -30]) nut();
        }
    }
}

// Render the flexible coupling
flexible_coupling();
```

