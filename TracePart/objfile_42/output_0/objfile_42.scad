
// Parameters for the components
module central_hub() {
    difference() {
        cylinder(h=20, r=15, $fn=100);
        translate([0, 0, -1]) cylinder(h=22, r=10, $fn=100);
    }
}

module input_hub() {
    difference() {
        cylinder(h=15, r=15, $fn=100);
        translate([0, 0, -1]) cylinder(h=17, r=10, $fn=100);
    }
}

module output_hub() {
    difference() {
        cylinder(h=15, r=15, $fn=100);
        translate([0, 0, -1]) cylinder(h=17, r=10, $fn=100);
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=5, r=15, $fn=100);
        translate([0, 0, -1]) cylinder(h=7, r=12, $fn=100);
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=15, $fn=100);
        for (i = [0:90:270]) {
            translate([12*cos(i), 12*sin(i), -1]) cylinder(h=7, r=2, $fn=100);
        }
    }
}

module nut() {
    cylinder(h=5, r=2.5, $fn=6);
}

module bolt() {
    union() {
        cylinder(h=20, r=1.5, $fn=100);
        translate([0, 0, 20]) cylinder(h=3, r=2.5, $fn=6);
    }
}

// Assembly
module coupling() {
    // Layer 1: Input Hub
    translate([0, 0, 70]) input_hub();

    // Layer 2: Flange Plate 1 and Nuts
    translate([0, 0, 65]) flange_plate();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 65]) nut();
    }

    // Layer 3: Spacer Ring 1 and Bolts
    translate([0, 0, 60]) spacer_ring();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 60]) bolt();
    }

    // Layer 4: Flange Plate 2 and Nuts
    translate([0, 0, 55]) flange_plate();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 55]) nut();
    }

    // Layer 5: Central Hub
    translate([0, 0, 45]) central_hub();

    // Layer 6: Flange Plate 3 and Nuts
    translate([0, 0, 35]) flange_plate();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 35]) nut();
    }

    // Layer 7: Spacer Ring 2 and Bolts
    translate([0, 0, 30]) spacer_ring();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 30]) bolt();
    }

    // Layer 8: Flange Plate 4 and Nuts
    translate([0, 0, 25]) flange_plate();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 25]) nut();
    }

    // Layer 9: Output Hub
    translate([0, 0, 10]) output_hub();
}

// Render the coupling
coupling();

