
// Define parameters for components
module central_cylinder() {
    difference() {
        cylinder(h=50, r=10, $fn=100); // Outer cylinder (increased height to match original model)
        translate([0, 0, -1]) cylinder(h=52, r=8, $fn=100); // Hollow interior
    }
}

module input_cylinder() {
    difference() {
        cylinder(h=25, r=10, $fn=100); // Outer cylinder (increased height to match original model)
        translate([0, 0, -1]) cylinder(h=27, r=8, $fn=100); // Hollow interior
    }
}

module output_cylinder() {
    difference() {
        cylinder(h=25, r=10, $fn=100); // Outer cylinder (increased height to match original model)
        translate([0, 0, -1]) cylinder(h=27, r=8, $fn=100); // Hollow interior
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=3, r=10, $fn=100); // Outer ring (adjusted height to ensure visibility)
        cylinder(h=4, r=8, $fn=100); // Hollow interior
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=10, $fn=100); // Outer plate
        cylinder(h=6, r=8, $fn=100); // Hollow interior
        for (i = [0:5]) { // Increased number of bolt holes to 6
            rotate([0, 0, i * 60]) translate([7, 0, 0]) cylinder(h=6, r=1, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=3, r=2, $fn=6); // Hexagonal nut
}

module bolt() {
    cylinder(h=20, r=1, $fn=100); // Bolt
}

// Assemble the flexible coupling
module flexible_coupling() {
    translate([0, 0, 0]) input_cylinder(); // Layer 1

    translate([0, 0, -25]) flange_plate(); // Layer 2
    for (i = [0:5]) { // Adjusted for 6 bolt holes
        rotate([0, 0, i * 60]) translate([7, 0, -25]) nut();
    }

    translate([0, 0, -30]) spacer_ring(); // Layer 3
    for (i = [0:5]) { // Adjusted for 6 bolt holes
        rotate([0, 0, i * 60]) translate([7, 0, -30]) bolt();
    }

    translate([0, 0, -33]) flange_plate(); // Layer 4
    for (i = [0:5]) { // Adjusted for 6 bolt holes
        rotate([0, 0, i * 60]) translate([7, 0, -33]) nut();
    }

    translate([0, 0, -38]) central_cylinder(); // Layer 5

    translate([0, 0, -88]) flange_plate(); // Layer 6
    for (i = [0:5]) { // Adjusted for 6 bolt holes
        rotate([0, 0, i * 60]) translate([7, 0, -88]) nut();
    }

    translate([0, 0, -93]) spacer_ring(); // Layer 7
    for (i = [0:5]) { // Adjusted for 6 bolt holes
        rotate([0, 0, i * 60]) translate([7, 0, -93]) bolt();
    }

    translate([0, 0, -96]) flange_plate(); // Layer 8
    for (i = [0:5]) { // Adjusted for 6 bolt holes
        rotate([0, 0, i * 60]) translate([7, 0, -96]) nut();
    }

    translate([0, 0, -101]) output_cylinder(); // Layer 9
}

// Render the model
flexible_coupling();

