
// Parameters for the central shaft
shaft_diameter = 10; // Diameter of the central shaft
shaft_length = 50;   // Length of the central shaft

// Central Shaft
module central_shaft() {
    cylinder(d = shaft_diameter, h = shaft_length, center = true);
}

// Render the central shaft
central_shaft();

