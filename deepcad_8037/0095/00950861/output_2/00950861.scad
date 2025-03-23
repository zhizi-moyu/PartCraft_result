
// Parameters
module central_cylinder() {
    // Adjusted to remove tapering and ensure uniform cylindrical shape
    difference() {
        cylinder(h=50, r=20, $fn=100); // Outer cylinder
        cylinder(h=50, r=10, $fn=100); // Hollow interior
    }
}

module input_cylinder() {
    // Adjusted to elongate the cylinder and make the flat end surface more distinct
    cylinder(h=30, r=20, $fn=100); // Elongated cylindrical shape
}

module output_cylinder() {
    // Adjusted to extend the cylinder and improve symmetry
    translate([0, 0, -30]) difference() {
        cylinder(h=30, r=20, $fn=100); // Outer cylinder
        cylinder(h=30, r=10, $fn=100); // Hollow interior
    }
}

module spacer_ring() {
    // Adjusted to increase the thickness of the spacer ring
    difference() {
        cylinder(h=15, r=20, $fn=100); // Outer ring with increased thickness
        cylinder(h=15, r=15, $fn=100); // Hollow center
    }
}

module flange_plate() {
    // Adjusted to increase the number of bolt holes and ensure uniform distribution
    difference() {
        cylinder(h=5, r=20, $fn=100); // Outer plate
        cylinder(h=5, r=15, $fn=100); // Hollow center
        for (i = [0:7]) { // Increased number of bolt holes to 8
            rotate([0, 0, i * 45]) translate([17, 0, 0]) cylinder(h=5, r=2, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    // Adjusted to refine the hexagonal shape and sharpen edges
    cylinder(h=5, r=3, $fn=6); // Refined hexagonal nut
}

module bolt() {
    // Adjusted to lengthen the bolt and make threading more distinct
    union() {
        cylinder(h=35, r=2, $fn=100); // Bolt shaft with increased length
        translate([0, 0, 35]) cylinder(h=5, r=3, $fn=6); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input Cylinder
    translate([0, 0, 95]) input_cylinder();

    // Layer 2: First Flange Plate with Nuts
    translate([0, 0, 90]) flange_plate();
    for (i = [0:7]) { // Adjusted for increased bolt holes
        rotate([0, 0, i * 45]) translate([17, 0, 90]) nut();
    }

    // Layer 3: First Spacer Ring with Bolts
    translate([0, 0, 80]) spacer_ring();
    for (i = [0:7]) { // Adjusted for increased bolt holes
        rotate([0, 0, i * 45]) translate([17, 0, 80]) bolt();
    }

    // Layer 4: Central Cylinder
    translate([0, 0, 40]) central_cylinder();

    // Layer 5: Second Spacer Ring with Bolts
    translate([0, 0, 0]) spacer_ring();
    for (i = [0:7]) { // Adjusted for increased bolt holes
        rotate([0, 0, i * 45]) translate([17, 0, 0]) bolt();
    }

    // Layer 6: Second Flange Plate with Nuts
    translate([0, 0, -5]) flange_plate();
    for (i = [0:7]) { // Adjusted for increased bolt holes
        rotate([0, 0, i * 45]) translate([17, 0, -5]) nut();
    }

    // Layer 7: Output Cylinder
    translate([0, 0, -30]) output_cylinder();
}

// Render the flexible coupling assembly
flexible_coupling();

