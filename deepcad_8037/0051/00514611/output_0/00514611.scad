
// Dimensions
cylinder_diameter = 20;  // Assuming a diameter of 20 units for the cylindrical body
cylinder_height = 25;    // Assuming a height of 25 units for the cylindrical body
rect_proj_length = 15;   // Length of the rectangular projection
rect_proj_height = 12;   // Height of the rectangular projection
rect_proj_width = 10;    // Depth/width of the rectangular projection

// Main cylindrical body
module cylindrical_body() {
    cylinder(h = cylinder_height, d = cylinder_diameter, $fn = 100);
}

// Rectangular projection
module rectangular_projection() {
    translate([cylinder_diameter / 2, -rect_proj_width / 2, 0])
    cube([rect_proj_length, rect_proj_width, rect_proj_height]);
}

// Combine components
module flexible_coupling() {
    cylindrical_body();
    translate([0, 0, (cylinder_height - rect_proj_height) / 2]) // Center rectangular projection on cylindrical body
    rectangular_projection();
}

// Render the model
flexible_coupling();

