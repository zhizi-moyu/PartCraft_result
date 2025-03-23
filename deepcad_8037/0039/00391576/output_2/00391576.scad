
// Parameters for dimensions
input_cylinder_diameter = 22; // Diameter of the input cylinder
input_cylinder_height = 20;  // Reduced height of the input cylinder to match the original model

central_cylinder_diameter = 30; // Diameter of the central cylinder remains unchanged
central_cylinder_height = 40;   // Height of the central cylinder remains unchanged

output_cylinder_diameter = 22; // Diameter of the output cylinder
output_cylinder_height = 20;  // Reduced height of the output cylinder to match the original model

// Positional offsets
input_cylinder_offset = 0; // Topmost position
central_cylinder_offset = input_cylinder_height; // Below the input cylinder
output_cylinder_offset = input_cylinder_height + central_cylinder_height; // Below the central cylinder

// Input Cylinder
translate([0, 0, input_cylinder_offset])
cylinder(h = input_cylinder_height, d = input_cylinder_diameter, center = false);

// Central Cylinder
translate([0, 0, central_cylinder_offset])
cylinder(h = central_cylinder_height, d = central_cylinder_diameter, center = false);

// Output Cylinder
translate([0, 0, output_cylinder_offset])
cylinder(h = output_cylinder_height, d = output_cylinder_diameter, center = false);

// Smooth transitions between cylinders
module smooth_transition(d1, d2, h, z_offset) {
    translate([0, 0, z_offset])
    linear_extrude(height = h)
    scale([1, 1, 1])
    circle(d = d1);
    scale([d2 / d1, d2 / d1, 1])
    circle(d = d2);
}

// Smooth transition between input cylinder and central cylinder
smooth_transition(input_cylinder_diameter, central_cylinder_diameter, 2, input_cylinder_height);

// Smooth transition between central cylinder and output cylinder
smooth_transition(central_cylinder_diameter, output_cylinder_diameter, 2, output_cylinder_offset);

