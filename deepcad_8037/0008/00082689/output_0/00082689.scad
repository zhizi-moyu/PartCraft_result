
// Define parameters for components
module central_shaft() {
    cylinder(h=50, r=10, center=true);
    translate([0, 0, -25])
        cylinder(h=50, r=5, center=true, $fn=100);
}

module input_shaft() {
    difference() {
        cylinder(h=30, r=10, center=true);
        translate([0, 0, -15])
            cylinder(h=30, r=5, center=true, $fn=100);
    }
}

module output_shaft() {
    difference() {
        cylinder(h=30, r=10, center=true);
        translate([0, 0, -15])
            cylinder(h=30, r=5, center=true, $fn=100);
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=5, r=10, center=true);
        translate([0, 0, -2.5])
            cylinder(h=5, r=5, center=true, $fn=100);
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=15, center=true);
        translate([0, 0, -2.5])
            cylinder(h=5, r=10, center=true, $fn=100);
        for (angle = [0:90:270]) {
            translate([12*cos(angle), 12*sin(angle), -2.5])
                cylinder(h=5, r=1, center=true, $fn=100);
        }
    }
}

module nut() {
    cylinder(h=5, r=3, center=true, $fn=6);
}

module bolt() {
    cylinder(h=20, r=1.5, center=true);
}

// Assemble the coupling
module coupling() {
    // Layer 1: Input Shaft
    translate([0, 0, 75])
        input_shaft();

    // Layer 2: Flange Plate 1 with Nuts
    translate([0, 0, 65])
        flange_plate();
    for (angle = [0:90:270]) {
        translate([12*cos(angle), 12*sin(angle), 65])
            nut();
    }

    // Layer 3: Spacer Ring 1 with Bolts
    translate([0, 0, 60])
        spacer_ring();
    for (angle = [0:90:270]) {
        translate([12*cos(angle), 12*sin(angle), 50])
            bolt();
    }

    // Layer 4: Central Shaft
    translate([0, 0, 35])
        central_shaft();

    // Layer 5: Spacer Ring 2 with Bolts
    translate([0, 0, 10])
        spacer_ring();
    for (angle = [0:90:270]) {
        translate([12*cos(angle), 12*sin(angle), 0])
            bolt();
    }

    // Layer 6: Flange Plate 2 with Nuts
    translate([0, 0, 5])
        flange_plate();
    for (angle = [0:90:270]) {
        translate([12*cos(angle), 12*sin(angle), 5])
            nut();
    }

    // Layer 7: Output Shaft
    translate([0, 0, -15])
        output_shaft();
}

// Render the coupling
coupling();

