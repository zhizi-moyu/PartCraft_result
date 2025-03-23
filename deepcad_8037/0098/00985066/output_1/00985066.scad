
// Dimensions for the U-shaped bracket
base_length = 60;  // Length of the horizontal base
base_width = 20;   // Width of the horizontal base
base_thickness = 5; // Thickness of the horizontal base

side_wall_height = 40; // Height of the vertical side walls
side_wall_thickness = 5; // Thickness of the vertical side walls

module u_shaped_bracket() {
    // Horizontal base
    cube([base_length, base_width, base_thickness]);

    // Left vertical side wall (adjusted to be perfectly perpendicular)
    translate([0, 0, base_thickness])
        cube([side_wall_thickness, base_width, side_wall_height]);

    // Right vertical side wall (adjusted to be perfectly perpendicular)
    translate([base_length - side_wall_thickness, 0, base_thickness])
        cube([side_wall_thickness, base_width, side_wall_height]);
}

// Render the U-shaped bracket
u_shaped_bracket();

