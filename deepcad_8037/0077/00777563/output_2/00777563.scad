
// Parameters for components
module central_hub() {
    difference() {
        cylinder(h=20, r=8.5, $fn=100); // Main hub (reduced diameter to match original)
        translate([0, 0, -2]) cylinder(h=24, r=5.5, $fn=100); // Central bore (unchanged)
    }
}

module input_shaft() {
    difference() {
        cylinder(h=30, r=4.5, $fn=100); // Shaft body (shortened to match original)
        translate([0, 0, -1]) cylinder(h=32, r=2.5, $fn=100); // Hollow center (adjusted length)
    }
}

module output_shaft() {
    difference() {
        cylinder(h=35, r=4.5, $fn=100); // Shaft body (unchanged)
        translate([0, 0, -1]) cylinder(h=37, r=2.5, $fn=100); // Hollow center (unchanged)
        translate([0, 0, 34]) cylinder(h=1, r1=4.5, r2=2.5, $fn=100); // Tapering at the end (added to match original)
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=1, r=9, $fn=100); // Outer ring (reduced thickness to match original)
        translate([0, 0, -1]) cylinder(h=2, r=7.5, $fn=100); // Inner hollow (adjusted thickness)
    }
}

module flange_plate() {
    difference() {
        cylinder(h=4, r=10, $fn=100); // Plate body (unchanged)
        translate([0, 0, -1]) cylinder(h=6, r=8, $fn=100); // Hollow center (unchanged)
        for (angle = [0:30:330]) { // Increased number of bolt holes to match original
            translate([7*cos(angle), 7*sin(angle), -1]) cylinder(h=6, r=1, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=2.5, r=1.3, $fn=6); // Hexagonal nut (reduced size to match original)
}

module bolt() {
    union() {
        cylinder(h=20, r=0.8, $fn=100); // Bolt body (shortened to match original)
        translate([0, 0, 20]) cylinder(h=2, r=1.2, $fn=100); // Bolt head (unchanged)
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input Shaft
    translate([0, 0, 80]) input_shaft();

    // Layer 2: First Flange Plate with Nuts
    translate([0, 0, 76]) flange_plate();
    for (angle = [0:30:330]) {
        translate([7*cos(angle), 7*sin(angle), 79]) nut();
    }

    // Layer 3: First Spacer Ring with Bolts
    translate([0, 0, 72]) spacer_ring();
    for (angle = [0:30:330]) {
        translate([7*cos(angle), 7*sin(angle), 72]) bolt();
    }

    // Layer 4: Second Flange Plate with Nuts
    translate([0, 0, 68]) flange_plate();
    for (angle = [0:30:330]) {
        translate([7*cos(angle), 7*sin(angle), 71]) nut();
    }

    // Layer 5: Central Hub
    translate([0, 0, 54]) central_hub();

    // Layer 6: Third Flange Plate with Nuts
    translate([0, 0, 40]) flange_plate();
    for (angle = [0:30:330]) {
        translate([7*cos(angle), 7*sin(angle), 43]) nut();
    }

    // Layer 7: Second Spacer Ring with Bolts
    translate([0, 0, 36]) spacer_ring();
    for (angle = [0:30:330]) {
        translate([7*cos(angle), 7*sin(angle), 36]) bolt();
    }

    // Layer 8: Fourth Flange Plate with Nuts
    translate([0, 0, 32]) flange_plate();
    for (angle = [0:30:330]) {
        translate([7*cos(angle), 7*sin(angle), 35]) nut();
    }

    // Layer 9: Output Shaft
    translate([0, 0, 0]) output_shaft();
}

// Render the full assembly
flexible_coupling();

