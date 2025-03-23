
// Parameters for the key-shaped flat piece
key_thickness = 3; // Adjusted thickness of the piece to match the original model
circle_diameter = 20; // Diameter of the circular head remains unchanged
rect_length = 40; // Length of the rectangular tail increased to match the original model
rect_width = 8; // Width of the rectangular tail reduced to match the original model
transition_radius = 2; // Radius for smoothing the transition between the circular head and rectangular tail

module key_shaped_flat_piece() {
    // Circular head
    translate([0, 0, key_thickness / 2])
    cylinder(h = key_thickness, r = circle_diameter / 2, center = true);

    // Rectangular tail
    translate([-rect_length / 2, -rect_width / 2, 0])
    cube([rect_length, rect_width, key_thickness], center = false);

    // Smooth transition between circular head and rectangular tail
    translate([-rect_length / 2, 0, key_thickness / 2])
    rotate([90, 0, 0])
    cylinder(h = rect_width, r1 = transition_radius, r2 = transition_radius, center = true);
}

// Generate the model
key_shaped_flat_piece();

