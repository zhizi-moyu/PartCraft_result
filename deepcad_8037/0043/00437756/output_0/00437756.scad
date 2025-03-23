
// Parameters for the central shaft
shaft_length = 100; // Length of the shaft
outer_diameter = 20; // Outer diameter of the shaft
inner_diameter = 10; // Inner diameter (hollow center)

// Function to create the central shaft
module central_shaft() {
    difference() {
        // Outer cylinder
        cylinder(h = shaft_length, d = outer_diameter, center = true);
        // Inner hollow cylinder
        cylinder(h = shaft_length + 2, d = inner_diameter, center = true);
    }
}

// Render the central shaft
central_shaft();

