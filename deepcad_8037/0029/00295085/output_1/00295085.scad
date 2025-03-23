
// Parameters for the base block
base_length = 40;  // Length of the rectangular base
base_width = 40;   // Width of the rectangular base
base_height = 8;   // Reduced height of the rectangular base to match the original model

// Parameters for the cylindrical extension
cylinder_diameter = 30;  // Diameter of the cylinder
cylinder_height = 20;    // Height of the cylinder
cylinder_wall_thickness = 2;  // Thickness of the cylinder wall

// Base block
module base_block() {
    cube([base_length, base_width, base_height], center = true);
}

// Cylindrical extension
module cylindrical_extension() {
    difference() {
        // Outer cylinder with smooth surface
        cylinder(h = cylinder_height, d = cylinder_diameter, center = true, $fn = 100); // Increased $fn for smoothness
        // Inner hollow cylinder
        cylinder(h = cylinder_height, d = cylinder_diameter - 2 * cylinder_wall_thickness, center = true, $fn = 100);
    }
}

// Full model
module flexible_coupling() {
    // Base block
    translate([0, 0, -base_height / 2])
        base_block();
    // Cylindrical extension
    translate([0, 0, base_height / 2])
        cylindrical_extension();
}

// Render the model
flexible_coupling();

