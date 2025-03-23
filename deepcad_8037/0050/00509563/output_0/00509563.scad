
// Parameters for the components
module central_cylinder() {
    cylinder(h = 20, r = 10, $fn = 100); // Central cylinder: height 20, radius 10
}

module input_cylinder() {
    cylinder(h = 10, r = 10, $fn = 100); // Input cylinder: height 10, radius 10
}

module output_cylinder() {
    cylinder(h = 10, r = 10, $fn = 100); // Output cylinder: height 10, radius 10
}

// Assembly of the flexible coupling
module flexible_coupling() {
    // Layer 1: Input cylinder
    translate([0, 0, 20]) input_cylinder();
    
    // Layer 2: Central cylinder
    central_cylinder();
    
    // Layer 3: Output cylinder
    translate([0, 0, -10]) output_cylinder();
}

// Render the model
flexible_coupling();

