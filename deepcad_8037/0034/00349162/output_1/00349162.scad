
// Parameters for components
module flange_plate() {
    difference() {
        cylinder(h=5, r=30); // Outer cylinder
        cylinder(h=5, r=20); // Inner hole
        for (i = [0:60:300]) { // Bolt holes evenly distributed
            translate([25*cos(i), 25*sin(i), 0])
                cylinder(h=5, r=2);
        }
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=1, r=30); // Outer cylinder with reduced thickness
        cylinder(h=1, r=20); // Inner hole
    }
}

module central_craft() {
    difference() {
        cylinder(h=20, r=25); // Outer cylinder with smooth surface
        cylinder(h=20, r=10); // Inner hole
    }
}

module bolt() {
    cylinder(h=35, r=1.5); // Elongated and thinner bolt body
}

module nut() {
    difference() {
        cylinder(h=3, r=3.5, $fn=6); // Smaller hexagonal cylinder
        cylinder(h=3, r=1.5); // Inner threading
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Top flange plate
    translate([0, 0, 0])
        flange_plate();

    // Layer 2: Spacer ring
    translate([0, 0, 5])
        spacer_ring();

    // Layer 3: Second flange plate
    translate([0, 0, 6])
        flange_plate();

    // Layer 4: Central craft
    translate([0, 0, 11])
        central_craft();

    // Layer 5: Third flange plate
    translate([0, 0, 31])
        flange_plate();

    // Layer 6: Second spacer ring
    translate([0, 0, 36])
        spacer_ring();

    // Layer 7: Bottom flange plate
    translate([0, 0, 37])
        flange_plate();

    // Bolts and nuts
    for (i = [0:60:300]) {
        translate([25*cos(i), 25*sin(i), 0])
            bolt();
        translate([25*cos(i), 25*sin(i), 35])
            nut();
    }
}

// Render the flexible coupling
flexible_coupling();

