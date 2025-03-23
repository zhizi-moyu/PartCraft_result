
// Parameters for components
module central_shaft() {
    cylinder(h = 70, r = 10, $fn = 100); // Central shaft dimensions (elongated to match original model)
}

module input_shaft() {
    difference() {
        cylinder(h = 40, r = 14, $fn = 100); // Input shaft dimensions (increased diameter to match original model)
        translate([0, 0, -1]) cylinder(h = 42, r = 5, $fn = 100); // Hollow center
    }
}

module output_shaft() {
    difference() {
        cylinder(h = 40, r = 14, $fn = 100); // Output shaft dimensions (increased diameter to match original model)
        translate([0, 0, -1]) cylinder(h = 42, r = 5, $fn = 100); // Hollow center
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 5, r = 15, $fn = 100); // Spacer ring dimensions (increased thickness to match original model)
        cylinder(h = 6, r = 10, $fn = 100); // Hollow center
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 5, r = 20, $fn = 100); // Flange plate dimensions
        cylinder(h = 6, r = 10, $fn = 100); // Hollow center
        for (i = [0:15]) { // Increased number of bolt holes to match original model
            rotate([0, 0, i * 22.5]) translate([15, 0, 0]) cylinder(h = 6, r = 2, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 3, r = 2, $fn = 6); // Nut dimensions (reduced size to match original model)
}

module bolt() {
    union() {
        cylinder(h = 40, r = 2, $fn = 100); // Bolt shaft (elongated to match original model)
        translate([0, 0, 40]) cylinder(h = 5, r = 3, $fn = 6); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    union() {
        translate([0, 0, 0]) central_shaft();
        translate([0, 0, -45]) input_shaft();
        translate([0, 0, 45]) output_shaft();
        translate([0, 0, -25]) spacer_ring();
        translate([0, 0, 25]) spacer_ring();
        translate([0, 0, -30]) flange_plate();
        translate([0, 0, 30]) flange_plate();
        for (i = [0:15]) { // Adjusted for increased bolt holes
            rotate([0, 0, i * 22.5]) translate([15, 0, -30]) bolt();
            rotate([0, 0, i * 22.5]) translate([15, 0, 30]) bolt();
        }
        for (i = [0:15]) { // Adjusted for increased bolt holes
            rotate([0, 0, i * 22.5]) translate([15, 0, -35]) nut();
            rotate([0, 0, i * 22.5]) translate([15, 0, 35]) nut();
        }
    }
}

// Render the flexible coupling
flexible_coupling();

