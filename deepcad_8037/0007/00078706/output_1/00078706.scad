
// Parameters for the central shaft
shaft_diameter = 10; // Diameter of the central shaft
shaft_length = 60;   // Length of the central shaft (elongated to match the original model)

// Central Shaft
module central_shaft() {
    // Removed tapering to ensure a consistent cylindrical shape
    cylinder(d = shaft_diameter, h = shaft_length, center = true);
}

// Render the central shaft
central_shaft();

