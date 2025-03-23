
// Parameters for components
module central_shaft() {
    cylinder(h=40, r=10, $fn=100); // Central shaft dimensions
}

module input_shaft() {
    difference() {
        cylinder(h=30, r=10, $fn=100); // Input shaft dimensions
        translate([0, 0, -1]) cylinder(h=32, r=5, $fn=100); // Hollow center
    }
}

module output_shaft() {
    difference() {
        cylinder(h=30, r=10, $fn=100); // Output shaft dimensions
        translate([0, 0, -1]) cylinder(h=32, r=5, $fn=100); // Hollow center
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=2, r=10, $fn=100); // Spacer ring dimensions
        translate([0, 0, -1]) cylinder(h=4, r=8, $fn=100); // Hollow center
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=12, $fn=100); // Flange plate dimensions
        translate([0, 0, -1]) cylinder(h=6, r=8, $fn=100); // Hollow center
        for (i = [0:7]) {
            rotate([0, 0, i * 45]) translate([10, 0, 0]) cylinder(h=6, r=1, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=3, r=2, $fn=6); // Nut dimensions
}

module bolt() {
    union() {
        cylinder(h=20, r=1.5, $fn=100); // Bolt shaft
        translate([0, 0, 20]) cylinder(h=2, r=2, $fn=6); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    translate([0, 0, 0]) central_shaft();
    translate([0, 0, 40]) input_shaft();
    translate([0, 0, -30]) output_shaft();

    translate([0, 0, 42]) spacer_ring(); // Layer 1
    translate([0, 0, 44]) spacer_ring(); // Layer 2
    translate([0, 0, 46]) spacer_ring(); // Layer 3
    translate([0, 0, 48]) spacer_ring(); // Layer 4
    translate([0, 0, 50]) spacer_ring(); // Layer 5
    translate([0, 0, 52]) spacer_ring(); // Layer 6

    translate([0, 0, 54]) flange_plate(); // Top flange plate
    translate([0, 0, 38]) flange_plate(); // Bottom flange plate

    for (i = [0:7]) {
        rotate([0, 0, i * 45]) translate([10, 0, 54]) bolt(); // Bolts on top flange plate
        rotate([0, 0, i * 45]) translate([10, 0, 38]) bolt(); // Bolts on bottom flange plate
    }

    for (i = [0:7]) {
        rotate([0, 0, i * 45]) translate([10, 0, 56]) nut(); // Nuts on top flange plate
        rotate([0, 0, i * 45]) translate([10, 0, 36]) nut(); // Nuts on bottom flange plate
    }
}

// Render the flexible coupling
flexible_coupling();

