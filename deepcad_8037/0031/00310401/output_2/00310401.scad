
// Central Shaft
module central_shaft() {
    difference() {
        // Outer cylinder - Adjusted to have a uniform cylindrical shape
        cylinder(h = 60, r = 10, center = true);
        // Inner hollow
        translate([0, 0, -30])
            cylinder(h = 60, r = 5, center = true);
    }
}

// Input Shaft
module input_shaft() {
    difference() {
        // Outer cylinder - Adjusted to have a uniform cylindrical shape
        cylinder(h = 40, r = 8, center = true);
        // Inner hollow
        translate([0, 0, -20])
            cylinder(h = 40, r = 4.5, center = true);
    }
}

// Output Shaft
module output_shaft() {
    difference() {
        // Outer cylinder - Adjusted to have a uniform cylindrical shape
        cylinder(h = 50, r = 7, center = true);
        // Inner hollow
        translate([0, 0, -25])
            cylinder(h = 50, r = 3, center = true); // Added hollow center
    }
}

// Spacer Ring
module spacer_ring() {
    difference() {
        // Outer ring
        cylinder(h = 5, r = 15, center = true);
        // Inner hollow
        translate([0, 0, -2.5])
            cylinder(h = 5, r = 10, center = true);
    }
}

// Flange Plate
module flange_plate() {
    difference() {
        // Plate
        cylinder(h = 5, r = 20, center = true);
        // Central hole
        translate([0, 0, -2.5])
            cylinder(h = 5, r = 5, center = true);
        // Bolt holes
        for (i = [0:30:330]) {
            rotate([0, 0, i])
                translate([15, 0, -2.5])
                    cylinder(h = 5, r = 1.5, center = true);
        }
    }
}

// Nut
module nut() {
    difference() {
        // Outer hexagonal shape
        cylinder(h = 5, r = 6, center = true);
        // Inner threaded hollow
        translate([0, 0, -2.5])
            cylinder(h = 5, r = 3, center = true);
    }
}

// Bolt
module bolt() {
    union() {
        // Head
        cylinder(h = 5, r = 4, center = true);
        // Threaded end
        translate([0, 0, -15])
            cylinder(h = 20, r = 2, center = true);
    }
}

// Render the components
central_shaft();
input_shaft();
output_shaft();
spacer_ring();
flange_plate();
nut();
bolt();

