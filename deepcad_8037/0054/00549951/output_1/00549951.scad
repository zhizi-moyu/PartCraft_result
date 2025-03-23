
// Parameters for the components
module central_shaft() {
    cylinder(h = 60, r = 5, $fn = 100); // Central shaft: height increased to 60, radius remains 5
}

module input_shaft() {
    difference() {
        cylinder(h = 20, r = 6, $fn = 100); // Input shaft: radius increased to 6
        translate([0, 0, -1]) cylinder(h = 22, r = 3, $fn = 100); // Hollow center: radius increased to 3
    }
}

module output_shaft() {
    difference() {
        cylinder(h = 25, r = 6, $fn = 100); // Output shaft: height increased to 25, radius increased to 6
        translate([0, 0, -1]) cylinder(h = 27, r = 3, $fn = 100); // Hollow center: height increased to 27, radius increased to 3
    }
}

module flange_plate() {
    cube([20, 20, 1], center = true); // Flange plate: thickness reduced to 1
}

// Assembly
module flexible_coupling() {
    // Central shaft
    central_shaft();

    // Input shaft
    translate([0, 0, 30]) input_shaft();

    // Output shaft
    translate([0, 0, -30]) output_shaft();

    // Flange plates
    translate([0, 0, 31]) flange_plate(); // Layer 1
    translate([0, 0, 29]) flange_plate(); // Layer 2
    translate([0, 0, -29]) flange_plate(); // Layer 3
    translate([0, 0, -31]) flange_plate(); // Layer 4
}

// Render the model
flexible_coupling();

