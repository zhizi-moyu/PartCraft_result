
// Parameters for the components
module central_shaft() {
    cylinder(h = 50, r = 5, $fn = 100); // Central shaft: height 50, radius 5
}

module input_shaft() {
    difference() {
        cylinder(h = 20, r = 5, $fn = 100); // Input shaft: height 20, radius 5
        translate([0, 0, -1]) cylinder(h = 22, r = 2, $fn = 100); // Hollow center: height 22, radius 2
    }
}

module output_shaft() {
    difference() {
        cylinder(h = 20, r = 5, $fn = 100); // Output shaft: height 20, radius 5
        translate([0, 0, -1]) cylinder(h = 22, r = 2, $fn = 100); // Hollow center: height 22, radius 2
    }
}

module flange_plate() {
    cube([20, 20, 2], center = true); // Flange plate: 20x20x2
}

// Assembly
module flexible_coupling() {
    // Central shaft
    central_shaft();

    // Input shaft
    translate([0, 0, 25]) input_shaft();

    // Output shaft
    translate([0, 0, -25]) output_shaft();

    // Flange plates
    translate([0, 0, 26]) flange_plate(); // Layer 1
    translate([0, 0, 24]) flange_plate(); // Layer 2
    translate([0, 0, -24]) flange_plate(); // Layer 3
    translate([0, 0, -26]) flange_plate(); // Layer 4
}

// Render the model
flexible_coupling();

