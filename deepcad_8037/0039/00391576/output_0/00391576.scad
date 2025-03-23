
// Parameters for dimensions
input_cylinder_diameter = 20; // Diameter of the input cylinder
input_cylinder_height = 30;  // Height of the input cylinder

central_cylinder_diameter = 30; // Diameter of the central cylinder
central_cylinder_height = 40;   // Height of the central cylinder

output_cylinder_diameter = 20; // Diameter of the output cylinder
output_cylinder_height = 30;  // Height of the output cylinder

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

