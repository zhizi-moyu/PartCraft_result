
// Parameters for components
module central_craft() {
    difference() {
        cylinder(h = 20, r = 10, $fn = 100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h = 22, r = 5, $fn = 100); // Central hole
    }
}

module input_craft() {
    difference() {
        cylinder(h = 15, r1 = 10, r2 = 8, $fn = 100); // Tapered cylinder
        translate([0, 0, -1]) cylinder(h = 17, r = 5, $fn = 100); // Central hole
    }
}

module output_craft() {
    difference() {
        cylinder(h = 15, r1 = 8, r2 = 10, $fn = 100); // Tapered cylinder
        translate([0, 0, -1]) cylinder(h = 17, r = 5, $fn = 100); // Central hole
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 2, r = 10, $fn = 100); // Outer ring
        translate([0, 0, -1]) cylinder(h = 4, r = 8, $fn = 100); // Inner hole
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 3, r = 12, $fn = 100); // Outer flange
        translate([0, 0, -1]) cylinder(h = 5, r = 8, $fn = 100); // Central hole
        for (angle = [0, 90, 180, 270]) {
            rotate([0, 0, angle]) translate([9, 0, -1]) cylinder(h = 5, r = 1, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 3, r = 2, $fn = 6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h = 10, r = 1, $fn = 100); // Bolt shaft
        translate([0, 0, 10]) cylinder(h = 2, r = 2, $fn = 100); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    translate([0, 0, 0]) input_craft(); // Layer 1

    translate([0, 0, -15]) flange_plate(); // Layer 2
    for (angle = [0, 90, 180, 270]) {
        rotate([0, 0, angle]) translate([9, 0, -15]) nut();
    }

    translate([0, 0, -18]) spacer_ring(); // Layer 3
    for (angle = [0, 90, 180, 270]) {
        rotate([0, 0, angle]) translate([9, 0, -18]) bolt();
    }

    translate([0, 0, -20]) flange_plate(); // Layer 4
    for (angle = [0, 90, 180, 270]) {
        rotate([0, 0, angle]) translate([9, 0, -20]) nut();
    }

    translate([0, 0, -23]) central_craft(); // Layer 5

    translate([0, 0, -43]) flange_plate(); // Layer 6
    for (angle = [0, 90, 180, 270]) {
        rotate([0, 0, angle]) translate([9, 0, -43]) nut();
    }

    translate([0, 0, -46]) spacer_ring(); // Layer 7
    for (angle = [0, 90, 180, 270]) {
        rotate([0, 0, angle]) translate([9, 0, -46]) bolt();
    }

    translate([0, 0, -48]) flange_plate(); // Layer 8
    for (angle = [0, 90, 180, 270]) {
        rotate([0, 0, angle]) translate([9, 0, -48]) nut();
    }

    translate([0, 0, -51]) output_craft(); // Layer 9
}

// Render the full assembly
flexible_coupling();

