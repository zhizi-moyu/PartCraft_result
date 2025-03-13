
// Parameters for components
module central_shaft() {
    difference() {
        cylinder(h = 40, d1 = 20, d2 = 25, $fn = 100); // Tapered cylinder
        translate([0, 0, 0])
            cylinder(h = 40, d = 10, $fn = 100); // Hollow center
    }
}

module input_shaft() {
    difference() {
        cylinder(h = 30, d1 = 20, d2 = 15, $fn = 100); // Tapered cylinder
        translate([0, 0, 0])
            cylinder(h = 30, d = 10, $fn = 100); // Hollow center
    }
}

module output_shaft() {
    difference() {
        cylinder(h = 30, d1 = 20, d2 = 15, $fn = 100); // Tapered cylinder
        translate([0, 0, 0])
            cylinder(h = 30, d = 10, $fn = 100); // Hollow center
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 5, d = 20, $fn = 100); // Outer ring
        translate([0, 0, 0])
            cylinder(h = 5, d = 15, $fn = 100); // Hollow center
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 5, d = 25, $fn = 100); // Outer plate
        translate([0, 0, 0])
            cylinder(h = 5, d = 15, $fn = 100); // Hollow center
        for (i = [0:45:360]) {
            rotate([0, 0, i])
                translate([10, 0, 0])
                    cylinder(h = 5, d = 2, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 5, d = 5, $fn = 6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h = 20, d = 2, $fn = 100); // Bolt shaft
        translate([0, 0, 20])
            cylinder(h = 5, d = 5, $fn = 6); // Hexagonal head
    }
}

// Assembly
module flexible_coupling() {
    union() {
        translate([0, 0, 0])
            central_shaft();
        translate([0, 0, 40])
            input_shaft();
        translate([0, 0, -30])
            output_shaft();
        translate([0, 0, 35])
            spacer_ring();
        translate([0, 0, -5])
            spacer_ring();
        translate([0, 0, 30])
            flange_plate();
        translate([0, 0, -10])
            flange_plate();
        for (i = [0:45:360]) {
            rotate([0, 0, i])
                translate([10, 0, 30])
                    bolt();
            rotate([0, 0, i])
                translate([10, 0, -10])
                    bolt();
        }
        for (i = [0:45:360]) {
            rotate([0, 0, i])
                translate([10, 0, 35])
                    nut();
            rotate([0, 0, i])
                translate([10, 0, -5])
                    nut();
        }
    }
}

// Render the model
flexible_coupling();

