
// Parameters
module central_cylinder() {
    difference() {
        cylinder(h=40, r=20, $fn=100); // Outer cylinder
        cylinder(h=40, r=10, $fn=100); // Hollow interior
    }
}

module input_cylinder() {
    difference() {
        cylinder(h=20, r=20, $fn=100); // Outer cylinder
        cylinder(h=20, r=10, $fn=100); // Hollow interior
    }
}

module output_cylinder() {
    difference() {
        cylinder(h=20, r=20, $fn=100); // Outer cylinder
        cylinder(h=20, r=10, $fn=100); // Hollow interior
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=5, r=20, $fn=100); // Outer ring
        cylinder(h=5, r=15, $fn=100); // Hollow center
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=20, $fn=100); // Outer plate
        cylinder(h=5, r=15, $fn=100); // Hollow center
        for (i = [0:3]) {
            rotate([0, 0, i * 90]) translate([17, 0, 0]) cylinder(h=5, r=2, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=5, r=3, $fn=6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h=25, r=2, $fn=100); // Bolt shaft
        translate([0, 0, 25]) cylinder(h=5, r=3, $fn=6); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input Cylinder
    translate([0, 0, 90]) input_cylinder();

    // Layer 2: First Flange Plate with Nuts
    translate([0, 0, 85]) flange_plate();
    for (i = [0:3]) {
        rotate([0, 0, i * 90]) translate([17, 0, 85]) nut();
    }

    // Layer 3: First Spacer Ring with Bolts
    translate([0, 0, 80]) spacer_ring();
    for (i = [0:3]) {
        rotate([0, 0, i * 90]) translate([17, 0, 80]) bolt();
    }

    // Layer 4: Central Cylinder
    translate([0, 0, 40]) central_cylinder();

    // Layer 5: Second Spacer Ring with Bolts
    translate([0, 0, 0]) spacer_ring();
    for (i = [0:3]) {
        rotate([0, 0, i * 90]) translate([17, 0, 0]) bolt();
    }

    // Layer 6: Second Flange Plate with Nuts
    translate([0, 0, -5]) flange_plate();
    for (i = [0:3]) {
        rotate([0, 0, i * 90]) translate([17, 0, -5]) nut();
    }

    // Layer 7: Output Cylinder
    translate([0, 0, -25]) output_cylinder();
}

// Render the flexible coupling assembly
flexible_coupling();

