
// Parameters for the central shaft
shaft_length = 100; // Length of the shaft
shaft_diameter = 10; // Diameter of the shaft
hole_diameter = 3; // Diameter of the holes
hole_spacing = 30; // Distance between the two holes (center-to-center)

// Function to create the central shaft
module central_shaft() {
    // Create the main cylindrical shaft
    difference() {
        cylinder(h = shaft_length, d = shaft_diameter, center = true);
        
        // Create the first hole
        translate([0, 0, -hole_spacing / 2])
            rotate([90, 0, 0])
            cylinder(h = shaft_diameter + 2, d = hole_diameter, center = true);
        
        // Create the second hole
        translate([0, 0, hole_spacing / 2])
            rotate([90, 0, 0])
            cylinder(h = shaft_diameter + 2, d = hole_diameter, center = true);
    }
}

// Render the central shaft
central_shaft();

