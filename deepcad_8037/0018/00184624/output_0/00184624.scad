
// Parameters for the central shaft
shaft_length = 100; // Length of the shaft
shaft_diameter = 10; // Diameter of the shaft

// Central Shaft
module central_shaft() {
    cylinder(h = shaft_length, d = shaft_diameter, center = true);
}

// Render the central shaft
translate([0, 0, 0]) {
    central_shaft();
}

