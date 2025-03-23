
// Parameters for the central cylinder
cylinder_diameter = 50; // Diameter of the cylinder
cylinder_height = 20;   // Height of the cylinder

// Central cylinder
module central_cylinder() {
    cylinder(d = cylinder_diameter, h = cylinder_height, center = true);
}

// Render the central cylinder
central_cylinder();

