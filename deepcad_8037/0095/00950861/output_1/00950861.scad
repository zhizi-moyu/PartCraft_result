// Parameters
module central_cylinder() {
    difference() {
        cylinder(h=50, r=20, $fn=100); // Outer cylinder with increased height
        cylinder(h=50, r=10, $fn=100); // Hollow interior
    }
}

module input_cylinder() {
    cylinder(h=20, r=20, $fn=100); // Uniform cylindrical shape
}

module output_cylinder() {
    translate([0, 0, -25]) difference() {
        cylinder(h=20, r=20, $fn=100); // Outer cylinder
        cylinder(h=20, r=10, $fn=100); // Hollow interior
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=10, r=20, $fn=100); // Outer ring with increased thickness
        cylinder(h=10, r=15, $fn=100); // Hollow center
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=20, $fn=100); // Outer plate
        cylinder(h=5, r=15, $fn=100); // Hollow center
        for (i = [0:5]) { // Increased number of bolt holes
            rotate([0, 0, i * 60]) translate([17, 0, 0]) cylinder(h=5, r=2, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=5, r=2.5, $fn=6); // Reduced size hexagonal nut
}

module bolt() {
    union() {
        cylinder(h=30, r=2, $fn=100); // Bolt shaft with increased length
        translate([0, 0, 30]) cylinder(h=5, r=3, $fn=6); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input Cylinder
    translate([0, 0, 90]) input_cylinder();

    // Layer 2: First Flange Plate with Nuts
    translate([0, 0, 85]) flange_plate();
    for (i = [0:5]) { // Adjusted for increased bolt holes
        rotate([0, 0, i * 60]) translate([17, 0, 85]) nut();
    }

    // Layer 3: First Spacer Ring with Bolts
    translate([0, 0, 80]) spacer_ring();
    for (i = [0:5]) { // Adjusted for increased bolt holes
        rotate([0, 0, i * 60]) translate([17, 0, 80]) bolt();
    }

    // Layer 4: Central Cylinder
    translate([0, 0, 40]) central_cylinder();

    // Layer 5: Second Spacer Ring with Bolts
    translate([0, 0, 0]) spacer_ring();
    for (i = [0:5]) { // Adjusted for increased bolt holes
        rotate([0, 0, i * 60]) translate([17, 0, 0]) bolt();
    }

    // Layer 6: Second Flange Plate with Nuts
    translate([0, 0, -5]) flange_plate();
    for (i = [0:5]) { // Adjusted for increased bolt holes
        rotate([0, 0, i * 60]) translate([17, 0, -5]) nut();
    }

    // Layer 7: Output Cylinder
    translate([0, 0, -25]) output_cylinder();
}

// Render the flexible coupling assembly
flexible_coupling();
