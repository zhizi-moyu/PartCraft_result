
// Central Craft
module central_craft() {
    cylinder(h = 65, r = 10, $fn = 200); // Increased length to match original model
}

// Input Craft
module input_craft() {
    difference() {
        cylinder(h = 35, r = 12, $fn = 200); // Adjusted diameter and length
        translate([0, 0, -1]) cylinder(h = 37, r = 8, $fn = 200); // Increased hollow center diameter
    }
}

// Output Craft
module output_craft() {
    difference() {
        cylinder(h = 35, r = 12, $fn = 200); // Adjusted diameter and length
        translate([0, 0, -1]) cylinder(h = 37, r = 8, $fn = 200); // Increased hollow center diameter
    }
}

// Spacer Ring
module spacer_ring() {
    difference() {
        cylinder(h = 1, r = 10, $fn = 200); // Reduced thickness to match original model
        translate([0, 0, -1]) cylinder(h = 2, r = 8, $fn = 200); // Adjusted inner hollow
    }
}

// Flange Plate
module flange_plate() {
    difference() {
        cylinder(h = 4, r = 10, $fn = 200); // Reduced thickness
        translate([0, 0, -1]) cylinder(h = 5, r = 8, $fn = 200); // Adjusted inner hollow
        for (i = [0:15:345]) { // Increased number of bolt holes to match original model
            rotate([0, 0, i]) translate([7, 0, 0]) cylinder(h = 5, r = 1, $fn = 200); // Evenly distributed bolt holes
        }
    }
}

// Nut
module nut() {
    cylinder(h = 3, r = 1.5, $fn = 6); // Reduced size to match original model
}

// Bolt
module bolt() {
    union() {
        cylinder(h = 30, r = 1.5, $fn = 200); // Increased length to match original model
        translate([0, 0, 30]) cylinder(h = 2, r = 2.5, $fn = 6); // Hexagonal head
    }
}

// Assembly
module assembly() {
    central_craft();
    translate([0, 0, 65]) input_craft();
    translate([0, 0, -35]) output_craft();
    translate([0, 0, 63]) spacer_ring();
    translate([0, 0, -33]) spacer_ring();
    translate([0, 0, 61]) flange_plate();
    translate([0, 0, -31]) flange_plate();
    for (i = [0:15:345]) {
        rotate([0, 0, i]) {
            translate([7, 0, 61]) bolt();
            translate([7, 0, 91]) nut();
            translate([7, 0, -31]) bolt();
            translate([7, 0, -1]) nut();
        }
    }
}

// Render the assembly
assembly();

