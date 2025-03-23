
// Parameters
module central_craft() {
    // Adjusted to remove protrusions and ensure a smooth cylindrical shape
    cylinder(h=30, r=15, $fn=100); // Central hub
}

module input_craft() {
    // Adjusted hollow center dimensions and removed extra features
    difference() {
        cylinder(h=30, r=15, $fn=100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h=32, r=12, $fn=100); // Adjusted hollow center
    }
}

module output_craft() {
    // Adjusted hollow center dimensions and removed extra features
    difference() {
        cylinder(h=30, r=15, $fn=100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h=32, r=12, $fn=100); // Adjusted hollow center
    }
}

module spacer_ring() {
    // Reduced thickness and adjusted profile for a flat and smooth design
    difference() {
        cylinder(h=1.5, r=15, $fn=100); // Outer ring
        translate([0, 0, -1]) cylinder(h=3, r=10, $fn=100); // Inner hollow
    }
}

module flange_plate() {
    // Adjusted bolt hole alignment and count to match the original model
    difference() {
        cylinder(h=5, r=20, $fn=100); // Outer plate
        translate([0, 0, -1]) cylinder(h=6, r=15, $fn=100); // Inner hollow
        for (i = [0:7]) {
            rotate([0, 0, i * 45]) translate([17, 0, 0]) cylinder(h=6, r=1.5, $fn=100); // Adjusted bolt holes
        }
    }
}

module nut() {
    // Adjusted hexagonal profile and height to match the original model
    union() {
        cylinder(h=4, r=5, $fn=6); // Hexagonal shape
        translate([0, 0, 4]) cylinder(h=1.5, r=4, $fn=100); // Top cylinder
    }
}

module bolt() {
    // Adjusted length and removed threading pattern for simplicity
    union() {
        cylinder(h=20, r=2, $fn=100); // Bolt shaft
        translate([0, 0, 20]) cylinder(h=4, r=3, $fn=6); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    translate([0, 0, 0]) central_craft();
    translate([0, 0, 30]) input_craft();
    translate([0, 0, -30]) output_craft();
    translate([0, 0, 15]) spacer_ring();
    translate([0, 0, -15]) spacer_ring();
    translate([0, 0, 35]) flange_plate();
    translate([0, 0, -35]) flange_plate();
    translate([0, 0, 40]) flange_plate();
    translate([0, 0, -40]) flange_plate();
    for (i = [0:7]) {
        rotate([0, 0, i * 45]) translate([17, 0, 40]) bolt();
        rotate([0, 0, i * 45]) translate([17, 0, -40]) bolt();
        rotate([0, 0, i * 45]) translate([17, 0, 45]) nut();
        rotate([0, 0, i * 45]) translate([17, 0, -45]) nut();
    }
}

// Render the model
flexible_coupling();

