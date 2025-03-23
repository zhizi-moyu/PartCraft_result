
// Parameters for the components
module input_craft() {
    // Adjusted to a smooth cylindrical shape
    cylinder(h = 25, d = 10, $fn = 100); // Height: 25, Diameter: 10
}

module central_craft() {
    // Simplified to a smooth cylindrical shape
    cylinder(h = 30, d = 15, $fn = 100); // Height: 30, Diameter: 15
}

module output_craft() {
    // Adjusted to a smooth cylindrical shape
    cylinder(h = 20, d = 10, $fn = 100); // Height: 20, Diameter: 10
}

// Assembly of the flexible coupling
module flexible_coupling() {
    translate([0, 0, 45]) input_craft(); // Position input_craft at the top
    translate([0, 0, 15]) central_craft(); // Position central_craft below input_craft
    translate([0, 0, -15]) output_craft(); // Position output_craft at the bottom
}

// Render the model
flexible_coupling();

