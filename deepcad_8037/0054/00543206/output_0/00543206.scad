
// Parameters for the central shaft
central_shaft_length = 50; // Length of the central shaft
central_shaft_diameter = 10; // Diameter of the central shaft

// Function to create a cylindrical shaft
module central_shaft() {
    cylinder(h = central_shaft_length, d = central_shaft_diameter, center = true);
}

// Render the central shaft
translate([0, 0, 0]) {
    central_shaft();
}

