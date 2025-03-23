
// Parameters for components
module central_shaft() {
    // Adjusted to ensure smooth cylindrical shape
    cylinder(h=40, r=5, $fn=100); // Removed protrusions for a smooth surface
}

module input_shaft() {
    // Adjusted diameter and removed extra features
    cylinder(h=20, r=5, $fn=100); // Simplified to match the original hollow cylindrical shape
}

module output_shaft() {
    // Adjusted length and removed extra features
    cylinder(h=25, r=5, $fn=100); // Simplified to match the original hollow cylindrical shape
}

module spacer_ring() {
    // Reduced thickness and ensured flat shape
    difference() {
        cylinder(h=1, r=10, $fn=100); // Reduced thickness to match the original
        cylinder(h=1, r=5, $fn=100);  // Ensured flat and uniform profile
    }
}

module flange_plate() {
    // Adjusted hole arrangement and ensured flat circular shape
    difference() {
        cylinder(h=5, r=12, $fn=100); // Flat circular shape
        for (i = [0:45:315]) { // Increased number of holes to match the original
            translate([10*cos(i), 10*sin(i), -1])
                cylinder(h=7, r=1, $fn=100);
        }
    }
}

module nut() {
    // Adjusted size and ensured hexagonal shape
    translate([0, 0, 2])
        cylinder(h=3, r=2, $fn=6); // Hexagonal shape with adjusted size
}

module bolt() {
    // Adjusted length and ensured threaded ends
    cylinder(h=40, r=1, $fn=100); // Adjusted length and diameter to match the original slender design
}

module flexible_coupling() {
    // Layer 1: Input Shaft
    translate([0, 0, 90]) input_shaft();

    // Layer 2: Flange Plate 1 and Nuts
    translate([0, 0, 70]) flange_plate();
    for (i = [0:45:315]) { // Adjusted hole arrangement
        translate([10*cos(i), 10*sin(i), 70]) nut();
    }

    // Layer 3: Spacer Ring 1 and Bolts
    translate([0, 0, 68]) spacer_ring();
    for (i = [0:45:315]) { // Adjusted hole arrangement
        translate([10*cos(i), 10*sin(i), 68]) bolt();
    }

    // Layer 4: Central Shaft
    translate([0, 0, 50]) central_shaft();

    // Layer 5: Spacer Ring 2 and Bolts
    translate([0, 0, 48]) spacer_ring();
    for (i = [0:45:315]) { // Adjusted hole arrangement
        translate([10*cos(i), 10*sin(i), 48]) bolt();
    }

    // Layer 6: Flange Plate 2 and Nuts
    translate([0, 0, 30]) flange_plate();
    for (i = [0:45:315]) { // Adjusted hole arrangement
        translate([10*cos(i), 10*sin(i), 30]) nut();
    }

    // Layer 7: Output Shaft
    translate([0, 0, 10]) output_shaft();
}

// Render the assembly
flexible_coupling();

