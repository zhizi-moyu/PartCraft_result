
// Define parameters for components
module central_shaft() {
    // Adjusted to match the uniform cylindrical shape of the original model
    cylinder(h=50, r=8, center=true);
    translate([0, 0, -25])
        cylinder(h=50, r=5, center=true, $fn=100);
}

module input_shaft() {
    // Reduced taper and resized the central hole to match the original model
    difference() {
        cylinder(h=30, r1=10, r2=8, center=true);
        translate([0, 0, -15])
            cylinder(h=30, r=5, center=true, $fn=100);
    }
}

module output_shaft() {
    // Reduced the length of the cylindrical section and realigned the central hole
    difference() {
        cylinder(h=30, r1=10, r2=8, center=true);
        translate([0, 0, -15])
            cylinder(h=30, r=5, center=true, $fn=100);
    }
}

module spacer_ring() {
    // Reduced the thickness to match the original model
    difference() {
        cylinder(h=5, r=12, center=true);
        translate([0, 0, -2.5])
            cylinder(h=5, r=6, center=true, $fn=100);
    }
}

module flange_plate() {
    // Increased the number of bolt holes and adjusted the outer diameter
    difference() {
        cylinder(h=7, r=20, center=true);
        translate([0, 0, -3.5])
            cylinder(h=7, r=12, center=true, $fn=100);
        for (angle = [0:30:330]) { // Increased the number of bolt holes
            translate([16*cos(angle), 16*sin(angle), -3.5])
                cylinder(h=7, r=1.5, center=true, $fn=100);
        }
    }
}

module nut() {
    // Smoothed out the edges of the nuts
    cylinder(h=6, r=4, center=true, $fn=6);
    translate([0, 0, 3])
        sphere(r=1.5, $fn=6);
}

module bolt() {
    // Extended the threaded section of the bolts
    cylinder(h=30, r=2, center=true);
}

// Assemble the coupling
module coupling() {
    // Layer 1: Input Shaft
    translate([0, 0, 80])
        input_shaft();

    // Layer 2: Flange Plate 1 with Nuts
    translate([0, 0, 70])
        flange_plate();
    for (angle = [0:30:330]) {
        translate([16*cos(angle), 16*sin(angle), 70])
            nut();
    }

    // Layer 3: Spacer Ring 1 with Bolts
    translate([0, 0, 65])
        spacer_ring();
    for (angle = [0:30:330]) {
        translate([16*cos(angle), 16*sin(angle), 55])
            bolt();
    }

    // Layer 4: Central Shaft
    translate([0, 0, 40])
        central_shaft();

    // Layer 5: Spacer Ring 2 with Bolts
    translate([0, 0, 15])
        spacer_ring();
    for (angle = [0:30:330]) {
        translate([16*cos(angle), 16*sin(angle), 5])
            bolt();
    }

    // Layer 6: Flange Plate 2 with Nuts
    translate([0, 0, 10])
        flange_plate();
    for (angle = [0:30:330]) {
        translate([16*cos(angle), 16*sin(angle), 10])
            nut();
    }

    // Layer 7: Output Shaft
    translate([0, 0, -20])
        output_shaft();
}

// Render the coupling
coupling();

