
// Parameters for components
module central_shaft() {
    cylinder(h=40, r=5, $fn=100);
}

module input_shaft() {
    difference() {
        cylinder(h=20, r=7, $fn=100);
        translate([0, 0, -1]) cylinder(h=22, r=5, $fn=100);
    }
}

module output_shaft() {
    difference() {
        cylinder(h=20, r=7, $fn=100);
        translate([0, 0, -1]) cylinder(h=22, r=5, $fn=100);
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=2, r=10, $fn=100);
        cylinder(h=3, r=5, $fn=100);
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=12, $fn=100);
        cylinder(h=6, r=5, $fn=100);
        for (i = [0:90:270]) {
            translate([10*cos(i), 10*sin(i), -1])
                cylinder(h=7, r=1, $fn=100);
        }
    }
}

module nut() {
    translate([0, 0, 2])
        cylinder(h=3, r=2, $fn=6);
}

module bolt() {
    cylinder(h=50, r=1, $fn=100);
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input Shaft
    translate([0, 0, 90]) input_shaft();

    // Layer 2: Flange Plate 1 and Nuts
    translate([0, 0, 70]) flange_plate();
    for (i = [0:90:270]) {
        translate([10*cos(i), 10*sin(i), 70]) nut();
    }

    // Layer 3: Spacer Ring 1 and Bolts
    translate([0, 0, 68]) spacer_ring();
    for (i = [0:90:270]) {
        translate([10*cos(i), 10*sin(i), 68]) bolt();
    }

    // Layer 4: Central Shaft
    translate([0, 0, 50]) central_shaft();

    // Layer 5: Spacer Ring 2 and Bolts
    translate([0, 0, 48]) spacer_ring();
    for (i = [0:90:270]) {
        translate([10*cos(i), 10*sin(i), 48]) bolt();
    }

    // Layer 6: Flange Plate 2 and Nuts
    translate([0, 0, 30]) flange_plate();
    for (i = [0:90:270]) {
        translate([10*cos(i), 10*sin(i), 30]) nut();
    }

    // Layer 7: Output Shaft
    translate([0, 0, 10]) output_shaft();
}

// Render the assembly
flexible_coupling();

