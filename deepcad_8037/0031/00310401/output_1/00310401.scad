
// Central Shaft
module central_shaft() {
    difference() {
        // Outer cylinder - Adjusted height to match original model
        cylinder(h = 60, r = 10, center = true); // Increased height from 50 to 60
        // Inner hollow
        translate([0, 0, -30]) // Adjusted translation to match new height
            cylinder(h = 60, r = 5, center = true);
    }
}

// Input Shaft
module input_shaft() {
    difference() {
        // Outer cylinder
        cylinder(h = 40, r = 8, center = true);
        // Inner hollow - Widened to match original model
        translate([0, 0, -20])
            cylinder(h = 40, r = 4.5, center = true); // Increased radius from 4 to 4.5
    }
}

// Output Shaft
module output_shaft() {
    // Uniform cylindrical shape to match original model
    cylinder(h = 50, r = 7, center = true); // Removed tapering
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
    scale([1, 1, 0.8]) // Reduced thickness to match original model
        children();
}

// Flange Plate
module flange_plate() {
    difference() {
        // Plate
        cylinder(h = 5, r = 20, center = true);
        // Central hole
        translate([0, 0, -2.5])
            cylinder(h = 5, r = 5, center = true);
        // Bolt holes - Added more holes to match original model
        for (i = [0:30:330]) {
            rotate([0, 0, i])
                translate([15, 0, -2.5])
                    cylinder(h = 5, r = 1.5, center = true);
        }
    }
}

// Nut
module nut() {
    scale([0.9, 0.9, 0.9]) // Reduced size to match original model
        cylinder(h = 5, r = 6, center = true);
}

// Bolt
module bolt() {
    union() {
        // Head
        cylinder(h = 5, r = 4, center = true);
        // Threaded end - Lengthened to match original model
        translate([0, 0, -15])
            cylinder(h = 20, r = 2, center = true); // Increased height from 15 to 20
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

