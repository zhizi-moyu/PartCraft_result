
// Parameters for dimensions
input_cylinder_diameter = 22; // Adjusted diameter of the input cylinder to match the original model
input_cylinder_height = 25;  // Reduced height of the input cylinder to match the original model

central_cylinder_diameter = 30; // Diameter of the central cylinder remains unchanged
central_cylinder_height = 40;   // Height of the central cylinder remains unchanged

output_cylinder_diameter = 22; // Adjusted diameter of the output cylinder to match the original model
output_cylinder_height = 25;  // Reduced height of the output cylinder to match the original model

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

