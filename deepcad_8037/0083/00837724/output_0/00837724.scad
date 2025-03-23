
// Parameters for the key-shaped flat piece
key_thickness = 5; // Thickness of the piece
circle_diameter = 20; // Diameter of the circular head
rect_length = 30; // Length of the rectangular tail
rect_width = 10; // Width of the rectangular tail

module key_shaped_flat_piece() {
    // Circular head
    translate([0, 0, 0])
    cylinder(h = key_thickness, r = circle_diameter / 2, center = true);

    // Rectangular tail
    translate([-rect_length / 2, -rect_width / 2, 0])
    cube([rect_length, rect_width, key_thickness], center = false);
}

// Generate the model
key_shaped_flat_piece();

