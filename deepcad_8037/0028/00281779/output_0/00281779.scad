
// Central Craft
module central_craft() {
    cylinder(h = 50, r = 10, $fn = 100); // A smooth cylindrical component
}

// Input Craft
module input_craft() {
    difference() {
        cylinder(h = 30, r = 10, $fn = 100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h = 32, r = 5, $fn = 100); // Hollow center
    }
}

// Output Craft
module output_craft() {
    difference() {
        cylinder(h = 30, r = 10, $fn = 100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h = 32, r = 5, $fn = 100); // Hollow center
    }
}

// Spacer Ring
module spacer_ring() {
    difference() {
        cylinder(h = 2, r = 10, $fn = 100); // Outer ring
        translate([0, 0, -1]) cylinder(h = 4, r = 8, $fn = 100); // Inner hollow
    }
}

// Flange Plate
module flange_plate() {
    difference() {
        cylinder(h = 5, r = 10, $fn = 100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h = 6, r = 8, $fn = 100); // Inner hollow
        for (i = [0:45:315]) {
            rotate([0, 0, i]) translate([7, 0, 0]) cylinder(h = 6, r = 1, $fn = 100); // Bolt holes
        }
    }
}

// Nut
module nut() {
    cylinder(h = 5, r = 2.5, $fn = 6); // Hexagonal nut
}

// Bolt
module bolt() {
    union() {
        cylinder(h = 20, r = 1.5, $fn = 100); // Threaded shaft
        translate([0, 0, 20]) cylinder(h = 2, r = 2.5, $fn = 6); // Hexagonal head
    }
}

// Assembly
module assembly() {
    central_craft();
    translate([0, 0, 50]) input_craft();
    translate([0, 0, -30]) output_craft();
    translate([0, 0, 48]) spacer_ring();
    translate([0, 0, -28]) spacer_ring();
    translate([0, 0, 46]) flange_plate();
    translate([0, 0, -26]) flange_plate();
    for (i = [0:45:315]) {
        rotate([0, 0, i]) {
            translate([7, 0, 46]) bolt();
            translate([7, 0, 66]) nut();
            translate([7, 0, -26]) bolt();
            translate([7, 0, -6]) nut();
        }
    }
}

// Render the assembly
assembly();

