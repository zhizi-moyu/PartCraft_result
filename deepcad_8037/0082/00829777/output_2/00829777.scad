
// Parameters
module central_cylinder() {
    // Modified to remove grooves or ridges and make the surface smooth
    cylinder(h=50, r=20, center=true);
}

module spacer_ring() {
    // Modified to reduce thickness for a flatter profile
    difference() {
        cylinder(h=1.5, r=20, center=true); // Reduced height from 2 to 1.5
        cylinder(h=1.5, r=15, center=true);
    }
}

module flange_plate() {
    // Modified to evenly distribute bolt holes and match the original model
    difference() {
        cylinder(h=10, r=25, center=true);
        cylinder(h=10, r=20, center=true);
        for (i = [0:60:300]) { // Adjusted to evenly distribute 6 bolt holes
            translate([cos(i)*22, sin(i)*22, 0])
                cylinder(h=10, r=2, center=true);
        }
    }
}

module nut() {
    // Modified to sharp hexagonal profile
    difference() {
        cylinder(h=5, r=3, center=true, $fn=6); // Ensured sharp hexagonal profile
    }
}

module bolt() {
    // Modified to increase threaded shaft length
    union() {
        cylinder(h=35, r=2, center=true); // Increased shaft length from 30 to 35
        translate([0, 0, 35])
            cylinder(h=2, r=3, center=true); // Head height remains 2
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Top flange plate with nuts
    translate([0, 0, 70])
        flange_plate();
    for (i = [0:60:300]) { // Adjusted to match flange plate bolt holes
        translate([cos(i)*22, sin(i)*22, 75])
            nut();
    }

    // Layer 2: Spacer ring with bolts
    translate([0, 0, 60])
        spacer_ring();
    for (i = [0:60:300]) { // Adjusted to match flange plate bolt holes
        translate([cos(i)*22, sin(i)*22, 60])
            bolt();
    }

    // Layer 3: Second flange plate with nuts
    translate([0, 0, 50])
        flange_plate();
    for (i = [0:60:300]) { // Adjusted to match flange plate bolt holes
        translate([cos(i)*22, sin(i)*22, 55])
            nut();
    }

    // Layer 4: Central cylinder
    translate([0, 0, 25])
        central_cylinder();

    // Layer 5: Third flange plate with nuts
    translate([0, 0, 0])
        flange_plate();
    for (i = [0:60:300]) { // Adjusted to match flange plate bolt holes
        translate([cos(i)*22, sin(i)*22, 5])
            nut();
    }

    // Layer 6: Spacer ring with bolts
    translate([0, 0, -10])
        spacer_ring();
    for (i = [0:60:300]) { // Adjusted to match flange plate bolt holes
        translate([cos(i)*22, sin(i)*22, -10])
            bolt();
    }

    // Layer 7: Bottom flange plate with nuts
    translate([0, 0, -20])
        flange_plate();
    for (i = [0:60:300]) { // Adjusted to match flange plate bolt holes
        translate([cos(i)*22, sin(i)*22, -15])
            nut();
    }
}

// Render the flexible coupling
flexible_coupling();

