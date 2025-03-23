
// Parameters
module central_cylinder() {
    // Modified to remove grooves or ridges and make the surface smooth
    cylinder(h=50, r=20, center=true);
}

module spacer_ring() {
    // Modified to reduce thickness for a flatter profile
    difference() {
        cylinder(h=2, r=20, center=true); // Reduced height from 5 to 2
        cylinder(h=2, r=15, center=true);
    }
}

module flange_plate() {
    // Modified to simplify the design and remove additional features
    difference() {
        cylinder(h=10, r=25, center=true);
        cylinder(h=10, r=20, center=true);
        for (i = [0:90:270]) {
            translate([cos(i)*22, sin(i)*22, 0])
                cylinder(h=10, r=2, center=true);
        }
    }
}

module nut() {
    // Modified to standard hexagonal cylindrical shape
    difference() {
        cylinder(h=5, r=3, center=true, $fn=6); // Added $fn=6 for hexagonal shape
    }
}

module bolt() {
    // Modified to simplify the head and shaft design
    union() {
        cylinder(h=30, r=2, center=true);
        translate([0, 0, 30])
            cylinder(h=2, r=3, center=true); // Reduced head height to 2
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Top flange plate with nuts
    translate([0, 0, 70])
        flange_plate();
    for (i = [0:90:270]) {
        translate([cos(i)*22, sin(i)*22, 75])
            nut();
    }

    // Layer 2: Spacer ring with bolts
    translate([0, 0, 60])
        spacer_ring();
    for (i = [0:90:270]) {
        translate([cos(i)*22, sin(i)*22, 60])
            bolt();
    }

    // Layer 3: Second flange plate with nuts
    translate([0, 0, 50])
        flange_plate();
    for (i = [0:90:270]) {
        translate([cos(i)*22, sin(i)*22, 55])
            nut();
    }

    // Layer 4: Central cylinder
    translate([0, 0, 25])
        central_cylinder();

    // Layer 5: Third flange plate with nuts
    translate([0, 0, 0])
        flange_plate();
    for (i = [0:90:270]) {
        translate([cos(i)*22, sin(i)*22, 5])
            nut();
    }

    // Layer 6: Spacer ring with bolts
    translate([0, 0, -10])
        spacer_ring();
    for (i = [0:90:270]) {
        translate([cos(i)*22, sin(i)*22, -10])
            bolt();
    }

    // Layer 7: Bottom flange plate with nuts
    translate([0, 0, -20])
        flange_plate();
    for (i = [0:90:270]) {
        translate([cos(i)*22, sin(i)*22, -15])
            nut();
    }
}

// Render the flexible coupling
flexible_coupling();

