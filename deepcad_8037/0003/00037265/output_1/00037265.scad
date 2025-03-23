
// Parameters for the components
module central_shaft() {
    // Modified to remove tapering and make it uniformly cylindrical
    difference() {
        cylinder(h = 30, r = 10, $fn = 100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h = 32, r = 5, $fn = 100); // Inner hollow
    }
}

module input_shaft() {
    // Modified to reduce tapering and add a bolt hole near one end
    difference() {
        cylinder(h = 25, r1 = 10, r2 = 9, $fn = 100); // Reduced tapering
        translate([0, 0, -1]) cylinder(h = 27, r = 5, $fn = 100); // Inner hollow
        translate([0, 8, 2]) rotate([90, 0, 0]) cylinder(h = 3, r = 1.5, $fn = 100); // Bolt hole near one end
    }
}

module output_shaft() {
    // Modified to add a bolt hole near one end and adjust the length
    difference() {
        cylinder(h = 30, r = 10, $fn = 100); // Adjusted length
        translate([0, 0, -1]) cylinder(h = 32, r = 5, $fn = 100); // Inner hollow
        translate([0, 8, 2]) rotate([90, 0, 0]) cylinder(h = 3, r = 1.5, $fn = 100); // Bolt hole near one end
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

