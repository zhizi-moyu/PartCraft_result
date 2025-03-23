
// Parameters for the components
module central_shaft() {
    cylinder(h = 80, r = 5, $fn = 100); // Central shaft: height increased to 80 to match the original model
}

module input_shaft() {
    difference() {
        cylinder(h = 20, r = 6, $fn = 100); // Input shaft: radius remains 6
        translate([0, 0, -1]) cylinder(h = 22, r = 3, $fn = 100); // Hollow center: radius remains 3
    }
}

module output_shaft() {
    difference() {
        cylinder(h = 40, r = 6, $fn = 100); // Output shaft: height increased to 40 to match the original model
        translate([0, 0, -1]) cylinder(h = 42, r = 3, $fn = 100); // Hollow center: height increased to 42, radius remains 3
    }
}

module flange_plate() {
    cube([18, 18, 0.5], center = true); // Flange plate: resized to 18x18 and thickness reduced to 0.5 to match the original model
}

// Assembly
module flexible_coupling() {
    // Central shaft
    central_shaft();

    // Input shaft
    translate([0, 0, 40]) input_shaft(); // Adjusted position to align with the original model

    // Output shaft
    translate([0, 0, -40]) output_shaft(); // Adjusted position to align with the original model

    // Flange plates
    translate([0, 0, 41]) flange_plate(); // Layer 1
    translate([0, 0, 39]) flange_plate(); // Layer 2
    translate([0, 0, -39]) flange_plate(); // Layer 3
    translate([0, 0, -41]) flange_plate(); // Layer 4
}

// Render the model
flexible_coupling();

