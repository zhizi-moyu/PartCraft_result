
// Parameters for components
module central_hub() {
    difference() {
        cylinder(h=20, r=10, $fn=100); // Main hub
        translate([0, 0, -1]) cylinder(h=22, r=5, $fn=100); // Central bore
    }
}

module input_shaft() {
    difference() {
        cylinder(h=30, r=5, $fn=100); // Shaft body
        translate([0, 0, -1]) cylinder(h=32, r=2.5, $fn=100); // Hollow center
    }
}

module output_shaft() {
    difference() {
        cylinder(h=30, r=5, $fn=100); // Shaft body
        translate([0, 0, -1]) cylinder(h=32, r=2.5, $fn=100); // Hollow center
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=2, r=10, $fn=100); // Outer ring
        translate([0, 0, -1]) cylinder(h=4, r=8, $fn=100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=10, $fn=100); // Plate body
        translate([0, 0, -1]) cylinder(h=7, r=8, $fn=100); // Hollow center
        for (angle = [0:90:270]) {
            translate([7*cos(angle), 7*sin(angle), -1]) cylinder(h=7, r=1, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=3, r=2, $fn=6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h=20, r=1, $fn=100); // Bolt body
        translate([0, 0, 20]) cylinder(h=2, r=1.5, $fn=100); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input Shaft
    translate([0, 0, 80]) input_shaft();

    // Layer 2: First Flange Plate with Nuts
    translate([0, 0, 75]) flange_plate();
    for (angle = [0:90:270]) {
        translate([7*cos(angle), 7*sin(angle), 78]) nut();
    }

    // Layer 3: First Spacer Ring with Bolts
    translate([0, 0, 70]) spacer_ring();
    for (angle = [0:90:270]) {
        translate([7*cos(angle), 7*sin(angle), 70]) bolt();
    }

    // Layer 4: Second Flange Plate with Nuts
    translate([0, 0, 65]) flange_plate();
    for (angle = [0:90:270]) {
        translate([7*cos(angle), 7*sin(angle), 68]) nut();
    }

    // Layer 5: Central Hub
    translate([0, 0, 50]) central_hub();

    // Layer 6: Third Flange Plate with Nuts
    translate([0, 0, 35]) flange_plate();
    for (angle = [0:90:270]) {
        translate([7*cos(angle), 7*sin(angle), 38]) nut();
    }

    // Layer 7: Second Spacer Ring with Bolts
    translate([0, 0, 30]) spacer_ring();
    for (angle = [0:90:270]) {
        translate([7*cos(angle), 7*sin(angle), 30]) bolt();
    }

    // Layer 8: Fourth Flange Plate with Nuts
    translate([0, 0, 25]) flange_plate();
    for (angle = [0:90:270]) {
        translate([7*cos(angle), 7*sin(angle), 28]) nut();
    }

    // Layer 9: Output Shaft
    translate([0, 0, 0]) output_shaft();
}

// Render the full assembly
flexible_coupling();

