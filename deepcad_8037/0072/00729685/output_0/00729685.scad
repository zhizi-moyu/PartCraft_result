
// Parameters for the components
module central_cylinder() {
    cylinder(h = 30, r = 10, $fn = 100); // Central cylinder: height = 30, radius = 10
}

module input_cylinder() {
    cylinder(h = 20, r = 10, $fn = 100); // Input cylinder: height = 20, radius = 10
}

module output_cylinder() {
    cylinder(h = 20, r = 10, $fn = 100); // Output cylinder: height = 20, radius = 10
}

// Assembly of the flexible coupling
module flexible_coupling() {
    translate([0, 0, 50]) input_cylinder(); // Position input cylinder at the top
    translate([0, 0, 20]) central_cylinder(); // Position central cylinder below input cylinder
    translate([0, 0, 0]) output_cylinder(); // Position output cylinder at the bottom
}

// Render the model
flexible_coupling();

