
// Parameters for components
module central_craft() {
    difference() {
        cylinder(h = 25, r = 10, $fn = 100); // Outer cylinder (increased height)
        translate([0, 0, -1]) cylinder(h = 27, r = 5, $fn = 100); // Central hole
    }
}

module input_craft() {
    difference() {
        cylinder(h = 15, r1 = 10, r2 = 9, $fn = 100); // Tapered cylinder (reduced taper)
        translate([0, 0, -1]) cylinder(h = 17, r = 5, $fn = 100); // Central hole
    }
}

module output_craft() {
    difference() {
        cylinder(h = 20, r1 = 9, r2 = 10, $fn = 100); // Tapered cylinder (adjusted taper and increased height)
        translate([0, 0, -1]) cylinder(h = 22, r = 5, $fn = 100); // Central hole
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 1.5, r = 10, $fn = 100); // Outer ring (reduced thickness)
        translate([0, 0, -1]) cylinder(h = 3, r = 8, $fn = 100); // Inner hole
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 3, r = 12, $fn = 100); // Outer flange
        translate([0, 0, -1]) cylinder(h = 5, r = 8, $fn = 100); // Central hole
        for (angle = [0, 60, 120, 180, 240, 300]) { // Added more bolt holes
            rotate([0, 0, angle]) translate([9, 0, -1]) cylinder(h = 5, r = 1, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 3, r = 1.8, $fn = 6); // Hexagonal nut (reduced size)
}

module bolt() {
    union() {
        cylinder(h = 15, r = 1, $fn = 100); // Bolt shaft (increased length)
        translate([0, 0, 15]) cylinder(h = 2, r = 2, $fn = 100); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    translate([0, 0, 0]) input_craft(); // Layer 1

    translate([0, 0, -15]) flange_plate(); // Layer 2
    for (angle = [0, 60, 120, 180, 240, 300]) {
        rotate([0, 0, angle]) translate([9, 0, -15]) nut();
    }

    translate([0, 0, -18]) spacer_ring(); // Layer 3
    for (angle = [0, 60, 120, 180, 240, 300]) {
        rotate([0, 0, angle]) translate([9, 0, -18]) bolt();
    }

    translate([0, 0, -20]) flange_plate(); // Layer 4
    for (angle = [0, 60, 120, 180, 240, 300]) {
        rotate([0, 0, angle]) translate([9, 0, -20]) nut();
    }

    translate([0, 0, -23]) central_craft(); // Layer 5

    translate([0, 0, -48]) flange_plate(); // Layer 6
    for (angle = [0, 60, 120, 180, 240, 300]) {
        rotate([0, 0, angle]) translate([9, 0, -48]) nut();
    }

    translate([0, 0, -51]) spacer_ring(); // Layer 7
    for (angle = [0, 60, 120, 180, 240, 300]) {
        rotate([0, 0, angle]) translate([9, 0, -51]) bolt();
    }

    translate([0, 0, -53]) flange_plate(); // Layer 8
    for (angle = [0, 60, 120, 180, 240, 300]) {
        rotate([0, 0, angle]) translate([9, 0, -53]) nut();
    }

    translate([0, 0, -56]) output_craft(); // Layer 9
}

// Render the full assembly
flexible_coupling();

