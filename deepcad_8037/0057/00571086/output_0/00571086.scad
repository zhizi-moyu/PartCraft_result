
// Parameters for the central shaft
central_shaft_diameter = 20; // Diameter of the central shaft
central_shaft_length = 60;   // Length of the central shaft

// Central Shaft
module central_shaft() {
    cylinder(h = central_shaft_length, d = central_shaft_diameter, center = true);
}

// Render the central shaft
translate([0, 0, 0]) {
    central_shaft();
}

