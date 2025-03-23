// Parameters for components
module central_hub() {
    difference() {
        cylinder(h=20, r=9, $fn=100); // Main hub (reduced diameter)
        translate([0, 0, -2]) cylinder(h=24, r=5.5, $fn=100); // Central bore (deepened)
    }
}

module input_shaft() {
    difference() {
        cylinder(h=35, r=4.5, $fn=100); // Shaft body (elongated and reduced diameter)
        translate([0, 0, -1]) cylinder(h=37, r=2.5, $fn=100); // Hollow center
    }
}

module output_shaft() {
    difference() {
        cylinder(h=35, r=4.5, $fn=100); // Shaft body (adjusted alignment and reduced diameter)
        translate([0, 0, -1]) cylinder(h=37, r=2.5, $fn=100); // Hollow center
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=1.5, r=9, $fn=100); // Outer ring (reduced thickness and diameter)
        translate([0, 0, -1]) cylinder(h=3, r=7.5, $fn=100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h=4, r=10, $fn=100); // Plate body (reduced thickness)
        translate([0, 0, -1]) cylinder(h=6, r=8, $fn=100); // Hollow center
        for (angle = [0:45:315]) { // Increased number of bolt holes
            translate([7*cos(angle), 7*sin(angle), -1]) cylinder(h=6, r=1, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=2.5, r=1.5, $fn=6); // Hexagonal nut (reduced size and ensured hexagonal shape)
}

module bolt() {
    union() {
        cylinder(h=25, r=0.8, $fn=100); // Bolt body (elongated and reduced diameter)
        translate([0, 0, 25]) cylinder(h=2, r=1.2, $fn=100); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input Shaft
    translate([0, 0, 85]) input_shaft();

    // Layer 2: First Flange Plate with Nuts
    translate([0, 0, 80]) flange_plate();
    for (angle = [0:45:315]) {
        translate([7*cos(angle), 7*sin(angle), 83]) nut();
    }

    // Layer 3: First Spacer Ring with Bolts
    translate([0, 0, 75]) spacer_ring();
    for (angle = [0:45:315]) {
        translate([7*cos(angle), 7*sin(angle), 75]) bolt();
    }

    // Layer 4: Second Flange Plate with Nuts
    translate([0, 0, 70]) flange_plate();
    for (angle = [0:45:315]) {
        translate([7*cos(angle), 7*sin(angle), 73]) nut();
    }

    // Layer 5: Central Hub
    translate([0, 0, 55]) central_hub();

    // Layer 6: Third Flange Plate with Nuts
    translate([0, 0, 40]) flange_plate();
    for (angle = [0:45:315]) {
        translate([7*cos(angle), 7*sin(angle), 43]) nut();
    }

    // Layer 7: Second Spacer Ring with Bolts
    translate([0, 0, 35]) spacer_ring();
    for (angle = [0:45:315]) {
        translate([7*cos(angle), 7*sin(angle), 35]) bolt();
    }

    // Layer 8: Fourth Flange Plate with Nuts
    translate([0, 0, 30]) flange_plate();
    for (angle = [0:45:315]) {
        translate([7*cos(angle), 7*sin(angle), 33]) nut();
    }

    // Layer 9: Output Shaft
    translate([0, 0, 0]) output_shaft();
}

// Render the full assembly
flexible_coupling();
