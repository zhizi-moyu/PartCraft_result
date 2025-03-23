
// Define parameters for components
module central_shaft() {
    // Elongate the central shaft and increase the diameter of the central hole
    cylinder(h=55, r=10, center=true);
    translate([0, 0, -27.5])
        cylinder(h=55, r=6, center=true, $fn=100);
}

module input_shaft() {
    // Reduce the taper and widen the central hole
    difference() {
        cylinder(h=35, r=10, center=true);
        translate([0, 0, -17.5])
            cylinder(h=35, r=6, center=true, $fn=100);
    }
}

module output_shaft() {
    // Adjust the taper, increase the length, and widen the central hole
    difference() {
        cylinder(h=35, r=10, center=true);
        translate([0, 0, -17.5])
            cylinder(h=35, r=6, center=true, $fn=100);
    }
}

module spacer_ring() {
    // Increase the thickness and outer diameter
    difference() {
        cylinder(h=7, r=12, center=true);
        translate([0, 0, -3.5])
            cylinder(h=7, r=6, center=true, $fn=100);
    }
}

module flange_plate() {
    // Add more bolt holes and increase the diameter
    difference() {
        cylinder(h=7, r=18, center=true);
        translate([0, 0, -3.5])
            cylinder(h=7, r=12, center=true, $fn=100);
        for (angle = [0:45:315]) { // Increase the number of bolt holes
            translate([14*cos(angle), 14*sin(angle), -3.5])
                cylinder(h=7, r=1.5, center=true, $fn=100);
        }
    }
}

module nut() {
    // Increase the size of the nuts
    cylinder(h=6, r=4, center=true, $fn=6);
}

module bolt() {
    // Increase the length and diameter of the bolts
    cylinder(h=25, r=2, center=true);
}

// Assemble the coupling
module coupling() {
    // Layer 1: Input Shaft
    translate([0, 0, 85])
        input_shaft();

    // Layer 2: Flange Plate 1 with Nuts
    translate([0, 0, 75])
        flange_plate();
    for (angle = [0:45:315]) {
        translate([14*cos(angle), 14*sin(angle), 75])
            nut();
    }

    // Layer 3: Spacer Ring 1 with Bolts
    translate([0, 0, 68])
        spacer_ring();
    for (angle = [0:45:315]) {
        translate([14*cos(angle), 14*sin(angle), 58])
            bolt();
    }

    // Layer 4: Central Shaft
    translate([0, 0, 40])
        central_shaft();

    // Layer 5: Spacer Ring 2 with Bolts
    translate([0, 0, 15])
        spacer_ring();
    for (angle = [0:45:315]) {
        translate([14*cos(angle), 14*sin(angle), 5])
            bolt();
    }

    // Layer 6: Flange Plate 2 with Nuts
    translate([0, 0, 10])
        flange_plate();
    for (angle = [0:45:315]) {
        translate([14*cos(angle), 14*sin(angle), 10])
            nut();
    }

    // Layer 7: Output Shaft
    translate([0, 0, -20])
        output_shaft();
}

// Render the coupling
coupling();

