
// Parameters for the central cylinder
cylinder_diameter = 20; // Diameter of the cylinder
cylinder_height = 10;   // Height of the cylinder

// Central cylinder
module central_cylinder() {
    cylinder(h = cylinder_height, d = cylinder_diameter, center = true);
}

// Render the central cylinder
central_cylinder();

