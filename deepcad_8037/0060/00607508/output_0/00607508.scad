
// Parameters for the central_hub
base_diameter = 40; // Diameter of the flat base
base_height = 10;   // Height of the flat base
raised_diameter = 20; // Diameter of the raised central section
raised_height = 10;   // Height of the raised central section

// Central hub model
module central_hub() {
    // Base cylinder
    cylinder(h = base_height, d = base_diameter, center = true);
    
    // Raised central section
    translate([0, 0, base_height / 2])
        cylinder(h = raised_height, d = raised_diameter, center = true);
}

// Render the central hub
central_hub();

