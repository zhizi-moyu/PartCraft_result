
// Parameters for components
module flange_plate() {
    difference() {
        cylinder(h=4, r=28); // Adjusted outer cylinder diameter and reduced thickness
        cylinder(h=4, r=20); // Inner hole remains the same
        for (i = [0:60:300]) { // Bolt holes evenly distributed
            translate([24*cos(i), 24*sin(i), 0]) // Adjusted bolt hole positions
                cylinder(h=4, r=2);
        }
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=0.5, r=28); // Reduced thickness and adjusted outer diameter
        cylinder(h=0.5, r=20); // Inner hole remains the same
    }
}

module central_craft() {
    difference() {
        cylinder(h=18, r=22); // Reduced thickness of the cylindrical body
        cylinder(h=18, r=12); // Increased diameter of the central hole
    }
}

module bolt() {
    cylinder(h=40, r=1.5); // Increased bolt length
}

module nut() {
    difference() {
        cylinder(h=2.5, r=3, $fn=6); // Reduced size of the hexagonal cylinder
        cylinder(h=2.5, r=1.5); // Inner threading remains the same
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Top flange plate
    translate([0, 0, 0])
        flange_plate();

    // Layer 2: Spacer ring
    translate([0, 0, 4])
        spacer_ring();

    // Layer 3: Second flange plate
    translate([0, 0, 4.5])
        flange_plate();

    // Layer 4: Central craft
    translate([0, 0, 8.5])
        central_craft();

    // Layer 5: Third flange plate
    translate([0, 0, 26.5])
        flange_plate();

    // Layer 6: Second spacer ring
    translate([0, 0, 30.5])
        spacer_ring();

    // Layer 7: Bottom flange plate
    translate([0, 0, 31])
        flange_plate();

    // Bolts and nuts
    for (i = [0:60:300]) {
        translate([24*cos(i), 24*sin(i), 0])
            bolt();
        translate([24*cos(i), 24*sin(i), 40])
            nut();
    }
}

// Render the flexible coupling
flexible_coupling();

