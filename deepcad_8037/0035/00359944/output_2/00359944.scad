// Parameters for components
module central_craft() {
    difference() {
        cylinder(h = 25, r = 9, $fn = 100); // Outer cylinder (reduced diameter)
        translate([0, 0, -1]) cylinder(h = 27, r = 6, $fn = 100); // Central hole (more distinct)
    }
}

module input_craft() {
    difference() {
        cylinder(h = 18, r1 = 10, r2 = 9.5, $fn = 100); // Tapered cylinder (reduced taper and increased length)
        translate([0, 0, -1]) cylinder(h = 19, r = 5, $fn = 100); // Central hole
    }
}

module output_craft() {
    difference() {
        cylinder(h = 22, r1 = 9.5, r2 = 10, $fn = 100); // Tapered cylinder (adjusted taper and improved symmetry)
        translate([0, 0, -1]) cylinder(h = 24, r = 5, $fn = 100); // Central hole
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 1, r = 10, $fn = 100); // Outer ring (reduced thickness)
        translate([0, 0, -1]) cylinder(h = 2, r = 8, $fn = 100); // Inner hole
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 2.5, r = 12, $fn = 100); // Outer flange (reduced thickness)
        translate([0, 0, -1]) cylinder(h = 5, r = 8, $fn = 100); // Central hole
        for (angle = [0, 45, 90, 135, 180, 225, 270, 315]) { // Increased number of bolt holes
            rotate([0, 0, angle]) translate([9, 0, -1]) cylinder(h = 5, r = 1, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 2.5, r = 1.5, $fn = 6); // Hexagonal nut (reduced size and more precise shape)
}

module bolt() {
    union() {
        cylinder(h = 18, r = 1, $fn = 100); // Bolt shaft (lengthened threaded shaft)
        translate([0, 0, 18]) cylinder(h = 2.5, r = 2, $fn = 100); // Bolt head (more defined flat head)
    }
}

// Assembly
module flexible_coupling() {
    translate([0, 0, 0]) input_craft(); // Layer 1

    translate([0, 0, -18]) flange_plate(); // Layer 2
    for (angle = [0, 45, 90, 135, 180, 225, 270, 315]) {
        rotate([0, 0, angle]) translate([9, 0, -18]) nut();
    }

    translate([0, 0, -20.5]) spacer_ring(); // Layer 3
    for (angle = [0, 45, 90, 135, 180, 225, 270, 315]) {
        rotate([0, 0, angle]) translate([9, 0, -20.5]) bolt();
    }

    translate([0, 0, -22.5]) flange_plate(); // Layer 4
    for (angle = [0, 45, 90, 135, 180, 225, 270, 315]) {
        rotate([0, 0, angle]) translate([9, 0, -22.5]) nut();
    }

    translate([0, 0, -25]) central_craft(); // Layer 5

    translate([0, 0, -50]) flange_plate(); // Layer 6
    for (angle = [0, 45, 90, 135, 180, 225, 270, 315]) {
        rotate([0, 0, angle]) translate([9, 0, -50]) nut();
    }

    translate([0, 0, -52.5]) spacer_ring(); // Layer 7
    for (angle = [0, 45, 90, 135, 180, 225, 270, 315]) {
        rotate([0, 0, angle]) translate([9, 0, -52.5]) bolt();
    }

    translate([0, 0, -54.5]) flange_plate(); // Layer 8
    for (angle = [0, 45, 90, 135, 180, 225, 270, 315]) {
        rotate([0, 0, angle]) translate([9, 0, -54.5]) nut();
    }

    translate([0, 0, -57]) output_craft(); // Layer 9
}

// Render the full assembly
flexible_coupling();
