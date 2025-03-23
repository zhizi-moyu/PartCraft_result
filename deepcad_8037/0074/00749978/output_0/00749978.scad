
// Parameters for the central shaft
shaft_diameter = 20; // Diameter of the central shaft
shaft_length = 60;   // Length of the central shaft

// Central Shaft
module central_shaft() {
    cylinder(d=shaft_diameter, h=shaft_length, center=true);
}

// Render the central shaft
translate([0, 0, 0]) {
    central_shaft();
}

