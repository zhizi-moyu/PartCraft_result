// Define parameters for components
module central_cylinder() {
    difference() {
        cylinder(h=60, r=10, $fn=100); // Outer cylinder (increased height to match original model)
        translate([0, 0, -1]) cylinder(h=62, r=8, $fn=100); // Hollow interior
    }
}

module input_cylinder() {
    difference() {
        cylinder(h=30, r=12, $fn=100); // Outer cylinder (adjusted height and diameter to match original model)
        translate([0, 0, -1]) cylinder(h=32, r=10, $fn=100); // Hollow interior
    }
}

module output_cylinder() {
    difference() {
        cylinder(h=30, r=12, $fn=100); // Outer cylinder (adjusted height and diameter to match original model)
        translate([0, 0, -1]) cylinder(h=32, r=10, $fn=100); // Hollow interior
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=5, r=10, $fn=100); // Outer ring (adjusted height to ensure visibility)
        translate([0, 0, -1]) cylinder(h=6, r=8, $fn=100); // Hollow interior
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=10, $fn=100); // Outer plate
        translate([0, 0, -1]) cylinder(h=6, r=8, $fn=100); // Hollow interior
        for (i = [0:7]) { // Increased number of bolt holes to 8
            rotate([0, 0, i * 45]) translate([7, 0, 0]) cylinder(h=6, r=1, $fn=100); // Bolt holes
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

    translate([0, 0, -30]) flange_plate(); // Layer 2
    for (i = [0:7]) { // Adjusted for 8 bolt holes
        rotate([0, 0, i * 45]) translate([7, 0, -30]) nut();
    }

    translate([0, 0, -35]) spacer_ring(); // Layer 3
    for (i = [0:7]) { // Adjusted for 8 bolt holes
        rotate([0, 0, i * 45]) translate([7, 0, -35]) bolt();
    }

    translate([0, 0, -40]) flange_plate(); // Layer 4
    for (i = [0:7]) { // Adjusted for 8 bolt holes
        rotate([0, 0, i * 45]) translate([7, 0, -40]) nut();
    }

    translate([0, 0, -45]) central_cylinder(); // Layer 5

    translate([0, 0, -105]) flange_plate(); // Layer 6
    for (i = [0:7]) { // Adjusted for 8 bolt holes
        rotate([0, 0, i * 45]) translate([7, 0, -105]) nut();
    }

    translate([0, 0, -110]) spacer_ring(); // Layer 7
    for (i = [0:7]) { // Adjusted for 8 bolt holes
        rotate([0, 0, i * 45]) translate([7, 0, -110]) bolt();
    }

    translate([0, 0, -115]) flange_plate(); // Layer 8
    for (i = [0:7]) { // Adjusted for 8 bolt holes
        rotate([0, 0, i * 45]) translate([7, 0, -115]) nut();
    }

    translate([0, 0, -120]) output_cylinder(); // Layer 9
}

// Render the model
flexible_coupling();
