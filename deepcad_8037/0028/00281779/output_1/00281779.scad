
// Central Craft
module central_craft() {
    cylinder(h = 60, r = 10, $fn = 200); // Increased length and smoother surface
}

// Input Craft
module input_craft() {
    difference() {
        cylinder(h = 35, r = 12, $fn = 200); // Adjusted diameter and length
        translate([0, 0, -1]) cylinder(h = 37, r = 6, $fn = 200); // Enhanced hollow center
    }
}

// Output Craft
module output_craft() {
    difference() {
        cylinder(h = 35, r = 12, $fn = 200); // Adjusted diameter and length
        translate([0, 0, -1]) cylinder(h = 37, r = 6, $fn = 200); // Enhanced hollow center
    }
}

// Spacer Ring
module spacer_ring() {
    difference() {
        cylinder(h = 1.5, r = 10, $fn = 200); // Reduced thickness and smoother surface
        translate([0, 0, -1]) cylinder(h = 3, r = 8, $fn = 200); // Adjusted inner hollow
    }
}

// Flange Plate
module flange_plate() {
    difference() {
        cylinder(h = 4, r = 10, $fn = 200); // Reduced thickness
        translate([0, 0, -1]) cylinder(h = 5, r = 8, $fn = 200); // Adjusted inner hollow
        for (i = [0:30:330]) { // Increased number of bolt holes
            rotate([0, 0, i]) translate([7, 0, 0]) cylinder(h = 5, r = 1, $fn = 200); // Evenly distributed bolt holes
        }
    }
}

// Nut
module nut() {
    cylinder(h = 4, r = 2, $fn = 6); // Reduced size and enhanced definition
}

// Bolt
module bolt() {
    union() {
        cylinder(h = 25, r = 1.5, $fn = 200); // Increased length and refined threading
        translate([0, 0, 25]) cylinder(h = 2, r = 2.5, $fn = 6); // Hexagonal head
    }
}

// Assembly
module assembly() {
    central_craft();
    translate([0, 0, 60]) input_craft();
    translate([0, 0, -35]) output_craft();
    translate([0, 0, 58]) spacer_ring();
    translate([0, 0, -33]) spacer_ring();
    translate([0, 0, 56]) flange_plate();
    translate([0, 0, -31]) flange_plate();
    for (i = [0:30:330]) {
        rotate([0, 0, i]) {
            translate([7, 0, 56]) bolt();
            translate([7, 0, 81]) nut();
            translate([7, 0, -31]) bolt();
            translate([7, 0, -6]) nut();
        }
    }
}

// Render the assembly
assembly();

