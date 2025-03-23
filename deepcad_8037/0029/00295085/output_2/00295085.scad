
// Parameters for the base block
base_length = 40;  // Length of the rectangular base
base_width = 40;   // Width of the rectangular base
base_height = 8;   // Height of the rectangular base

// Parameters for the cylindrical extension
cylinder_diameter = 30;  // Diameter of the cylinder
cylinder_height = 20;    // Height of the cylinder
cylinder_wall_thickness = 2;  // Thickness of the cylinder wall

// Parameters for the vertical support structures
support_width = 8;       // Width of the vertical supports
support_thickness = 4;   // Thickness of the vertical supports
support_height = base_height / 2 + cylinder_height / 2; // Height of the supports

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

// Vertical support structures
module vertical_supports() {
    for (angle = [0, 90, 180, 270]) {
        rotate([0, 0, angle])
        translate([cylinder_diameter / 2 - support_thickness / 2, 0, -base_height / 2])
        cube([support_thickness, support_width, support_height], center = true);
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
    // Vertical support structures
    vertical_supports();
}

// Render the model
flexible_coupling();

