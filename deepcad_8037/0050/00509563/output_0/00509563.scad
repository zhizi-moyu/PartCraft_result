
// Parameters for the components
module input_craft() {
    cylinder(h = 20, d = 10, $fn = 100); // Height: 20, Diameter: 10
}

module central_craft() {
    cylinder(h = 30, d = 15, $fn = 100); // Height: 30, Diameter: 15
}

module output_craft() {
    cylinder(h = 20, d = 10, $fn = 100); // Height: 20, Diameter: 10
}

// Assembly of the flexible coupling
module flexible_coupling() {
    translate([0, 0, 40]) input_craft(); // Position input_craft at the top
    translate([0, 0, 10]) central_craft(); // Position central_craft below input_craft
    translate([0, 0, -20]) output_craft(); // Position output_craft at the bottom
}

// Render the model
flexible_coupling();

