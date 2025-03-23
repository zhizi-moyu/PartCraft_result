
// Parameters for components
module central_shaft() {
    cylinder(h=50, r=10, $fn=100); // Central shaft dimensions
}

module input_shaft() {
    difference() {
        cylinder(h=30, r=10, $fn=100); // Input shaft dimensions
        translate([0, 0, -1]) cylinder(h=32, r=5, $fn=100); // Hollow center
    }
}

module output_shaft() {
    difference() {
        cylinder(h=30, r=10, $fn=100); // Output shaft dimensions
        translate([0, 0, -1]) cylinder(h=32, r=5, $fn=100); // Hollow center
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=5, r=15, $fn=100); // Outer ring
        translate([0, 0, -1]) cylinder(h=7, r=10, $fn=100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=20, $fn=100); // Flange plate
        translate([0, 0, -1]) cylinder(h=7, r=10, $fn=100); // Inner hollow
        for (angle = [0:90:270]) {
            translate([15*cos(angle), 15*sin(angle), -1])
                cylinder(h=7, r=2, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=5, r=3, $fn=6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h=20, r=2, $fn=100); // Bolt shaft
        translate([0, 0, 20]) cylinder(h=5, r=3, $fn=6); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input shaft
    translate([0, 0, 90]) input_shaft();

    // Layer 2: First flange plate and nuts
    translate([0, 0, 85]) flange_plate();
    for (angle = [0:90:270]) {
        translate([15*cos(angle), 15*sin(angle), 85]) nut();
    }

    // Layer 3: First spacer ring and bolts
    translate([0, 0, 80]) spacer_ring();
    for (angle = [0:90:270]) {
        translate([15*cos(angle), 15*sin(angle), 80]) bolt();
    }

    // Layer 4: Central shaft
    translate([0, 0, 50]) central_shaft();

    // Layer 5: Second spacer ring and bolts
    translate([0, 0, 20]) spacer_ring();
    for (angle = [0:90:270]) {
        translate([15*cos(angle), 15*sin(angle), 20]) bolt();
    }

    // Layer 6: Second flange plate and nuts
    translate([0, 0, 15]) flange_plate();
    for (angle = [0:90:270]) {
        translate([15*cos(angle), 15*sin(angle), 15]) nut();
    }

    // Layer 7: Output shaft
    translate([0, 0, 0]) output_shaft();
}

// Render the flexible coupling
flexible_coupling();

