
// Central Hub Component
module central_hub() {
    difference() {
        // Outer cylinder
        cylinder(h = 20, r1 = 15, r2 = 15, $fn = 100);
        // Inner hollow cylinder
        translate([0, 0, -1]) cylinder(h = 22, r = 10, $fn = 100);
        // Flared base (adjusted to match the original model)
        translate([0, 0, -1]) cylinder(h = 2, r1 = 15, r2 = 17, $fn = 100);
    }
}

// Input Hub Component
module input_hub() {
    difference() {
        // Outer cylinder with increased height
        cylinder(h = 25, r1 = 12, r2 = 12, $fn = 100);
        // Inner hollow cylinder
        translate([0, 0, -1]) cylinder(h = 27, r = 8, $fn = 100);
    }
}

// Output Hub Component
module output_hub() {
    difference() {
        // Outer cylinder with slight taper
        cylinder(h = 20, r1 = 12, r2 = 10, $fn = 100);
        // Inner hollow cylinder
        translate([0, 0, -1]) cylinder(h = 22, r = 8, $fn = 100);
    }
}

// Spacer Ring Component
module spacer_ring() {
    difference() {
        // Flat, thin ring
        cylinder(h = 2, r1 = 15, r2 = 20, $fn = 100);
        translate([0, 0, -1]) cylinder(h = 3, r = 10, $fn = 100);
    }
}

// Flange Plate Component
module flange_plate() {
    difference() {
        // Flat hollow cylindrical plate
        cylinder(h = 3, r1 = 20, r2 = 25, $fn = 100);
        // Bolt holes
        for (i = [0:5]) {
            rotate([0, 0, i * 60]) translate([22, 0, 0]) cylinder(h = 4, r = 1.5, $fn = 100);
        }
    }
}

// Nut Component
module nut() {
    difference() {
        // Hexagonal shape
        rotate([0, 0, 30]) linear_extrude(height = 5) polygon(points = [[-3, -5], [3, -5], [6, 0], [3, 5], [-3, 5], [-6, 0]]);
        // Threaded inner surface
        translate([0, 0, -1]) cylinder(h = 6, r = 2, $fn = 100);
    }
}

// Bolt Component
module bolt() {
    union() {
        // Slender cylindrical body
        cylinder(h = 20, r = 2, $fn = 100);
        // Threaded end
        translate([0, 0, -2]) cylinder(h = 4, r = 2, $fn = 100);
    }
}

// Render the components
central_hub();
translate([30, 0, 0]) input_hub();
translate([60, 0, 0]) output_hub();
translate([90, 0, 0]) spacer_ring();
translate([120, 0, 0]) flange_plate();
translate([150, 0, 0]) nut();
translate([180, 0, 0]) bolt();

