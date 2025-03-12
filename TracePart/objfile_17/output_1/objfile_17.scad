
// Parameters for components
module input_shaft_hub() {
    difference() {
        cylinder(h=20, d=30); // Main cylindrical hub
        translate([0, 0, -1]) cylinder(h=22, d=10); // Central hole
        for (i = [0:60:300]) { // Adjusted bolt hole positions to match original model
            rotate([0, 0, i]) translate([12, 0, 10]) cylinder(h=10, d=4); // Bolt holes
        }
    }
}

module output_shaft_hub() {
    difference() {
        cylinder(h=20, d=35); // Widened cylindrical hub
        translate([0, 0, -1]) cylinder(h=22, d=10); // Central hole
        for (i = [0:60:300]) { // Added bolt holes to match original model
            rotate([0, 0, i]) translate([15, 0, 10]) cylinder(h=10, d=4); // Bolt holes
        }
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=7, d=30); // Adjusted thickness of outer ring
        translate([0, 0, -1]) cylinder(h=9, d=20); // Inner hole
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, d=30); // Main plate
        for (i = [0:60:300]) { // Adjusted bolt hole positions to match original model
            rotate([0, 0, i]) translate([12, 0, -1]) cylinder(h=7, d=4); // Bolt holes
        }
    }
}

module bolt() {
    union() {
        cylinder(h=25, d=3); // Bolt shaft
        translate([0, 0, 25]) cylinder(h=2, d=5); // Bolt head
    }
}

module nut() {
    cylinder(h=3, d=6); // Hexagonal nut
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input shaft hub
    input_shaft_hub();

    // Layer 2: First flange plate and nuts
    translate([0, 0, 20]) flange_plate();
    for (i = [0:60:300]) { // Adjusted nut positions to match bolt holes
        rotate([0, 0, i]) translate([12, 0, 20]) nut();
    }

    // Layer 3: First spacer ring and bolts
    translate([0, 0, 25]) spacer_ring();
    for (i = [0:60:300]) { // Adjusted bolt positions to match bolt holes
        rotate([0, 0, i]) translate([12, 0, 20]) bolt();
    }

    // Layer 4: Second flange plate and nuts
    translate([0, 0, 32]) flange_plate(); // Adjusted positioning for proper alignment
    for (i = [0:60:300]) { // Adjusted nut positions to match bolt holes
        rotate([0, 0, i]) translate([12, 0, 32]) nut();
    }

    // Layer 5: Second spacer ring and bolts
    translate([0, 0, 37]) spacer_ring(); // Adjusted positioning for proper alignment
    for (i = [0:60:300]) { // Adjusted bolt positions to match bolt holes
        rotate([0, 0, i]) translate([12, 0, 32]) bolt();
    }

    // Layer 6: Third flange plate and nuts
    translate([0, 0, 44]) flange_plate(); // Adjusted positioning for proper alignment
    for (i = [0:60:300]) { // Adjusted nut positions to match bolt holes
        rotate([0, 0, i]) translate([12, 0, 44]) nut();
    }

    // Layer 7: Third spacer ring and bolts
    translate([0, 0, 49]) spacer_ring(); // Adjusted positioning for proper alignment
    for (i = [0:60:300]) { // Adjusted bolt positions to match bolt holes
        rotate([0, 0, i]) translate([12, 0, 44]) bolt();
    }

    // Layer 8: Fourth flange plate and nuts
    translate([0, 0, 56]) flange_plate(); // Adjusted positioning for proper alignment
    for (i = [0:60:300]) { // Adjusted nut positions to match bolt holes
        rotate([0, 0, i]) translate([12, 0, 56]) nut();
    }

    // Layer 9: Output shaft hub
    translate([0, 0, 63]) output_shaft_hub(); // Adjusted positioning for proper alignment
}

// Render the flexible coupling
flexible_coupling();

