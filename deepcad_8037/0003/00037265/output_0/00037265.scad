
// Parameters for the components
module central_shaft() {
    difference() {
        cylinder(h = 30, r = 10, $fn = 100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h = 32, r = 5, $fn = 100); // Inner hollow
    }
}

module input_shaft() {
    difference() {
        cylinder(h = 25, r1 = 10, r2 = 8, $fn = 100); // Tapered cylinder
        translate([0, 0, -1]) cylinder(h = 27, r = 5, $fn = 100); // Inner hollow
        translate([0, 8, 12]) rotate([90, 0, 0]) cylinder(h = 3, r = 1.5, $fn = 100); // Bolt hole
    }
}

module output_shaft() {
    difference() {
        cylinder(h = 25, r = 10, $fn = 100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h = 27, r = 5, $fn = 100); // Inner hollow
        translate([0, 8, 12]) rotate([90, 0, 0]) cylinder(h = 3, r = 1.5, $fn = 100); // Bolt hole
    }
}

// Assembly of the flexible coupling
module flexible_coupling() {
    translate([0, 0, 25]) input_shaft(); // Layer 1: Input shaft
    central_shaft(); // Layer 2: Central shaft
    translate([0, 0, -30]) output_shaft(); // Layer 3: Output shaft
}

// Render the model
flexible_coupling();

